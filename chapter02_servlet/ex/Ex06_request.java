package org.ddongq.ex;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex06_request")
public class Ex06_request extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Ex06_request() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	out.print("<html>");
    	out.print("<head>");
    	out.print("<title>");
    	out.print("</title>");
    	out.print("</head>");
    	out.print("<body>");
    	
    	/*
		 * request에 표함된 정보 확인하기
		 * 1. request에 포함된 정보는 "parameter" 라고 부른다.
		 * 2. "parameter"의 타입은 String 또는 String[]중 하나이다 ★★★
		 * 3. "parameter" 전달 방식
		 * 		호스트이름:포트번호/ContextPath/URLMapping?parameterName1=value1&parameterName2=value2 -> get 방식
		 * 4. "parameter" 정보를 확인하는 메소드
		 *		1) getParameter()			: 파라미터 값을 1개 받을 때
		 *			ex) <input type="text" name="uId">
		 *		2) getParameterValues()		: 파라미터 값을 여러 개 받을 때
		 *			ex) <input type="checkbox" >
		 *		3) getParameterMap()		: 파라미터 값이 Map 형식일 때
		 *		4) getParameterNames()		: 파라미터 이름을 여러 개 받을 때
		 */
    	
    	// requset는 일회용이라서 다시 던지려면 다시 생성해야 한다.
    	
    	// 1. 직접 url에 파라미터 전달하는 방법을 확인
    	// http://localhost:9090/chapter02_servelt/Ex06_request?name=김씨&age=100
    	String name = request.getParameter("name");
    	String age = request.getParameter("age");
    	out.print("<h1>");
    	out.print("전달된 이름은 " + name + "이고, 나이는 " + age + "입니다.");
    	out.print("</h1>");
    	
    	// 2. Ex06_request.html 파일에서 전달된 파라미터 확인
    	String query = request.getParameter("query");
    	out.print("<h1>");
    	out.print("전달된 값은 " + query + "입니다.");
    	out.print("</h1>");
    	
    	out.print("</body>");
    	out.print("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
