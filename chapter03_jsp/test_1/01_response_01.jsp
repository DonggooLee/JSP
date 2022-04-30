<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send(f) {
		f.action="01_response_02.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<h1>이동하고자 하는 사이트 명을 선택하고 확인 버튼을 누르세요</h1>
	<form>
		사이트명 : 
		<select name="addr">
			<option value="google">google</option>
			<option value="naver">naver</option>
			<option value="daum">daum</option>
		</select>
		<input type="submit" value="확인" onclick="send(this.form)">
	</form>
</body>
</html>