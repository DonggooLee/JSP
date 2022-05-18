<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				alert("게시글이 삭제되었습니다");
				location.href="${pageContext.request.contextPath}/Controller?cmd=my_post_page&user_id=${login_info.user_id}";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("게시글 삭제에 실패했습니다");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>