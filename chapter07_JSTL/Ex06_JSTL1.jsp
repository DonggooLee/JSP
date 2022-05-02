<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Ex06_JSTL2.jsp">
		<h3>일반 forEach 연습</h3>
		최소 크기 : <input type="number" name="minSize" min="1" max="7"><br><br>
		최대 크기 : <input type="number" name="maxSize" min="1" max="7"><br><br>
		
		<hr>
		
		<h3>향상 forEach 연습</h3>
		<input type="checkbox" name="foodClass" value="한식">한식
		<input type="checkbox" name="foodClass" value="양식">양식
		<input type="checkbox" name="foodClass" value="중식">중식
		<input type="checkbox" name="foodClass" value="일식">일식
		<input type="checkbox" name="foodClass" value="뷴식">분식<br><br>
		
		<input type="submit" value="전송">
		<input type="reset" value="취소">
	</form>
</body>
</html>