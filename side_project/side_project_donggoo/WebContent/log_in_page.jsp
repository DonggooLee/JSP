<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container{
		width: 500px;
		margin: auto;
		border: 1px solid black;
	}
	table{
		margin: auto;
	}
	h1{
		text-align: center;
	}
	a{
		text-decoration: none;
	}
	.btn{
		text-align: center;
	}
	.join{
		text-align: right;
	}
	td{
		padding: 10px;
	}
	#btn{
		padding: 7px;
	}
	#id, #pw{
		padding: 10px;
	}
</style>
<script type="text/javascript">
	function log_in(f) {
		if(f.id.value==""){
			alert("아이디를 입력하세요!");
			return
		}
		if(f.pw.value==""){
			alert("비밀번호를 입력하세요!");
			return
		}
		f.action = "/side_project_donggoo/Controller?cmd=log_in";
		f.submit();
	}
</script>
</head>
<body>
	<div class="container">
		<form method="post">
			<h1>로 그 인</h1>
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" id="id" placeholder="아이디 입력" size="40px" autofocus="autofocus"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" id="pw" placeholder="비밀번호 입력" size="40px"></td>
				</tr>
				<tr class="btn">
					<td colspan="2">
						<input type="button" value="로그인" id="btn" onclick="log_in(this.form)">
						<input type="reset" value="취소" id="btn">
					</td>
				</tr>
				<tr class="join">
					<td colspan="2">아직 회원이 아니신가요?&nbsp;<a href="/side_project_donggoo/Controller?cmd=register_page" style="color: #12b886;">회원가입</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>