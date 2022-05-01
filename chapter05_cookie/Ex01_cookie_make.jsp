<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 1. 쿠키 만들기 (서버로 쿠키 만들기)
		// Cookie cookie = new Cookie("쿠키이름", "쿠키값");
		Cookie cookie = new Cookie("id", "admin");
		// 쿠키 유호기간 설정(1일 => 초단위)
		cookie.setMaxAge(60*60*24);
		// "쿠키 값"에 공백, 콤마, 괄호 등을 저장하려면 인코딩을 해야한다.
		Cookie bisket = new Cookie("name", URLEncoder.encode("제임스 본드","UTF-8"));
		// bisket 유호시간 20분 설정
		bisket.setMaxAge(60*20);
		response.addCookie(cookie);
		response.addCookie(bisket);
	%>
	<h1>
		쿠키 이름1 : <%=cookie.getName()%><br>
		쿠키 값1 : <%=cookie.getValue()%><br>

		쿠키 이름2 : <%=bisket.getName()%><br>
		쿠키 값2 : <%=URLDecoder.decode(bisket.getValue(),"UTF-8")%><br>
		<!-- Encoder와Decoder는 세트로 사용 -->
	</h1>
</body>
</html>