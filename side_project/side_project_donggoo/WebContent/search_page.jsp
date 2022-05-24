<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.root {
		width: 1400px;
		margin: auto;
		padding-top: 30px;
		padding-bottom: 50px;
	}
	.container_1{
		display: flex;
		align-items: center;
		justify-content: space-between;
	}
	.container_2{
		display: flex;
		align-items: center;
		border: 1px solid white;
		justify-content: space-between;
		width: 800px;
		margin: auto;
		margin-top: 300px;
	}
	.container_1_1 {
		display: flex;
		align-items: center;
	}
	#logo {
		text-decoration: none;
		font-family: serif;
		font-weight: bold;
		font-size: 40px;
		color: black;
	}
	a{
		text-decoration: none;
		color: black;
		font-weight: bold;
	}
	form {
		text-align: center;
		margin-top: 200px;
	}
	.search_con{
		size: 600px;
		padding: 30px;
		resize: none;
	}
</style>
<script type="text/javascript">
	function send(f) {
		f.action = "/side_project_donggoo/Controller?cmd=search";
		f.submit();
	}
</script>
</head>
<body>
	<div class="root">
		<div class="container_1">
			<div>
				<a href="/side_project_donggoo/Controller?cmd=index" id="logo">Velog</a>
			</div>
			<div class="container_1_1">
				<div>
					<a href="/side_project_donggoo/Controller?cmd=search_page"> 
						<img src="./images/search.png" style="width: 30px; height: 30px;">
					</a>
				</div>
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
						<div>
							<button type="button" onclick="location.href='/side_project_donggoo/Controller?cmd=log_in_page'">
								<b>로그인</b>
							</button>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div><!-- end : container_1 -->
		<form method="post">
			<div class="container_2">
				<div>
					<textarea rows="2" cols="100" name="search_con" class="search_con" placeholder="검색할 키워드를 입력하세요"></textarea>
				</div>
				<div>
					<button style="background-color: white; border: 1px solid white;" onclick="send(this.form);">
						<img src="./images/search.png" style="width: 30px; height: 30px;">
					</button>
				</div>
			</div><!-- end : container_2 -->
		</form>
	</div><!-- end : root -->
</body>
</html>