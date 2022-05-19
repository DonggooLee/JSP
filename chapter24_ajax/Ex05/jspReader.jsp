<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_data.jsp 파일 읽기</title>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() { // onload
		$("#btn").click(function() { // 버튼 클릭이벤트
			// jQuery.load()
			// 주어진 url로부터 HTML 데이터를 받아서 선택된 객체에 넣어줌
			$("#content").load("jsp_data.jsp");
		}); // end click event
	}); // end onload
</script>
</head>
<body>
	<form>
		<input type="button" value="가져오기" id="btn"><br>
	</form>
	<div>
		<h1 style="color: blue;">jspReader.jsp입니다</h1>	
		<div id="content"></div>
	</div>
</body>
</html>