package org.joonzis.ex;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class GreenDao {
	// fields
	private SqlSessionFactory factory = null;
	
	// singleton
	private GreenDao() {
		factory = DBService.getFactory(); 		  // DBService 안에는 이미 DB를 연결해주고 있다
	}
	private static GreenDao dao = new GreenDao(); // GreenDao.getInstance() 호출하면 factory 객체를 생성한다 ()
	public static GreenDao getInstance() {
		return dao;
	}
	
	// 1. 전체 검색
	public List<GreenDto> getAllList() {
		SqlSession sqlsession = factory.openSession();
		List<GreenDto> list = sqlsession.selectList("select_all");
		sqlsession.close();
		return list;
	}
	
	// 2. 검색 (by id)
	public GreenDto getOneList(String id) {
		SqlSession sqlsession = factory.openSession();
		GreenDto dto = sqlsession.selectOne("select_by_id",id);
		sqlsession.close();
		return dto;
	}
	
	// 3. 삽입
	public int getInsert(GreenDto dto) {
		int result = 0;
		SqlSession sqlsession = factory.openSession();
		result = sqlsession.insert("insert", dto);
		if(result>0) {
			sqlsession.commit();
		}
		sqlsession.close();
		return result;
	}
	
	// 4. 삭제
	public int getRemove(GreenDto dto) {
		int result = 0;
		SqlSession sqlsession = factory.openSession();
		result = sqlsession.delete("remove", dto);
		if(result>0) {
			sqlsession.commit();
		}
		sqlsession.close();
		return result;
	}
	
	// 5. 수정할 페이지 보여주기
	public GreenDto getUpdateView(GreenDto dto) {
		SqlSession sqlsession = factory.openSession();
		GreenDto dto2 = sqlsession.selectOne("update_page",dto);
		sqlsession.close();
		return dto2;
	}
	
	// 7. 정보 변경을 위한 메소드 getUpdate()
	public int getUpdate(GreenDto dto) {
		int result = 0;
		SqlSession sqlsession = factory.openSession();
		result = sqlsession.update("update",dto);
		if(result>0) {
			sqlsession.commit();
		}
		sqlsession.close();
		return result;
	}
}
