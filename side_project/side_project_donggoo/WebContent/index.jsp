<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.root{
		margin: auto;
		width: 1400px;
		padding-top: 30px;
		padding-bottom: 50px;
		/* border: 1px solid black; */
	}
	.wrap{
		display: flex;
		flex-wrap: wrap;
		justify-content: space-around;
	}
	.top-container, .top_menu {
		display: flex;
		align-items: center;
		/* 중간에 빈 공간을 만들어준다 */		
		justify-content: space-between;
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
	.contents_top  {
		display: flex;
		/* justify-content: center; */
		
		margin-top: 20px;
		justify-content: space-around;
	}
	#cont{
		margin: auto;
		width: 402px;	
		height: 400px;
	}
	.con_top{
		width: 400px;
		height: 200px;
		border: 1px solid black;
	}
	.con_mid{
		width: 400px;
		height: 170px;
		border: 1px solid black;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}
	.con_bottom{
		width: 400px;
		height: 30px;
		border: 1px solid black;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	a{
		text-decoration: none;
		color: black;
		font-weight: bold;
	}
	.c1{
		overflow: hidden;
		padding: 10px;
	}
	.top-container{
		transform: scale(1.4);
	}
	.wrap:hover {
		
	}
</style>
</head>
<body>
	<div class="root">
	
	
	
		<div class="top-container">
			<div>
				<a href="/side_project_donggoo/Controller?cmd=index" class="logo">Velog</a>
			</div>
			<div class="top-container-right">
				<div><img src="./images/search.png" style="width: 30px; height: 30px;"></div>
				&nbsp;&nbsp;
				<c:choose>
					<c:when test="${not empty login_info.id && not empty login_info.pw}">
						<div>
							<a href="/side_project_donggoo/Controller?cmd=write_page">새글작성</a>
							<a href="/side_project_donggoo/Controller?cmd=update_user_page">회원정보수정</a>
							<a href="/side_project_donggoo/Controller?cmd=my_post_page&user_id=${login_info.user_id }">내게시글</a>
							<a href="/side_project_donggoo/Controller?cmd=logout">로그아웃</a>
						</div>
					</c:when>
					<c:otherwise>
						<div><button type="button" onclick="location.href='/side_project_donggoo/Controller?cmd=log_in_page'"><b>로그인</b></button></div>
					</c:otherwise>
				</c:choose>
			</div>
		</div> <!-- end : top-container -->
		<br>
		<div class="top_menu">
			<div>트렌딩/정렬(시간순)/정렬(날짜순)</div>
			<div>:버튼(마우스이벤트)</div>
		</div>
		<br>
		
		<div class="wrap">
		<c:choose>
			<c:when test="${not empty login_info.id && not empty login_info.pw}">
				<!-- 보드 리스트의 길이(데이터 갯수) 구하기 -->
				<c:set var="board_length" value="${fn:length(board_list)}"/>
				<c:forEach var="board_list" begin="0" end="${board_length}" items="${board_list}" step="1">
					
					<div class="contents_top">
					
					 	<div id="cont">
					 		<div class="con_top" onclick="location.href='/side_project_donggoo/Controller?cmd=view_page&board_id=${board_list.board_id}'">
					 			<a><img src="upload/${board_list.filename}" width="100%" height="100%"></a>
					 		</div>
					 		<div class="con_mid" onclick="location.href='/side_project_donggoo/Controller?cmd=view_page&board_id=${board_list.board_id}'">
					 			<div class="c1">${board_list.content}</div>
					 			<div>${board_list.reg_date}</div>
					 		</div>
					 		<div class="con_bottom">
					 			<div>
					 				<c:set var="user_length" value="${fn:length(user_list)}"/>
					 				<c:forEach var="user_list" begin="0" end="${user_length}" items="${user_list}" step="1">
						 				<c:choose>
						 					<c:when test="${board_list.user_id eq user_list.user_id}">
						 						 Write by <b>${user_list.name}</b>
						 					</c:when>
						 				</c:choose>
					 				</c:forEach>
					 			</div>
					 			<div>
					 				조회수
					 			</div>
					 		</div>
					 	</div><!-- cont div 종료 -->
					</div>
				</c:forEach>
			</c:when>		
			<c:otherwise>
				<h1>게시글을 확인 하시려면 로그인을 해주세요 :)</h1>
			</c:otherwise>
		</c:choose>		
		
		
	</div>
	</div><!-- end : root -->
</body>
</html>