package org.ddongq.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ddongq.dao.EmployeeDao;
import org.ddongq.dao.EmployeeDaoImpl;
import org.ddongq.dto.EmployeeDto;

public class EmployeeServiceImpl implements EmployeeService {
	private EmployeeDao dao = EmployeeDaoImpl.getInstance();
	@Override
	public List<EmployeeDto> getAll() {
		return dao.getAllEmployees();
	}
	@Override
	public List<EmployeeDto> getDept(HttpServletRequest request) {
		return dao.getEmployeeByDept(request);
	}
	@Override
	public List<EmployeeDto> getDynamic(HttpServletRequest request) {
		return dao.getEmployeeByDynamic(request);
	}
}
