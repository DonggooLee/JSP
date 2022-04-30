<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String addr = request.getParameter("addr");
	%>

	<h1>inclue2.jsp 페이지</h1>
	<div>
		이름 : <%=name %>
		나이 : <%=age %>
		주소 : <%=addr %>
	</div>
</body>
</html>