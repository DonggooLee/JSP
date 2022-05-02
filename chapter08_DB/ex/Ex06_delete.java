package org.ddongq.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import org.ddongq.db.DBConnect;

public class Ex06_delete {
	public static void main(String[] args) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnect.getConnection();
			String sql = "delete from sample where name=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,"김씨");
			int result = ps.executeUpdate(); // 삭제되면 1 리턴
			System.out.println(result > 0 ? "데이터 삭제 완료!" : "데이터 삭제 실패!");
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
