package org.ddongq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.ddongq.dto.BoardDto;
import org.ddongq.mybatis.conf.DBService;

public class BoardDaoImpl implements BoardDao{
	// sqlSession 객체 생성(싱글톤)
	private static SqlSession sqlSession = null;
	private synchronized static SqlSession getSqlSession() {
		if ( sqlSession == null ) {
			sqlSession = DBService.getFactory().openSession();
		}
		return sqlSession;
	}
	// BoardDaoImpl 객체 생성(싱글톤)
	private static BoardDaoImpl instance = null;
	private BoardDaoImpl() {}
	public static BoardDaoImpl getInstance() {
		if(instance == null) {
			instance = new BoardDaoImpl();
		}
		return instance;
	}
	// 전역변수 result 초기화
	int result = 0;
	@Override
	public int getInsertBoard_(BoardDto dto) {
		result = getSqlSession().insert("insert_board", dto);
		if(result>0) {
			getSqlSession().commit();
		}
		return result;
	}
	@Override
	public List<BoardDto> getBoard_(int user_id) {
		return getSqlSession().selectList("select_board", user_id);
	}
	@Override
	public BoardDto getBoardIdx_(int board_id) {
		BoardDto dto = getSqlSession().selectOne("select_board_idx", board_id);
		return dto;
	}
	@Override
	public int getUpdateBoard_(BoardDto dto) {
		result = getSqlSession().update("update_board_idx", dto);
		if(result>0) {
			getSqlSession().commit();
		}
		return result;
	}
	@Override
	public int getRemoveBoard_(int board_id) {
		result = getSqlSession().delete("remove_board_idx", board_id);
		if(result>0) {
			getSqlSession().commit();
		}
		return result;
	}
}
