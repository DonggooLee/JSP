<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container{
		margin-top: 130px;
	}
	div, table {
		margin: auto;
		text-align: center;
	}
	tr, td{
		padding: 10px;
	}
	input{
		size: 50px;
	}
	.in{
		padding: 10px;
	}
	.btn{
		padding: 7px;
	}
</style>
</head>
<body>
	<div class="container">
		<form action="/side_project_donggoo/Controller?cmd=register" method="post">
			<h1>환영합니다!</h1>
			<h3>기본 회원 정보를 등록해주세요</h3>
			<table>
				<tr><th>이 름</th></tr>
				<tr><td><input type="text" name="name" class="in" placeholder="이름을 입력하세요" size="40px"></td></tr>
				<tr><th>이메일</th></tr>
				<tr><td><input type="text" name="email" class="in" placeholder="이메일을 입력하세요" size="40px"></td></tr>
				<tr><th>아이디</th></tr>
				<tr><td><input type="text" name="id" class="in" placeholder="아이디를 입력하세요" size="40px"></td></tr>
				<tr><th>비밀번호</th></tr>
				<tr><td><input type="password" name="pw" class="in" placeholder="비밀번호를 입력하세요" size="40px"></td></tr>
				<tr><th>한 줄 소개</th></tr>
				<tr><td><input type="text" name="introduce" class="in" placeholder="당신을 한 줄로 소개해보세요" size="40px"></td></tr>
			</table>
			<br>
			<div>
				<input type="reset" class="btn" value="최소">&nbsp;&nbsp;
				<input type="submit" class="btn" value="가입">
			</div>
		</form>
	</div>
</body>
</html>