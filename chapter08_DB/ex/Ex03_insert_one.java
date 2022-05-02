package org.ddongq.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import org.ddongq.db.DBConnect;

public class Ex03_insert_one {
	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnect.getConnection();
			String sql = "insert into sample (no, name, reg_date) " 
						+ "values (sample_seq.nextval, '홍길동', sysdate)";
			ps = conn.prepareStatement(sql);
			int result = ps.executeUpdate();
			// 삽입 성공하면 1 실패하면 0 이 넘어오기 때문에 ★★ (반영된 레코드 건수 반환)
			System.out.println(result > 0 ? "데이터 추가 완료!" : "데이터 추가 실패!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch (Exception e3) {
				e3.printStackTrace();
			}
		}
		
	}
}
