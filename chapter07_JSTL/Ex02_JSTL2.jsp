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
	이름 : ${name}<br>
	주소 : ${addr}<br>
	번호 : ${phone}<br>
	<hr>	<!-- c: out에 담으면 보안이 지켜짐 -->
	이름 : <c:out value="${name }"/><br>
	주소 : <c:out value="${addr }"/><br>
	번호 : <c:out value="${phone }"/><br>
</body>
</html>