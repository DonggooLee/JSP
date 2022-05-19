<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : ${obj.get("name")}<br>
	이름 : ${obj.name}<br>
	
	나이 : ${obj.get("age")}<br>
	나이 : ${obj.age}<br>
	
	결혼여부? : ${obj.get("isMarried")? "기혼" : "미혼"}<br>
	결혼여부? : ${obj.isMarried ? "기혼" : "미혼"}<br>
</body>
</html>