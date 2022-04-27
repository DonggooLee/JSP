package org.ddongq.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex04_servlet")
public class Ex04_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex04_servlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
    	PrintWriter out = response.getWriter();
    	Calendar cal = Calendar.getInstance(); 

    	out.print("<html>");
    	out.print("<head>");
    	out.print("<title>");
    	out.print("나의 두번째 서블릿 페이지");
    	out.print("</title>");
    	out.print("</head>");
    	out.print("<body>");
    	out.print(cal.get(Calendar.YEAR)+"년 ");
    	out.print((cal.get(Calendar.MONTH)+1)+"월 ");
    	out.print(cal.get(Calendar.DATE)+"일 ");
    	out.print("</body>");
    	out.print("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
