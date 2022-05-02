<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		성적입력화면
		국어 : kor
		영어 : eng
		수학 : mat
		action=Ex04_JSTL2.jsp
	-->
	<form action="Ex04_JSTL2.jsp">
		<fieldset>
			<legend>성적입력화면</legend>		
			국어 : <input type="text" name=kor><br>
			영어 : <input type="text" name=eng><br>
			수학 : <input type="text" name=mat><br>
			<input type="submit" value="전송">
			<!-- 서브밋이 들어가면 파라미터로 리퀘스트가 전달된다!!! (반대는 Attribute) -->
		</fieldset>
	</form>
</body>
</html>