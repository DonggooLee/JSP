<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send1() {
		location.href = "/chapter20_mvc3/hangeul.do";
	}
	function send2() {
		location.href = "/chapter20_mvc3/english.do";
	}
</script>
</head>
<body>
	<form action="">
		<input type="button" value="안녕" onclick="send1()"><br>
		<input type="button" value="hello" onclick="send2()"><br>
	</form>
</body>
</html>