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
				alert("댓글이 작성 되었습니다.");
				location.href="${pageContext.request.contextPath}/Controller?cmd=view&b_idx=${b_idx }";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("댓글 작성에 실패하였습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>