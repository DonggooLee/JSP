package org.ddongq.ex;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex09_request")
public class Ex09_request extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex09_request() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// request 처리
		String operator = request.getParameter("operator");
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		int result;
		
		if(operator.equals("+")) { result = num1 + num2; }
		else if(operator.equals("-")) { result = num1 - num2 ; }
		else if(operator.equals("x")) { result = num1 * num2 ; }
		else { result = num1 / num2 ; }
		
		// response 처리
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("계산식");
		out.print("</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h1>");
		out.print(num1+ " " + operator + " " + num2 + " = " + result );
		out.print("</h1>");
		out.print("</body>");
		out.print("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
