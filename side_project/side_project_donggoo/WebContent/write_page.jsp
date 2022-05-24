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
		margin: auto;
	}
</style>
<script type="text/javascript">
	function write_(){
		var f = document.forms.myForm;
		if(f.title.value==""){
			alert("제목을 입력하세요.");
			f.title.focus();
			return false;
		}
		if(f.filename.value==""){
			alert("첨부파일을 입력하세요.");
			f.filename.focus();
			return false;
		}
		if(f.content.value==""){
			alert("내용을 입력하세요.");
			f.content.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="container" >
		<form method="post" name="myForm" enctype="multipart/form-data" action="/side_project_donggoo/Controller?cmd=write" onsubmit="return write_()">
			<input type="text" name="title" placeholder="제목을 입력하세요" size="95px" style="padding: 10px;">
			<br><br>
			첨부사진 : <input type="file" name="filename"/>
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