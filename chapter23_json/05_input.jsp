<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send(f) {
		f.action = "json.do";
		f.submit();
		// 서블릿에서 전달 받은 내용을
		// JSONObject 객체를 이용하여 
		// 06_output.jsp 로 전달하여 화면에 출력
	}
</script>
</head>
<body>
	<div>
		<form method="post">
			이름 : <input type="text" name="name"><br>
			나이 : <input type="text" name="age"><br>
			<input type="radio" name="isMarried" value="true">기혼
			<input type="radio" name="isMarried" value="false">미혼<br>
			<input type="button" value="전송" onclick="send(this.form)">
		</form>	
	</div>
</body>
</html>