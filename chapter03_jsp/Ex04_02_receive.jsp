<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String[] pet = request.getParameterValues("pet");
	String info = request.getParameter("info");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>이름 : <%=name%></li>
		<li>나이 : <%=age%></li>
		<li>반려동물 : 
			 <%if(pet!=null){
			 		for(int i=0; i<pet.length; i++){%>
			 			<%=pet[i]%>
			 		<%}
			 	}else{%>
			 		없음
			 <%}%>
		</li>
		<li>자기소개 : <%=info%></li>
	</ul>
</body>
</html>