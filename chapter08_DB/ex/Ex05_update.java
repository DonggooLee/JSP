package org.ddongq.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import org.ddongq.db.DBConnect;

public class Ex05_update {
	public static void main(String[] args) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnect.getConnection();
			String sql = "update sample set name=? where name=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "김씨");
			ps.setString(2, "홍길동");
			int result = ps.executeUpdate(); // 갱신되면 1 리턴
			System.out.println(result > 0 ? "데이터 갱신 완료!" : "데이터 갱신 실패!");
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
}
