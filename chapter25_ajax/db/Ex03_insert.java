package org.ddongq.db;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex03_insert {

	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		String[] sqls = {
			"insert into member_t values (1, 'admin', '1111', '관리자', 'admin@myhome.com', '010-0000-0000', 'seoul')",
			"insert into member_t values (2, 'id01', '1111', '김철수', 'id01@myhome.com', '010-1111-1111', 'jeju')",
			"insert into member_t values (3, 'id02', '1111', '김영희', 'id02@myhome.com', '010-2222-2222', 'yangpyeong')",
			"insert into member_t values (4, 'id03', '1111', '최철수', 'id03@myhome.com', '010-3333-3333', 'incheon')",
			"insert into member_t values (5, 'id04', '1111', '최영희', 'id04@myhome.com', '010-4444-4444', 'sokcho')",
			"insert into member_t values (6, 'id05', '1111', '박철수', 'id05@myhome.com', '010-5555-5555', 'dokdo')"
		};
		int result = 0;
		int count = 0;
		
		try {
			conn = DBConnect.getConnection();
			for ( String sql : sqls ) {
				ps = conn.prepareStatement(sql);
				result = ps.executeUpdate();
				if ( result > 0 ) {
					System.out.println("추가가 성공하였습니다. 현재 " + (++count) + "명 회원 등록");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) { ps.close(); }
				if (conn != null) { conn.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}