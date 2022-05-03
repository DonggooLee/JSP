<%@page import="org.ddongq.ex.GreenDao"%>
<%@page import="org.ddongq.ex.GreenDto"%>
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
	<jsp:include page="view_all.jsp" />
	<br><hr><br>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		GreenDto dto = new GreenDto();
		dto.setId(id);
		dto.setPw(pw);
		
		int result = GreenDao.getInstance().getRemove(dto);
		pageContext.setAttribute("Result", result);
	%>
	<c:if test="${Result gt 0}">
		<script type="text/javascript">
			alert("회원이 삭제되었습니다.")		
			location.href = "view_all.jsp"
		</script>
	</c:if>
	<c:if test="${Result eq 0}">
		<script type="text/javascript">
			alert("회원 삭제를 실패했습니다. 다시 시도하세요.")		
			history.back();	
		</script>
	</c:if>
</body>
</html>