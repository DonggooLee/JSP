package org.ddongq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ddongq.dto.EmployeeDto;
import org.ddongq.service.EmployeeService;
import org.ddongq.service.EmployeeServiceImpl;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. request, response 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 2. 파라미터 cmd 저장
		String paramCmd = request.getParameter("cmd");
		String cmd ="allList";
		if( paramCmd != null && !paramCmd.isEmpty() ) {
			cmd = paramCmd;
		}
		
		// 3. Service 객체 생성
		EmployeeService service = new EmployeeServiceImpl();
		
		// 3. 결과 값 담을 리스트 객체 생성
		List<EmployeeDto> list = null;
		
		// 4. 이동경로 path 알아내기
		String path = null;
		
		// 5. cmd 에 따른 model 선택
		switch( cmd ) {
			/* 단순 화면 이동 */
			case "inputDept" : 
				path = "input_dept.jsp";
				break;
			case "inputDynamic":
				path = "input_dynamic.jsp";
				break;
			/* DB 사용 */ 	
			case "allList" :
				list = service.getAll();
				path = "allList.jsp";
				break;			
			case "deptList" :
				list = service.getDept(request);
				path = "deptList.jsp";
				break;			
			case "dynamicList" :
				list = service.getDynamic(request);
				path = "dynamicList.jsp";
				//action = new DynamicListAction();
				break;
		}
		request.setAttribute("list", list);
		
		// 6. 이동하기
		request.getRequestDispatcher(path).forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
