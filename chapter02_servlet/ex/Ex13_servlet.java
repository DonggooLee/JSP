package org.ddongq.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex13_servlet")
public class Ex13_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Ex13_servlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 현재 날짜 출력 코드 작성 후 연결
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("현재 날짜 출력하기");
		out.print("</title>");
		out.print("</head>");
		out.print("<body>");
		// --------------- 현재 날짜 ---------------
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		// --------------- 현재 날짜 ---------------
		out.print("<h1>");
		out.print(year + "년 " + month + "월 " + day + "일");
		out.print("</h1>");
		out.print("</body>");
		out.print("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
