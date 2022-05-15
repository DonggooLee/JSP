package org.ddongq.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.ddongq.dto.EmployeeDto;
import org.ddongq.mybatis.conf.DBService;

public class EmployeeDaoImpl implements EmployeeDao {
	// sqlSession 객체 생성(싱글톤)
	private static SqlSession sqlSession = null;
	private synchronized static SqlSession getSqlSession() {
		if ( sqlSession == null ) {
			sqlSession = DBService.getFactory().openSession();
		}
		return sqlSession;
	}
	// Dao 객체 생성(싱글톤)
	private static EmployeeDaoImpl instance = null;
	private EmployeeDaoImpl() {}
	public static EmployeeDaoImpl getInstance() {
		if(instance == null) {
			instance = new EmployeeDaoImpl();
		}
		return instance;
	}
	// 전체 직원 검색
	@Override
	public List<EmployeeDto> getAllEmployees() {
		List<EmployeeDto> list = getSqlSession().selectList("select_all");
		return list;
	}
	// 부서 검색
	@Override
	public List<EmployeeDto> getEmployeeByDept(HttpServletRequest request) {
		String department_id = request.getParameter("department_id");
		if(department_id == null || department_id.isEmpty()) {
			department_id = "10";
		}
		List<EmployeeDto> list = getSqlSession().selectList("select_by_dept",Integer.parseInt(department_id));
		return list;
	}
	// 동적 검색
	@Override
	public List<EmployeeDto> getEmployeeByDynamic(HttpServletRequest request) {
		String path = null;
		String key = request.getParameter("key");
		String value = request.getParameter("value");
		
		List<EmployeeDto> list = null;
		if(value == null || value.isEmpty()) {
			path = "input_dynamic.jsp";			// 아무것도 입력하지 않으면 입력화면으로 GO!
		}else {
			Map<String, String> map = new HashedMap<String, String>();
			map.put("key", key);
			map.put("value", value);			// 데이터의 이동경로 : dao -> map -> mapper
			list = getSqlSession().selectList("select_by_dynamic", map);
			request.setAttribute("list", list);
			request.setAttribute("key", key);
			path = "dynamicList.jsp";
		}
		return list;
	}
}
