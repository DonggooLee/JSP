package org.ddongq.ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GreenDao {

	// fields
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private String sql = ""; 
	
	// singleton
	private GreenDao() {
	}
	private static GreenDao dao = new GreenDao();
	public static GreenDao getInstance() {
		return dao;
	}
	
	// 1. DB와 연결하기
	private Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String user = "scott";
			String password ="tiger";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	// 2. green 테이블의 전체 목록을 리턴하는 getAllList() 메소드
	// GreenDto : 회원 1명 || List<GreenDto> : 회원 여러 명
	public List<GreenDto> getAllList(){
		List<GreenDto> list = new ArrayList<GreenDto>();
		try {
			conn = getConnection();
			// 쿼리문 작성 할 때 세미콜론(;) 넣지 않기 ★
			sql = "select * from green order by idx";
			// ps = 쿼리를 날리기 위한 객체
			// prepareStatement() => 쿼리를 날리기 위한 메소드
			ps = conn.prepareStatement(sql);
			// executeQuery() => 쿼리 실행 메소드
			rs = ps.executeQuery();
			// rs = 테이블 형태를 받기위한 객체 (행 단위로 넘어온다)
			// rs = 여러개의 GreenDto 객체가 저장된 상태
			// rs.next() = 행만큼 돈다
			while (rs.next()) {
				GreenDto dto = new GreenDto();
				// rs 에서 꺼내온 값을 dto 객체에 setter로 넣는다
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
			try {
				if( rs != null ) { rs.close(); }
				if( ps != null ) { ps.close(); }
				if( conn != null ) { conn.close(); }
			} catch ( Exception e ) { 
				e.printStackTrace();
			}
		}	
		return list;
	}
	
	
	// 3. 데이터 삽입 메소드 getInsert()
	public int getInsert(GreenDto dto) {
		int result = 0;
		try {
			conn = getConnection();
			// 오토커밋 : 비활성화
			conn.setAutoCommit(false);
			sql = "insert into green values (idx_seq.nextval, ?, ?, ?, ?, ?, sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			ps.setString(3, dto.getName());
			ps.setInt(4, dto.getAge());
			ps.setString(5, dto.getAddr());
			// executeUpdate() => 쿼리 실행 메소드, 결과값 : 실패=0 / 성공=1 
			result = ps.executeUpdate();
			if ( result > 0 ) {				
				conn.commit();	
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if( ps != null ) { ps.close(); }
				if( conn != null ) { conn.close(); }
			} catch ( Exception e ) { 
				e.printStackTrace();
			}
		}	
		return result;
	}
	
	
	// 4. 전달된 id로 검색하는 메소드 getOneList()
	public GreenDto getOneList(String id) {
		GreenDto dto = null;
		try {
			conn = getConnection();
			sql = "select * from green where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			// 전체 출력할 때와는 다르게 if문 으로 한번만 타면 된다.
			if ( rs.next() ) {	
				// rs에 값이 있을 때에만 dto 객체를 생성한다.
				dto = new GreenDto();		
				dto.setIdx( rs.getInt(1) );		
				dto.setId( rs.getString(2) );
				dto.setPw( rs.getString(3) );
				dto.setName( rs.getString(4) );
				dto.setAge( rs.getInt(5) );
				dto.setAddr( rs.getString(6) );
				dto.setDate( rs.getDate(7) );
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( rs != null ) { rs.close(); }
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	
	// 5. 전달된 id로 삭제하는 메소드 getRemove()
	public int getRemove(GreenDto dto) {
		int result = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			sql = "delete from green where id = ? and pw = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			result = ps.executeUpdate();
			if ( result > 0 ) {
				conn.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
	// 6. 수정을 위해 데이터를 green 테이블에서 가져오는 메소드 getUpdateView()
	public GreenDto getUpdateView(GreenDto dto) {
		GreenDto dto2 = null;
		try {
			conn = getConnection();
			sql = "select * from green where id = ? and pw = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			rs = ps.executeQuery();
			if ( rs.next() ) {				
				dto2 = new GreenDto();		
				dto2.setIdx( rs.getInt(1) );		
				dto2.setId( rs.getString(2) );
				dto2.setPw( rs.getString(3) );
				dto2.setName( rs.getString(4) );
				dto2.setAge( rs.getInt(5) );
				dto2.setAddr( rs.getString(6) );
				dto2.setDate( rs.getDate(7) );
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( rs != null ) { rs.close(); }
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dto2;
	}
	
	
	// 7. 정보 변경을 위한 메소드 getUpdate()
	public int getUpdate(GreenDto dto) {
		int result = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			sql = "update green set name=?, age=?, addr=? where id=? and pw=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setInt(2, dto.getAge());
			ps.setString(3, dto.getAddr());
			ps.setString(4, dto.getId());
			ps.setString(5, dto.getPw());
			result = ps.executeUpdate();
			if ( result > 0 ) {				
				conn.commit();	
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch ( Exception e ) { 
				e.printStackTrace();
			}
		}	
		return result;
	}
	
}
