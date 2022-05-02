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

	<h1>EL 이용해서 큰 수 출력하기</h1>
	${param.num1 - param.num2 > 0 ? param.num1 : param.num2}
	
	<h1>JSTL을 이용해서 큰 수 구하기-1</h1>
	<c:if test="${param.num1 - param.num2 gt 0}">
		${param.num1}
	</c:if>
	<c:if test="${param.num2 - param.num1 gt 0}">
		${param.num2}
	</c:if>
	
	<h1>JSTL을 이용해서 큰 수 구하기-2</h1>
	<c:choose>
		<c:when test="${param.num1 - param.num2 gt 0}">
			${param.num1} <br>
		</c:when>
		<c:otherwise>
			${param.num2} <br>
		</c:otherwise>
	</c:choose>
	
</body>
</html>