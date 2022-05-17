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
	<c:choose>
		<c:when test="${result gt 0}">
			<script type="text/javascript">
				alert("새 게시글이 등록 되었습니다.");
				location.href="${pageContext.request.contextPath}/Controller?cmd=allList";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("새 게시글의 등록이 실패하였습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>