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
		if(session.getAttribute("login_info")!=null){
			session.removeAttribute("login_info");
		}
		response.sendRedirect("/side_project_donggoo/Controller?cmd=index");
	%>
</body>
</html>