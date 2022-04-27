package org.ddongq.ex;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex10_page1")
public class Ex10_page1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Ex10_page1() {
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
		
		// <a>태그를 이용한 페이지 이동
		out.print("<br><br>");
		out.print("<a href='Ex10_page2'>request 없이 이동</a>");
		
		out.print("<br><br>");
		out.print("<a href='Ex10_page2?id="+id+"&pw="+pw+"'>request 가지고 이동</a>");
		
		out.print("</body>");
		out.print("</html>");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
