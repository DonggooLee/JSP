<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : ${param.id}
	<br><br>
	좋아하는 음식 : <br>
	${paramValues.favorites[0]}
	${paramValues.favorites[1]}
	${paramValues.favorites[2]}
	${paramValues.favorites[3]}
	${paramValues.favorites[4]}
</body>
</html>