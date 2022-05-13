<%@page import="org.ddongq.mybatis.BDao"%>
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
	
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		int result = BDao.removeByIdxComment(c_idx);
		pageContext.setAttribute("result", result);
	%>
	<c:choose>
		<c:when test="${result gt 0}">
			<script type="text/javascript">
				alert("댓글이 삭제 되었습니다.");
				location.href="view.jsp?b_idx=<%=b_idx%>";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("댓글 삭제에 실패하였습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>