<%@page import="org.ddongq.ex.GreenDao"%>
<%@page import="org.ddongq.ex.GreenDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String addr = request.getParameter("addr");
	
		GreenDto dto = new GreenDto();
		dto.setId(id);
		dto.setName(name);
		dto.setAge(Integer.parseInt(age));
		dto.setAddr(addr);		
		
		int result = GreenDao.getInstance().getUpdate(dto);
		pageContext.setAttribute("result", result);
	%>
	<c:choose>
		<c:when test="${result gt 0}" >
			<script type="text/javascript">
				alert("회원정보가 업데이트 되었습니다!");
				location.href="view_all.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("회원정보 업데이트에 실패했습니다!");
				history.go(-1);
			</script>		
		</c:otherwise>
	</c:choose>
</body>
</html>