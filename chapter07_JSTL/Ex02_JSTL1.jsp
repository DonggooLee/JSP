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
	<!-- 변수를 request에 저장 -->
	<c:set var="name" value="홍길동" scope="request"/>
	<c:set var="addr" value="한양" scope="request"/>
	<c:set var="phone" value="010-9898-1515" scope="request"/>
	<jsp:forward page="Ex02_JSTL2.jsp"/>
</body>
</html>