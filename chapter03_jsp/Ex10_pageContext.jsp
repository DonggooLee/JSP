<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
		메소드						리턴타입				설명
		getRequest()			ServletRequest		request 기본 객체를 구한다.
		getResponse()			ServletResponse		response 기본 객체를 구한다.
		getSession()			HttpSession			session 기본 객체를 구한다.
		getServletContext()		ServletContext		application 기본 객체를 구한다.
		getServletConfig()		ServletConfig		config 기본 객체를 구한다.
		getOut()				JspWriter			out 기본 객체를 구한다.
		getException()			Exception			exception 기본 객체를 구한다.
		getPage()				Object				page 기본 객체를 구한다.
	--%> 
	
	<%
		HttpServletRequest httpRequest = (HttpServletRequest)pageContext.getRequest(); 
		// 다운캐스팅 : pageContext.getRequest()로 가져오는 데이터 타입은 ServletRequest 그렇기 때문에 형변환
	%>
	request 기본 객체와 pageContext.getRequest()의 동일여부 : 
	<%=request == httpRequest%>
	<br>
	pageContext.getOut() 메소드를 사용한 데이터 출력 : 
	<%pageContext.getOut().print("안녕하세요");%>
</body>
</html>