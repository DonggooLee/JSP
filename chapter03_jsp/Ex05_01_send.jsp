<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send(f) {
		f.action="/chapter03_jsp/Ex05_02_receive.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<form method="post">
		<h1>개인정보 전송하기</h1>
		<fieldset>
			<legend>개인정보</legend>	
			이름 <input type="text" name="name"><br>
			나이 <input type="number" name="age"><br>
			전화 <input type="text" name="tel"><br>
			성별 <input type="radio" name="gender" value="남" checked="checked">남
			<input type="radio" name="gender" value="여">여<br>
			취미
			<input type="checkbox" name="hobbies" value="영화">영화
			<input type="checkbox" name="hobbies" value="게임">게임
			<input type="checkbox" name="hobbies" value="독서">독서
			<input type="checkbox" name="hobbies" value="여행">여행
			<input type="checkbox" name="hobbies" value="기타">기타
			<input type="text" name="etc"><br>
			주소 
			<select name="addr">
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="인천">인천</option>
			</select><br>
			좋아하는 음식<br>
			<select name="foods" multiple="multiple">
				<option value="한식">한식</option>
				<option value="중식">중식</option>
				<option value="양식">양식</option>
				<option value="일식">일식</option>
			</select><br>
			<input type="hidden" name="nickname" value="짱구">
			<input type="button" value="보내기" onclick="send(this.form)">
			<input type="reset" value="작성취소">
		</fieldset>
	</form>
</body>
</html>