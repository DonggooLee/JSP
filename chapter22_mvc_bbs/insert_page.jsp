<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS 게시글 작성하기</title>
<style type="text/css">
	div {
		width: 800px;
		margin: auto;
		text-align: center;
	}
	table {
		width: 800px;
		text-align: left;
		border-collapse: collapse;		
	}
	td,th {
		border : 1px solid #1e90ff;
		padding: 10px;	
	}
	th {
		width: 100px;
		text-align: center;
		background-color: #0078ff;
		color: white;
	}
	#btn {
	text-align: center;
	}
	h1 {
		color : #0078ff;
	}
</style>
<script type="text/javascript">
	function insert_(){
		var f = document.forms.myForm;
		if(f.writer.value==""){
			alert("작성자를 입력하세요.");
			f.writer.focus();
			return false;
		}
		if(f.title.value==""){
			alert("제목 입력하세요.");
			f.title.focus();
			return false;
		}
		if(f.pw.value==""){
			alert("비밀번호를 입력하세요.");
			f.pw.focus();
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
	<div>
		<h2>BBS 게시글 작성</h2>
		<form name="myForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/Controller?cmd=insert" onsubmit="return insert_()">
			<table>
				<tbody>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="writer" size="80"/></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" size="80"/></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pw" size="80"/></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="filename"/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="80" name="content" placeholder="내용을 입력하세요."></textarea></td>
					</tr>
					<tr>
						<td colspan="2" id="btn">
							<input type="submit" value="게시글 저장"/> &nbsp;&nbsp;
							<input type="reset" value="다시 작성"/> &nbsp;&nbsp;
							<input type="button" value="목록으로 이동" onclick="location.href='${pageContext.request.contextPath}/Controller?cmd=allList'"/>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>