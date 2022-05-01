<%@page import="org.ddongq.bean.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- bean을 이용하여 Ex08_EL2.jsp로 데이터 전송 후 출력 -->
	<%
		StudentDTO stu = new StudentDTO();
		stu.setName("홍길동");
		stu.setDept("컴퓨터공학");
		stu.setNo("133178");
		stu.setAge(18);
		request.setAttribute("STU", stu);
	%>
	<jsp:forward page="Ex08_EL2.jsp"/>
</body>
</html>