package org.ddongq.ex;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿 실행 
//호스트이름:포트번호/프로젝트이름/서블릿
//호스트이름:포트번호/ContextPath/URLMapping
//URLMapping 의 기본 값은 서블릿 이름이다.
//서블릿 이름 = 본명, URLMapping = 별명 (본명과 별명은 같을 수 있다!! 보통은 별명을 쓴다!!)

//예시) localhost:9090/chapter02_servlet/Ex01_servlet

//web.xml을 열어서 추가된 태그를 확인하자!

@WebServlet("/Ex01_servlet")	// <= URLMapping ()안에 부분을 의미
public class Ex01_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 1. 생성자 
    // 생성자 호출 뒤 -> init() 메소드가 자동으로 호출된다.
	public Ex01_servlet() {										
        super();	// 슈퍼클래스 생성자 호출 ( == HttpServlet)
        System.out.println("생성자 호출");
    }
	
	// 2. init() 메소드
	// servlet 생성 후 한 번만 호출된다.
	// 초기화 용도로 사용한다.
	// init() 메소드 호출 뒤 -> service() 메소드가 자동으로 호출된다.
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init()호출");
	}
	
	// 3. service() 메소드 ★★★
	// 매개변수 1 - httpServletRequest request : 요청 정보 (웹 브라우저 -> 웹 서버)  	--> 사용자가 입력한 내용들!
	// 예) 로그인 시 "아이디","비번" 입력 후 웹 서버에게 로그인 요청 -> request에는 "아이디","비번"이 모두 저장된다.
	// 매개변수 2 - httpServletResponse response : 응답 정보 (웹 서버 -> 웹 브라우저)	--> 사용자에게 돌아오는 응답된 내용들!
	// 예) 검색 시 검색 결과 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service() 호출");
		
		// 사용자 요청 정보(request)를 분석하여 get방식이면 doGet()메소드를 호출하고,
		// post방식이면 doPost()메소드를 호출하는 방식 
		
		// <form method="post">
		// <form method="POST">  대소문자 구분없이 처리하는 .equalsIgnoreCase() 사용
		System.out.println(request.getMethod());
		if( request.getMethod().equalsIgnoreCase("get") ) {
			doGet(request, response);											 
		} else {
			doPost(request, response);
		}
	}
		
	// 4. doGet()메소드
	// method를 지정하지 않거나, <form method="GET">인 경우 호출되는 메소드 이다.(기본값)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 실제 필요한 작업은 여기서 이루어진다.
		response.getWriter().append("Served at: ").append(request.getContextPath()); 	// ContextPath() : 프로젝트의 이름 
	}

	// 5. doPost() 메소드
	// <form method ="POST"> 인 경우 호출되는 메소드 이다.
	// 디폴트는 doGet()으로 처리 흐름을 바꾸게 되어있다.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 자신에게 전달된 request, response 정보를 다시 doGet()메소드에 전달한다.
		doGet(request, response);														
	}

	// 6. destroy() 메소드 
	// 웹 서버에서 어떤 프로젝트가 소멸(종료)되면 destroy()메소드가 호출된다.
	public void destroy() {
		System.out.println("destroy() 호출");
	}
}
