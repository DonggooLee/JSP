<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
<script type="text/javascript">
	function update_user(f) {
		if(f.login_pw.value!=${login_info.pw}){
			alert("로그인시 입력한 비밀번호와 다릅니다");
			return;
		}
		if(f.new_pw.value!=f.new_pw_ck.value){
			alert("수정할 비밀번호 일치하지 않습니다");
			return;
		}
		f.action = "/side_project_donggoo/Controller?cmd=update_user";
		f.submit();
	}
</script>
</head>
<body>
	<div>
		<form method="post">
			<h3>${login_info.name} 님의 회원정보 수정 페이지</h3>
			<table>
				<tr><th>이 름</th></tr>
				<tr><td>${login_info.name}</td></tr>
				<tr><th>이메일</th></tr>
				<tr><td><input type="text" name="email" class="in" placeholder="이메일을 입력하세요" value="${login_info.email}" size="40px"></td></tr>
				<tr><th>아이디</th></tr>
				<tr><td><input type="text" name="id" class="in" placeholder="아이디를 입력하세요" value="${login_info.id}" size="40px"></td></tr>
				<tr><th>기존 비밀번호</th></tr>
				<tr><td><input type="password" name="login_pw" class="in" placeholder="기존 비밀번호를 입력하세요" size="40px"></td></tr>
				<tr><th>수정할 비밀번호</th></tr>
				<tr><td><input type="password" name="new_pw" class="in" placeholder="비밀번호를 입력하세요" size="40px"></td></tr>
				<tr><th>수정할 비밀번호 확인</th></tr>
				<tr><td><input type="password" name="new_pw_ck" class="in" placeholder="수정한 비밀번호를 입력하세요" size="40px"></td></tr>
				<tr><th>한 줄 소개</th></tr>
				<tr><td><input type="text" name="introduce" class="in" placeholder="당신을 한 줄로 소개해보세요" value="${login_info.introduce}" size="40px"></td></tr>
			</table>
			<br>
			<div>
				<input type="reset" class="btn" value="최소">&nbsp;&nbsp;
				<input type="button" class="btn" value="수정" onclick="update_user(this.form)">
				<input type="hidden" name='user_id' value="${login_info.user_id}">
			</div>
		</form>
	</div>
</body>
</html>