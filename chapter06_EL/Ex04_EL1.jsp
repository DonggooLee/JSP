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
		// 쿠키 생성
		Cookie cookie = new Cookie("name","홍길동");
		cookie.setMaxAge(60*10);
		response.addCookie(cookie);
	%>
	쿠키가 생성되었습니다.
</body>
</html>