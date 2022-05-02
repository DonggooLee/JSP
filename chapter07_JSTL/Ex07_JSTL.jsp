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
	<c:set var="animals" value="사자,호랑이;사슴,곰;이구아나^뱀" />
	<!-- delims : 구분자를 넣으면 해당 구분자를 기준으로 나눈다  -->
	<c:forTokens var="animal" items="${animals}" delims=",;^">
		${animal}<br>
	</c:forTokens>
</body>
</html>