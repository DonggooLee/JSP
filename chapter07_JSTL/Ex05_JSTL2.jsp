<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String[] names = {"김씨","이씨","박씨","철씨","최씨"};
		// 동일한 페이지 내에서 값을 사용할 때 : pageContext 객체 이용하기
		pageContext.setAttribute("NAMES", names);
	%>
	<h1>향상 for문 형식의 forEach</h1>
	<!-- items : 배열 의미 -->
	<ul>
		<c:forEach var="name" items="${NAMES}">
			<li>${name }</li>	
		</c:forEach>
	</ul>
</body>
</html>