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
		String pw = request.getParameter("pw");

		GreenDto dto = new GreenDto();
		dto.setId(id);
		dto.setPw(pw);
		
		int result = GreenDao.getInstance().getRemove(dto);
		pageContext.setAttribute("result", result);
	%>
	<c:choose>
		<c:when test="${result gt 0}" >
			<script type="text/javascript">
				alert("회원이 삭제되었습니다!");
				location.href="view_all.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("회원삭제에 실패했습니다!");
				history.go(-1);
			</script>		
		</c:otherwise>
	</c:choose>
</body>
</html>