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
		request.setCharacterEncoding("UTF-8"); 
		String name = request.getParameter("name");
		String age = request.getParameter("age");
	%>
	<h1>페이지 이동의 마지막 페이지 입니다.</h1>
	이름 = <%=name%><br>
	나이 = <%=age%><br>
	<hr>
</body>
</html>