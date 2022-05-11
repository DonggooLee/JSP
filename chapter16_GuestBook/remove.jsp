<%@page import="org.ddongq.mybatis.guestBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%
	// GuestbookDto dto = (GuestbookDto)session.getAttribute("dto");
	request.setCharacterEncoding("UTF-8");
	// remove_page 버튼 아래에서 input type hidden 값을 주고 parameter로 넘기고 있다.
	int result = guestBookDao.removeByIdx(Integer.parseInt(request.getParameter("idx")));
	pageContext.setAttribute("result", result);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 삭제</title>
</head>
<body>
	<c:choose>
		<c:when test="${result gt 0}">
			<script type="text/javascript">
				alert("방명록이 삭제 되었습니다.");
				location.href="index.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("방명록 삭제가 실패하였습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>