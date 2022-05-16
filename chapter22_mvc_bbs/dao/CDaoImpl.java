package org.ddongq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.ddongq.dto.CDto;
import org.ddongq.mybatis.conf.DBService;

public class CDaoImpl implements CDao{
	// sqlSession 객체 생성(싱글톤)
	private static SqlSession sqlSession = null;
	private synchronized static SqlSession getSqlSession() {
		if ( sqlSession == null ) {
			sqlSession = DBService.getFactory().openSession();
		}
		return sqlSession;
	}
	// CDao 객체 생성(싱글톤)
	private static CDaoImpl instance = null;
	private CDaoImpl() {}
	public static CDaoImpl getInstance() {
		if(instance == null) {
			instance = new CDaoImpl();
		}
		return instance;
	}
	// 전역변수 result 초기화
	int result = 0;
	
	@Override
	public List<CDto> getAllListCommnet(int b_idx) {
		List<CDto> list = getSqlSession().selectList("select_by_idx_comment", b_idx);
		return list;
	}
	@Override
	public int getInsertCommentBidx(CDto cdto) {
		result = getSqlSession().insert("insert_commment", cdto);
		if(result > 0 ) {
			getSqlSession().commit();
		}
		return result;
	}
	@Override
	public int getRemoveCommnetCidx(int c_idx) {
		result = getSqlSession().delete("remove_by_idx_comment", c_idx);
		if(result > 0 ) {
			getSqlSession().commit();
		}
		return result;
	}
}
