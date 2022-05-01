<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이전 JSP 표현식</h1>
	<ul>
		<li>7 + 2 = <%=7+2%></li>
		<li>7 - 2 = <%=7-2%></li>
		<li>7 * 2 = <%=7*2%></li>
		<li>7 / 2 = <%=7/2%></li>	<!-- 자바이기 때문에 정수만 나온다 -->
		<li>7 % 2 = <%=7%2%></li>
	</ul>
	
	<h1>EL 표현 언어</h1>
	<ul>
		<li>7 + 2 = ${7+2}</li>
		<li>7 - 2 = ${7-2}</li>
		<li>7 * 2 = ${7*2}</li>
		<li>7 / 2 = ${7/2}</li>
		<li>7 % 2 = ${7%2}</li>
	</ul>
	<hr>
	
	<h1>이전 JSP 변수저장</h1>
	<% int num = 100; %>
	num의 값 : <%= num %><br>
	
	<h1>EL 변수저장</h1>
	<% pageContext.setAttribute("num", 100);%>
	num의 값 : ${num}<br>
	<hr>
	
	<h1>EL에서 사용되는 4가지 속성의 우선 순위</h1>
	<%
		/* 
			같은 이름이 변수를 4가지 속성에 함께 저장하면
			우선 순위가 높은 변수가 사용된다.
			우선 순위가 높은 순서 : pageContext > request > session > application
		*/
		pageContext.setAttribute("car", "s-class");
		request.setAttribute("car", "e-class");
		session.setAttribute("car", "c-class");
		application.setAttribute("car", "a-class");
	%>
	<ul>
		<li>그냥 호출 : ${car}</li>
		<li>pageContext 호출 : ${pageScope.car}</li>
		<li>request 호출 : ${requestScope.car}</li>
		<li>session 호출 : ${sessionScope.car}</li>
		<li>application 호출 : ${applicationScope.car}</li>
	</ul>
</body>
</html>