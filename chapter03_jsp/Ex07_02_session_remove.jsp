<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type = request.getParameter("type");	// 데이터 받아오기
	session.removeAttribute(type);	// 세션에 받아온 특정 데이터 삭제
	response.sendRedirect("Ex07_01_session.jsp");
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