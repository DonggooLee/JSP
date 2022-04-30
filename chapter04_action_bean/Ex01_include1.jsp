<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>include1.jsp 페이지</h1>
	
	<br><hr><br>
	
	<%-- 1. include 지시어 --%>
	<%@ include file="/Ex01_include2.jsp" %>		<!-- @는 지시어  -->
	
	<%-- 2. include 액션 태그 --%>
	<jsp:include page="/Ex01_include2.jsp">			<!-- 태그사이에 파라미터를 넣어 include할수 있다. -->
		<jsp:param name="name" value="홍길동" />
		<jsp:param name="age" value="20" />
		<jsp:param name="addr" value="강원도 양양" />
	</jsp:include>	
</body>
</html>