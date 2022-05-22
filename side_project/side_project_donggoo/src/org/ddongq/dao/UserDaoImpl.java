package org.ddongq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.ddongq.dto.UserDto;
import org.ddongq.mybatis.conf.DBService;

public class UserDaoImpl implements UserDao{
	// sqlSession 객체 생성(싱글톤)
	private static SqlSession sqlSession = null;
	private synchronized static SqlSession getSqlSession() {
		if ( sqlSession == null ) {
			sqlSession = DBService.getFactory().openSession();
		}
		return sqlSession;
	}
	// UserDaoImpl 객체 생성(싱글톤)
	private static UserDaoImpl instance = null;
	private UserDaoImpl() {}
	public static UserDaoImpl getInstance() {
		if(instance == null) {
			instance = new UserDaoImpl();
		}
		return instance;
	}
	// 전역변수 result 초기화
	int result = 0;	
	// 회원가입
	@Override
	public int getInsertRegister(UserDto dto) {
		result = getSqlSession().insert("insert_register", dto);
		if(result>0) {
			getSqlSession().commit();
		}
		return result;
	}
	// 로그인 데이터 가져오기
	@Override
	public UserDto getUserRegister(UserDto dto) {
		UserDto dto_1 = getSqlSession().selectOne("select_login", dto);
		return dto_1;
	}
	// 로그인한 회원의 정보수정
	@Override
	public int getUpdateUser(UserDto dto) {
		result = getSqlSession().update("update_by_idx", dto);
		if(result>0) {
			getSqlSession().commit();
		}
		return result;
	}
	// 모든 회원조회
	@Override
	public List<UserDto> getUser_ALLRegister() {
		return getSqlSession().selectList("select_user_all");
	}
}
