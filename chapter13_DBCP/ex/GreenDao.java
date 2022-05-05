package org.ddongq.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GreenDao {

	// fields
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private String sql = "";

	// singleton
	private GreenDao() {}
	private static GreenDao dao = new GreenDao();
	public static GreenDao getInstance() {
		return dao;
	}

	// DBCP 설정
	private static DataSource ds;
	static {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
			// java:comp/env/ : 톰캣 (지정되어 있음),
			// jdbc/oracle : Resource name(변경가능)을 찾아서 DataSource 객체에 전달한다.
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	// DB 연결 : 새로운 DataSource로 인해 더 이상 사용되지 않는다!! (이미 context.xml에 저장되어 있고 ↑위에서 연결함!)
	/*
	private Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "james";
			String password = "bond";
			conn = DriverManager.getConnection(url, user, password);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	*/
	
	// select 문 닫기
	// 메소드명 : close1();
	// 매개변수 : ResultSet, PreparedStatement, Connection
	// 리턴타입 : 없음
	private void close1(ResultSet rs, PreparedStatement ps, Connection conn) {
		try {
			if (rs != null) {rs.close();}
			if (ps != null) {ps.close();}
			if (conn != null) {conn.close();}		// 커넥션의 반납
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// insert/update/delete 문 닫기
	// 메소드명 : close2();
	// 매개변수 : PreparedStatement, Connection
	// 리턴타입 : 없음
	private void close2( PreparedStatement ps, Connection conn) {
		try {
			if( ps != null ) { ps.close(); }
			if( conn != null ) {
				conn.setAutoCommit(true);			// 자동커밋 활성화
				conn.close(); 						// 커넥션의 반납		
			}	 		
		} catch(Exception e) {
			
		}
	}
	
	public List<GreenDto> getAllList() {
		List<GreenDto> list = new ArrayList<GreenDto>();
		try {
			// conn = getConnection(); -- 이전 커넥션 방식
			conn = ds.getConnection(); // 생성이 아니라 얻어옴
			sql = "select * from green order by idx";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				GreenDto dto = new GreenDto();
				dto.setIdx(rs.getInt("idx"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setAddr(rs.getString("addr"));
				dto.setDate(rs.getDate("reg_date"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close1(rs, ps, conn);
		}
		return list;
	}
	
}

