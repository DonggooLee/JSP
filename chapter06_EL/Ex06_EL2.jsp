<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		EL로 표현할 수 있는 방법이 크게 2가지가 있다.
		1. 속성
		2. 파라미터
	 -->

	<%-- <h1>request의 attribute에 저장된 hobbies</h1>
	<ul>
		<li>${HOBBIES[0]}</li>
		<li>${HOBBIES[1]}</li>
		<li>${HOBBIES[2]}</li>
	</ul> --%>
	
	<h1>parameter에 저장된 hobbies</h1>
	<ul>
		<li>${paramValues.HOBBIES[0]}</li>
		<li>${paramValues.HOBBIES[1]}</li>
		<li>${paramValues.HOBBIES[2]}</li>
	</ul>
</body>
</html>