<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSON 데이터 타입</h1>
	<div id="output"></div>
	<script type="text/javascript">
		// JSON 데이터 타입
		// 문자열
		// 숫자
		// 객체(JSON 객체)
		// 배열
		// 논리형
		// NULL
		
		// 문자열
		var str = {"name":"kim"};
		
		// 숫자
		var num = {"age":20};
		
		// 객체
		var obj = {
			"employee" : {"name":"kim", "age":20, "city":"busan"}
		};
		
		// div 태그내에 직원의 이름과 나이 출력
		document.getElementById("output").innerHTML = obj.employee.name + "<br>";
		document.getElementById("output").innerHTML += obj.employee.age;
	</script>
</body>
</html>