<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container{
		width: 1000px;
	}
</style>
<!-- <script type="text/javascript">
	function write(f) {
		if(f.title.value==""||f.title.value==""){
			alert("모두 입력해주세요");
			return;
		}
		f.action="/side_project_donggoo/Controller?cmd=write"
		f.submit();
	}
</script> -->
</head>
<body>
	<div class="container">
		<form method="post" enctype="multipart/form-data" action="/side_project_donggoo/Controller?cmd=write">
			<input type="text" name="title" placeholder="제목을 입력하세요" size="95px" style="padding: 10px;">
			<br><br>
			첨부파일 : <input type="file" name="filename"/>
			<br><br>
			<textarea rows="45px" cols="100px" name="content" style="resize: none;" placeholder="당신의 이야기를 적어보세요..."></textarea>
			<br>
			<p>
				<input type="reset" value="다시작성">&nbsp;
				<input type="submit" value="글쓰기">
				<input type="hidden" name="user_id" value="${login_info.user_id}">
			</p>
		</form>
	</div>
</body>
</html>