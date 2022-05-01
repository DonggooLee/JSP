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
		String a = request.getParameter("num1");
		pageContext.setAttribute("num1", a); // Key: 명칭, Value: 값
		pageContext.setAttribute("num2", request.getParameter("num2"));
	%>
	num1 + num2 의 값 : ${num1+num2} <br>
	num1 - num2 의 값 : ${num1-num2} <br>
	num1 * num2 의 값 : ${num1*num2} <br>
	num1 / num2 의 값 : ${num1/num2} <br>
</body>
</html>