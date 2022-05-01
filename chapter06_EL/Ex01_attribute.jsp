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
		int total = 0;
		for(int i=1; i<=100; i++){
			total += i;
		}
		pageContext.setAttribute("TOTAL", total);
	%>
	<h1>1~100 사시의 모든 정수의 합은 <%=pageContext.getAttribute("TOTAL")%> 이다</h1>
</body>
</html>