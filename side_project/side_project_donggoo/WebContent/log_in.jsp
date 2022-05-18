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
		<c:when test="${not empty login_info.id && not empty login_info.pw}">
			<script type="text/javascript">
				alert("로그인에 성공했습니다.");
				location.href="${pageContext.request.contextPath}/Controller?cmd=index";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("로그인에 실패했습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>