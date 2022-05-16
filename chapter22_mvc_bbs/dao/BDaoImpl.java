package org.ddongq.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.ddongq.dto.BDto;
import org.ddongq.mybatis.conf.DBService;

public class BDaoImpl implements BDao{
	// sqlSession 객체 생성(싱글톤)
	private static SqlSession sqlSession = null;
	private synchronized static SqlSession getSqlSession() {
		if ( sqlSession == null ) {
			sqlSession = DBService.getFactory().openSession();
		}
		return sqlSession;
	}
	// BDao 객체 생성(싱글톤)
	private static BDaoImpl instance = null;
	private BDaoImpl() {}
	public static BDaoImpl getInstance() {
		if(instance == null) {
			instance = new BDaoImpl();
		}
		return instance;
	}
	// 전역변수 result 초기화
	int result = 0;

	@Override
	public int total_record_p() {
		result = getSqlSession().selectOne("total_record");
		return result;
	}
	@Override
	public List<BDto> getList_(Map<String, Integer> map) {
		List<BDto> list = getSqlSession().selectList("list_bbs", map);
		return list;
	}
	@Override
	public BDto getViewBidx(int b_idx) {
		BDto bdto = getSqlSession().selectOne("select_by_idx", b_idx);
		return bdto;
	}
	@Override
	public int getUpdateByHit(BDto bdto) {
		result = getSqlSession().update("update_by_idx_hit", bdto);
		if(result > 0 ) {
			getSqlSession().commit();
		}
		return result;
	}
	@Override
	public int getInsertBBS(BDto bdto) {
		result = getSqlSession().insert("insert_BBS", bdto);
		if(result > 0 ) {
			getSqlSession().commit();
		}
		return result;
	}
	@Override
	public int getUpdateBidx(BDto bdto) {
		result = getSqlSession().update("update_by_idx", bdto);
		if(result > 0 ) {
			getSqlSession().commit();
		}
		return result;
	}
	@Override
	public int getRemoveBidx(int b_idx) {
		result = getSqlSession().delete("remove_by_idx", b_idx);
		if(result > 0 ) {
			getSqlSession().commit();
		}
		return result;
	}
}
