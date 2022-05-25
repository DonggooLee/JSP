package org.ddongq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.ddongq.mybatis.config.DBService;
import org.ddongq.vo.MemberVO;

public class MemberDaoImpl implements MemberDao{

	// dao 객체 생성(싱글톤)
	private static MemberDaoImpl instance = null;
	private MemberDaoImpl() {}
	public static MemberDaoImpl getInstance() {
		if(instance == null) {
			instance = new MemberDaoImpl();
		}
		return instance;
	}
	
	// sqlSession 객체 생성(싱글톤)
	private static SqlSession sqlSession = null;
	private synchronized static SqlSession getSqlSession() {
		if ( sqlSession == null ) {
			sqlSession = DBService.getFactory().openSession();
		}
		return sqlSession;
	}
		
	@Override
	public List<MemberVO> getMember_() {
		return getSqlSession().selectList("list_member");
	}
	
}
