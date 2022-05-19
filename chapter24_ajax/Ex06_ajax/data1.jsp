<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery.ajax</title>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "data1.js", 			// 읽어올 정보(경로)
			dataType : "script",		// 읽을 정보의 타입
			type	: "get",			// 읽을 방식
			success : function() {		// 성공 시 할 일(콜백)
				alert("성공!");
				hi("안녕하세요");
			},
			error : function() {		// 에러 발생 시 할 일(콜백)
				alert("실패!");
			}
		});
	});
</script>
</head>
<body>
</body>
</html>