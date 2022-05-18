<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.top-container {
		display: flex;
		align-items: center;
		justify-content: space-between;
		margin-top: 30px;
	}
	.top-container-right {
		display: flex;
		align-items: center;
	}
	.logo {
		text-decoration: none;
		font-family: serif;
		font-weight: bold;
		font-size: 40px;
		color: black;
	}
	table {
		border: 1px solid black;
		margin: auto;
		margin-top: 100px;
		padding: 20px;
	}
	tr, td{
		text-align: center;
		padding: 15px;
	}
	a{
		text-decoration: none;
		color: black;
		font-weight: bold;
	}
</style>
</head>
<body>
	<div class="top-container">
		<div>
			<a href="/side_project_donggoo/Controller?cmd=index" class="logo">${login_info.id}의 Velog </a>
		</div>
		<div class="top-container-right">
			<div><img src="./images/search.png" style="width: 30px; height: 30px;"></div>
			&nbsp;&nbsp;
			<c:choose>
				<c:when test="${not empty login_info.id && not empty login_info.pw}">
					<div>
						<a href='/side_project_donggoo/Controller?cmd=write_page'>새글작성</a>
						<a href="/side_project_donggoo/Controller?cmd=update_user_page">회원정보수정</a>
						<a href="/side_project_donggoo/Controller?cmd=logout">로그아웃</a>
					</div>
				</c:when>
				<c:otherwise>
					<div><button type="button" onclick="location.href='/side_project_donggoo/Controller?cmd=log_in_page'"><b>로그인</b></button></div>
				</c:otherwise>
			</c:choose>
		</div>
	</div> <!-- end : top-container -->
	<br><hr><br>
	<table>
		<tr>
			<th>게시글 번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
			<th>첨부파일</th>
			<th>삭제</th>
		</tr>
		<c:choose>
			<c:when test="${not empty board_list}">
				<c:forEach var="b_dto" items="${board_list}">
					<tr>
						<td>${b_dto.board_id }</td>
						<td><a href="/side_project_donggoo/Controller?cmd=update_board_page&board_id=${b_dto.board_id}">${b_dto.title }</a></td>
						<td>${b_dto.content }</td>
						<td>${b_dto.reg_date }</td>
						<td>${b_dto.filename }</td>
						<td>
							<a href="/side_project_donggoo/Controller?cmd=remove_board&board_id=${b_dto.board_id}">
								<img src="./images/deletebutton.png" style="width: 15px; height: 15px;">
							</a>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">게시글이 없습니다</td>
				</tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="5">
				<button onclick="location.href='/side_project_donggoo/Controller?cmd=index'">목록으로 이동</button>
			</td>
		</tr>
	</table>
</body>
</html>