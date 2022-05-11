package org.ddongq.mybatis;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

public class guestBookDao {
	
	// 필드
	private static SqlSession sqlsession = null;

	// singleton
	private synchronized static SqlSession getSqlSession() { 			// synchronized : 동기화 된 
		if(sqlsession == null) {
			// DBService.getFactory(); : factory						// factory를 선언하지말고 아예 sqlSession에서 만들자!
			sqlsession = DBService.getFactory().openSession(false);		// .openSession(false) : 수동 커밋 
		}
		return sqlsession;
	}
	
	// Method
	// 모든 메소드를 static 처리해서 별도 과정없이 GuestbookDao.메소드명()으로 불러서 사용 할 수 있다!!!
	// sqlSession이 필요하면 위에서 정의한 getSqlSession()를 호출하면 된다! 
	
	// 1. 전체검색
	public static List<guestBookDto> select_all(){
		return getSqlSession().selectList("select_all");		  
	}
	
	// 2. 방명록 작성
	public static int getInsert(guestBookDto dto) {
		int result = getSqlSession().insert("insert", dto);
		if(result > 0 ) {
			getSqlSession().commit();
		}
		return result;
	}
	
	// 3. 방명록 보기 (idx에 의한 검색)
	public static guestBookDto selectByIdx(int idx) {
		return getSqlSession().selectOne("select_by_idx", idx);
	}
	
	// 4. 방명록 삭제 (idx에 의한 삭제)
	public static int removeByIdx(int idx) {
		int result = getSqlSession().delete("remove_by_idx", idx);
		if(result > 0 ) {
			getSqlSession().commit();
		}
		return result;
	}
	
	// 5. 방명록 수정 (dto를 던지는 이유는 조건뿐 아니라 다른 값들도 집어넣어서 수정해야하기 때문)
	public static int updateByIdx(guestBookDto dto) {
		int result = getSqlSession().update("update_by_idx", dto); 
		if(result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
	
}
