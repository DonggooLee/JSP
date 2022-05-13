package org.ddongq.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ddongq.service.LanguageService;
import org.ddongq.service.LanguageServiceImpl;

@WebServlet("*.do")	// * => 모든내용을 받을 수 있다.
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
    	// 요청 확인
    	String requstURI = request.getRequestURI();				// 전체경로 : /chapter20_mvc3/xxxx.do
    	String contextPath = request.getContextPath();			// 컨텍스트 : /chapter20_mvc3
    	String cmd = requstURI.substring(contextPath.length()); // 요청확인 : /xxxx.do
    	
    	LanguageService service = new LanguageServiceImpl();
    	String result = null;
    	
    	switch (cmd) {
			case "/hangeul.do":
				result = service.executeHangeul();
				break;
			case "/english.do":
				result = service.executeEnglish();
				break;
		}
    	request.setAttribute("result", result);
    	request.getRequestDispatcher("view/output.jsp").forward(request, response);
    	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
