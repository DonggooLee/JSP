package org.ddongq.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/json.do")
public class JSONHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public JSONHandler() {
        super();
    }
    
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		JSONObject obj = new JSONObject();
		obj.put("name", request.getParameter("name"));
		obj.put("age", Integer.parseInt(request.getParameter("age")));
		obj.put("isMarried", Boolean.parseBoolean(request.getParameter("isMarried")));
		
		request.setAttribute("obj", obj);
		request.getRequestDispatcher("06_output.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
