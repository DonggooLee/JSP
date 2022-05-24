<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	form{
		margin: auto;
		margin-top: 150px;
		width: 800px;
	}
</style>
</head>
<body>
	<form action="/side_project_donggoo/Controller?cmd=update_comment" method="post">
		<h2>수정할 댓글 입력</h2>
		<textarea name="comments" cols="100" rows="10" placeholder="댓글을 작성하세요" style="resize: none;"></textarea>
		<br><br>
		<input type="submit" value="댓글수정">
		<input type="hidden" value="${board_id}" name="board_id">
		<input type="hidden" value="${comment_id}" name="comment_id">
	</form>
</body>
</html>