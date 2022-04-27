package org.ddongq.ex;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex11_page1")
public class Ex11_page1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Ex11_page1() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// request 처리
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String result = "아이디 :" + id + ", 비밀번호 : " + pw;
		
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("</title>");
		out.print("</head>");
		out.print("</head>");
		out.print("<body>");
		
		out.print("<h1>페이지 - 1</h1>");
		out.print("<h1>"+result+"</h1>");
		
		// redirect를 이용한 페이지 이동
		// 기존 request에 저장된 파라미터 id, pw는 Ex11_page2에 일반적으로 전달되지 않는다(소멸)
		// ex) 기존페이지에서 로그인하면 다른페이지로 이동할때 redirect를 사용
		response.sendRedirect("/chapter02_servlet/Ex11_page2");
		
		out.print("</body>");
		out.print("</html>");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
