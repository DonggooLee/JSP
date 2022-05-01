<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>request의 attribute로 저장된 LIST</h1>
	<ul>
		<!-- 
			LIST의 각 인덱스 데이터,
			합계,
			평균,
			최대 값,
			최소 값,
			정렬,
			길이
		 -->
		<li>${LIST[0]}</li>
		<li>${LIST[1]}</li>
		<li>${LIST[2]}</li>
		<li>합계 : ${LIST.stream().sum()}</li>
		<li>평균 : ${LIST.stream().average().get()}</li>
		<li>최대 값 : ${LIST.stream().max().get()}</li>
		<li>최소 값 : ${LIST.stream().min().get()}</li>
		<li>정렬 : ${LIST.stream().sorted().toList()}</li>
		<li>길이 : ${LIST.stream().count()}</li>
	</ul>
</body>
</html>