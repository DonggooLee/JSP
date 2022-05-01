<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 좋아하는 숫자를 ArrayList에 담아서 Ex07_EL2.jsp로 보내기 -->
	<%
		List<Integer> list = new ArrayList<Integer>();
		list.add(7);				
		list.add(5);
		list.add(3);
		request.setAttribute("LIST", list);
	%>
	<jsp:forward page="Ex07_EL2.jsp"/>
</body>
</html>