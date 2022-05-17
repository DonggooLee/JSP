<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS 게시물 보기</title>
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
		width: 130px;
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
	.insertComment th {
		border : 1px solid #1e90ff;
		width: 130px;
		text-align: center;
		background-color: #00a5ff;
		color: white;
	}
	.viewComment th {
		border : 1px solid #1e90ff;
		width: 130px;
		text-align: center;
		background-color: #87cefa;
		color: white;
	}
	.viewComment td{
		text-align: center;
	} 
	.viewComment #num  {
		width:50px;
	}
	.viewComment #writer  {
		width:100px;
	}
	.viewComment #con  {
		width:250px;
	}
	.viewComment #date  {
		width:100px;
	}
	.viewComment #del  {
		width:50px;
	}
	textarea {
		resize: none;
	}
</style>
</head>
<body>
	<div>
		<h2>${bdto.b_idx}번 게시글</h2>
		<table>
			<tbody>
				<tr>
					<th>작성자</th>
					<td>${bdto.writer }</td>
					<th>IP</th>
					<td>${bdto.ip }</td>	
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">${bdto.title }</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<c:choose>
						<c:when test="${bdto.filename eq null }">
							<td colspan="3">첨부파일 없음</td>
						</c:when>
						<c:otherwise>
							<td colspan="3"><a href="download.jsp?path=upload&filename=${bdto.filename }">${bdto.filename }</a></td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><pre>${bdto.content }</pre></td>
				</tr>
				<tr>
					<td colspan="4" id="btn">
						<input type="button" value="게시글 수정하기" onclick="location.href='/chapter22_mvc_bbs/Controller?cmd=update_page&b_idx=${bdto.b_idx}'"/> &nbsp;&nbsp;
						<input type="button" value="게시글 삭제하기" onclick="location.href='/chapter22_mvc_bbs/Controller?cmd=remove_page&b_idx=${bdto.b_idx}'"/> &nbsp;&nbsp;
						<input type="button" value="목록으로 이동" onclick="location.href='/chapter22_mvc_bbs/Controller?cmd=allList'"/>
					</td>
				</tr>
			</tbody>
		</table>
		<br><hr><br>
		<!-- 댓글을 입력하는 화면  -->
		<form action="/chapter22_mvc_bbs/Controller?cmd=insert_comment" method="post">
			<table class="insertComment">
				<tr>
					<th>댓글 작성자</th>
					<td><input type="text" name="writer"></td>
					<th>댓글 비밀번호</th>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<th>댓글 내용</th>
					<td colspan="3"><textarea rows="3" cols="80" name="content" placeholder="댓글을 입력하세요."></textarea></td>
				</tr>
				<tr>
					<td colspan="4" id="btn">
						<input type="submit" value="댓글등록">&nbsp;&nbsp;
						<input type="reset" value="다시작성">
						<input type="hidden" name="b_idx" value="${bdto.b_idx}">
					</td>
				</tr>
			</table>
		</form>
		<br><hr><br>
		<!-- 댓글을 출력하는 화면  -->
		<table>
			<tr>
				<th id="num">번호</th>
				<th id="writer">작성자</th>
				<th id="con">내용</th>
				<th id="date">작성일</th>
				<th id="del">삭제</th>
			</tr>
			<c:choose>
				<c:when test="${not empty list }">
					<c:forEach var="cdto" items="${list }">
						<tr>
							<td>${cdto.c_idx }</td>
							<td>${cdto.writer }</td>
							<td>${cdto.content }</td>
							<td>${cdto.reg_date }</td>
							<td>
								<a href="/chapter22_mvc_bbs/Controller?cmd=remove_comment&c_idx=${cdto.c_idx}&b_idx=${bdto.b_idx}">
									<img src="./images/deletebutton.png" style="width: 15px; height: 15px;">
								</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">댓글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>