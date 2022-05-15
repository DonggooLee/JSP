package org.ddongq.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ddongq.dto.EmployeeDto;

public interface EmployeeService {
	public List<EmployeeDto> getAll();
	public List<EmployeeDto> getDept(HttpServletRequest request);
	public List<EmployeeDto> getDynamic(HttpServletRequest request);
}
