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
	<c:choose>
		<c:when test="${param.minSize lt param.maxSize}">
			<c:forEach var="i" begin="${param.minSize}" end="${param.maxSize}" step="1">
				<font size="${i}">
					폰트 사이즈 :  ${i}<br>
				</font>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<c:forEach var="i" begin="${param.maxSize}" end="${param.minSize}" step="1">
				<font size="${i}">
					폰트 사이즈 :  ${i}<br>
				</font>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<!-- 선생님 문제풀이 -->
	<%-- <c:choose>
		<c:when test="${param.num1 ge param.num2 }">
			<c:set var="start" value="${param.num2 }"/>
			<c:set var="end" value="${param.num1 }"/>
		</c:when>
		<c:otherwise>
			<c:set var="start" value="${param.num1 }"/>
			<c:set var="end" value="${param.num2 }"/>
		</c:otherwise>
	</c:choose>
	
	<c:forEach var="i" begin="${start}" end="${end}" step="1">
		<font size="${i}">
			폰트 사이즈 : ${i}<br>
		</font>
	</c:forEach> --%>
	<hr>
	<ul>
		<c:forEach var="food" items="${paramValues.foodClass}">
			<li>${food}</li>
		</c:forEach>
	</ul>
</body>
</html>