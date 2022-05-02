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
	<!-- JSTL을 이용하여 변수(avg) 생성 -->
	<c:set var="avg" value="${(param.kor+param.eng+param.mat)/3.0}"/>
	
	<!-- 
		JSTL을 이용하여 변수(pass) 생성 
		평균 60 이상 => 합격
		평균 60 미만 => 불합격
	-->
	<c:choose>
		<c:when test="${avg ge 90}">
			<c:set var="grade" value="A"/>
		</c:when>
		<c:when test="${avg ge 80}">
			<c:set var="grade" value="B"/>
		</c:when>
		<c:when test="${avg ge 70}">
			<c:set var="grade" value="C"/>
		</c:when>
		<c:otherwise>
			<c:set var="grade" value="F"/>
		</c:otherwise>
	</c:choose>
	
	<!-- JSTL을 이용해서 변수(grade) 생성 -->
	<c:choose>
		<c:when test="${avg ge 60}">
			<c:set var="pass" value="합격"/>
		</c:when>
		<c:otherwise>	<%-- <c:otherwise> : else 처럼 사용된다!! (조건이 들어가지 않음!!) --%>
			<c:set var="pass" value="불합격"/>
		</c:otherwise>
	</c:choose>
	
	<h1>성적 처리 결과</h1>
	<ul>
		<li>국어 : ${param.kor} 점</li>
		<li>영어 : ${param.eng} 점</li>
		<li>수학 : ${param.mat} 점</li>
		<li>평균 : ${avg} 점</li>
		<li>학점 : ${grade}</li>
		<li>합격여부 : ${pass}</li>
	</ul>
</body>
</html>