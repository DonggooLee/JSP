<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	form {
		text-align: center;
		margin-top: 100px;
	}
	table {
		margin: auto;
		border: 1px solid black;
		width: 700px;
	}
	textarea{
		resize: none;
		size: 100px;
	}
	#title{
		size: 55px;
	}
</style>
</head>
<body>
	<form method="post" action = "/side_project_donggoo/Controller?cmd=update_board">
		<h1>게시글 수정</h1>
		<table>
			<tr>
				<th>게시글 번호</th>
				<th>${select_board.board_id}</th>
			</tr>
			<tr>
				<th>작성일</th>
				<th>${select_board.reg_date}</th>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${select_board.title}" size="55px" id="title"></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<c:choose>
					<c:when test="${select_board.filename eq null }">
						<td colspan="3">첨부파일 없음</td>
					</c:when>
					<c:otherwise>
						<td colspan="3">${select_board.filename}</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>			
				<th>게시글 내용</th>
				<td><textarea rows="30" cols="60" name="content">${select_board.content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정하기">&nbsp;&nbsp;
					<input type="reset" value="취소">
					<input type="hidden" name="user_id" value="${select_board.user_id}">
					<input type="hidden" name="board_id" value="${select_board.board_id}">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>