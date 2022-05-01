<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>STU에 저장된 데이터 사용하기-1</h1>
	<ul>
		<li>이름 : ${STU.getName()}</li>
		<li>학과 : ${STU.getDept()}</li>
		<li>학번 : ${STU.getNo}</li>
		<li>나이 : ${STU.getAge}</li>
	</ul>
	<hr>
	<h1>STU에 저장된 데이터 사용하기-2</h1>
	<ul>
		<li>이름 : ${STU.name}</li>	
		<li>학과 : ${STU.dept}</li>
		<li>학번 : ${STU.no}</li>
		<li>나이 : ${STU.age}</li>
		<!-- 필드가 private 처리됐지만 접근 가능한 이유: 필드를 호출하면 자동으로 getter를 읽어온다 -->
	</ul>
</body>
</html>