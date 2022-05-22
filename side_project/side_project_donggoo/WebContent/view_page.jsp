<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	.sub_info{
		display: flex;
		justify-content: space-between;
	}
	.mid-container{
		width: 1000px;
		margin: auto;
		border: 1px solid black;
		text-align: center;
	}	
	h1{
		font-size: 50px;
	}
	.sub_info{
		font-size: 20px;
	}
	
</style>
<title>Insert title here</title>
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
	</div>
	
	<div class="mid-container">
	
		<h1>${select_board.title}</h1>
		<br>
		<div class="sub_info">
			<div class="sub_info_1">
				<c:set var="user_length" value="${fn:length(user_list)}"/>
				<c:forEach var="user_list" begin="0" end="${user_length}" items="${user_list}" step="1">
					<c:choose>
						<c:when test="${select_board.user_id eq user_list.user_id}">
							${select_board.reg_date} · Write by ${user_list.id}
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
			<div class="sub_info_2">
			첨부파일 : ${select_board.filename }
			</div>
		</div>
		<br>
		<div class="content">
			${select_board.content }
		</div>

	</div> <!-- mid-container -->
	
	<hr>
	<div>
	
	</div>
	
	
	
</body>
</html>