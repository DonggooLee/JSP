package org.ddongq.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ddongq.dto.EmployeeDto;

public interface EmployeeDao {
	public abstract List<EmployeeDto> getAllEmployees();
	public abstract List<EmployeeDto> getEmployeeByDept(HttpServletRequest request);
	public abstract List<EmployeeDto> getEmployeeByDynamic(HttpServletRequest request);
}
