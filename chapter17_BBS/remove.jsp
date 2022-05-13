<%@page import="org.ddongq.mybatis.BDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	// remove_page 버튼 아래에서 input type hidden 값을 주고 parameter로 넘기고 있다.
	// session 에 이미 b_idx 값이 담겨있지만 Dao에 매개변수로 쿼리를 던지기 위해서 parameter로 받기
	int result = BDao.removeByIdx(Integer.parseInt(request.getParameter("b_idx")));
	pageContext.setAttribute("result", result);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${result gt 0}">
			<script type="text/javascript">
				alert("게시글이 삭제 되었습니다.");
				location.href="index.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("게시글 삭제가 실패하였습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>