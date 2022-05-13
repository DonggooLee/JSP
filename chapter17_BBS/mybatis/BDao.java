package org.ddongq.mybatis;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;

public class BDao {
		// 필드
		private static SqlSession sqlsession = null;

		// singleton
		private synchronized static SqlSession getSqlSession() { 
			if(sqlsession == null) {
				// DBService.getFactory(); : factory						// factory를 선언하지말고 아예 sqlSession에서 만들자!
				sqlsession = DBService.getFactory().openSession(false);		// .openSession(false) : 수동 커밋 
			}
			return sqlsession;
		}
		
		// 전체 게시글 구하는 쿼리
		public static int getTotalRecord() {
			int result = getSqlSession().selectOne("total_record");
			return result;
		}
		
		// index
		public static List<BDto> getList(Map<String,Integer> map){
			List<BDto> list = getSqlSession().selectList("list_bbs", map);
			return list;
		}
		
		// view_page
		public static BDto selectByIdx(int b_idx) {
			return getSqlSession().selectOne("select_by_idx", b_idx);
		}
		
		// insert
		public static int getInsert(BDto bdto) {
			int result = getSqlSession().insert("insert", bdto);
			if(result > 0 ) {
				getSqlSession().commit();
			}
			return result;
		}
		
		// remove
		public static int removeByIdx(int b_idx) {
			int result = getSqlSession().delete("remove_by_idx", b_idx);
			if(result > 0 ) {
				getSqlSession().commit();
			}
			return result;
		}
		
		// update
		public static int updateByIdx(BDto bdto) {
			int result = getSqlSession().update("update_by_idx", bdto); 
			if(result > 0) {
				getSqlSession().commit();
			}
			return result;
		}
		
		// update_hit
		public static int updateByIdxHit(BDto bdto) {
			int result = getSqlSession().update("update_by_idx_hit", bdto); 
			if(result > 0) {
				getSqlSession().commit();
			}
			return result;
		}
		
		// 코멘트 추가
		public static int getInsertComment(CDto cdto) {
			int result = getSqlSession().insert("insert_commment", cdto);
			if(result > 0 ) {
				getSqlSession().commit();
			}
			return result;
		}
		
		// 코멘트 뷰
		public static List<CDto> getListComment(int b_idx){
			List<CDto> list = getSqlSession().selectList("select_by_idx_comment", b_idx);
			return list;
		}
		
		// 코멘트 삭제
		public static int removeByIdxComment(int c_idx) {
			int result = getSqlSession().delete("remove_by_idx_comment", c_idx);
			if(result > 0 ) {
				getSqlSession().commit();
			}
			return result;
		}
		
}
