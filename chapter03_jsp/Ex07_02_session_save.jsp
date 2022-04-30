<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에 데이터 저장
	session.setAttribute("name", "김씨");
	session.setAttribute("age", "20");
	response.sendRedirect("Ex07_01_session.jsp");	// 세션에 저장되기 때문에 바로 보내도 된다
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>