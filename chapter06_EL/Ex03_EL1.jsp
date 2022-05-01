<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Ex03_EL2.jsp">
		<h1>회원님의 좋아하는 음식을 알려주세요.</h1>
		<br><br>
		아이디 : <input type="text" name="id">
		<br><br>
		<input type="checkbox" name="favorites" value="한식">한식
		<input type="checkbox" name="favorites" value="양식">양식
		<input type="checkbox" name="favorites" value="중식">중식
		<input type="checkbox" name="favorites" value="일식">일식
		<input type="checkbox" name="favorites" value="기타">기타<br>
		<br><br>
		<input type="submit" value="전송">
		<input type="reset" value="취소">
	</form>
</body>
</html>