<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.root{
		margin: auto;
		width: 1400px;
		height: 1200px;
		border: 1px solid black;
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
	.contents_top, .contents_mid, .contents_bottom {
		display: flex;
		/* justify-content: center; */
		margin-top: 20px;
		justify-content: space-around;
	}
	#cont{
		margin: auto;
		border: 1px solid black;
		width: 200px;	
		height: 300px;
		
	}
	.con_top{
		width: 400px;
		height: 150px;
		border: 1px solid black;
	}
	.con_mid{
		width: 400px;
		height: 100px;
		border: 1px solid black;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}
	.con_bottom{
		width: 400px;
		height: 50px;
		border: 1px solid black;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.drop_btn:hover .dropbtn_content{
		display: block;
	}
	a{
		text-decoration: none;
		color: black;
		font-weight: bold;
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
							<a href='/side_project_donggoo/Controller?cmd=write_page'>새글작성</a>
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
		<div class="contents_top">
		 	<div id="cont" onclick="send();">
		 		<div class="con_top">
		 			<a><img alt="" src="images/${vo.filename }"> 게시글 내부 이미지</a>
		 		</div>
		 		<div class="con_mid">
		 			<a>블로그 내부 컨텐츠</a>
		 			<div>서브 인포 (padding)</div>
		 		</div>
		 		<div  class="con_bottom">
		 			<div>
		 				아이디
		 			</div>
		 			<div>
		 				즐겨찾기
		 			</div>
		 		</div>
		 	</div>
		 	<div id="cont" onclick="send();">
		 		<div class="con_top">
		 			<a>게시글 내부 이미지</a>
		 		</div>
		 		<div class="con_mid">
		 			<a>블로그 내부 컨텐츠</a>
		 			<div>서브 인포 (padding)</div>
		 		</div>
		 		<div  class="con_bottom">
		 			<div>
		 				아이디
		 			</div>
		 			<div>
		 				즐겨찾기
		 			</div>
		 		</div>
		 	</div>
		 	<div id="cont" onclick="send();">
		 		<div class="con_top">
		 			<a>게시글 내부 이미지</a>
		 		</div>
		 		<div class="con_mid">
		 			<a>블로그 내부 컨텐츠</a>
		 			<div>서브 인포 (padding)</div>
		 		</div>
		 		<div  class="con_bottom">
		 			<div>
		 				아이디
		 			</div>
		 			<div>
		 				즐겨찾기
		 			</div>
		 		</div>
		 	</div>
		 </div><!-- end : contents_top -->
		 
	</div><!-- end : root -->
</body>
</html>