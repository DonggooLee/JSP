<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send(f) {
		f.action="/chapter03_jsp/Ex04_02_receive.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<form method="post">
		<fieldset style="width: 300px; border: 10px solid blue;">
			<legend style="color: blue;">개인 정보 전송</legend>	
			이름 <input type="text" name="name"><br>
			나이 <input type="number" name="age"><br>
			반려동물(
			<input type="checkbox" name="pet" value="강아지">강아지
			<input type="checkbox" name="pet" value="고양이">고양이
			<input type="checkbox" name="pet" value="돼지">돼지
			)<br><br>
			<textarea rows="5" cols="30" name="info" placeholder="자기소개" style="resize: none"></textarea><br><br>
			<input type="button" value="보내기" onclick="send(this.form)" style="text-align: center; background-color: yellow; padding: 10px">
		</fieldset>
	</form>
</body>
</html>