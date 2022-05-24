<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container_1{
		width: 1200px;
		text-align: center;
		margin: auto;
	}
	.container_2{
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		border: 1px solid black;
	}
	.top{
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		padding: 15px;
		align-items: center;
	}
	.bottom{
		padding: 15px;
	}
	a{
		text-decoration: none;
		color: black;
	}
</style>
</head>
<body>
	<div class="container_1">
		<h1>검색한 결과</h1>
		<c:forEach var="board_list" items="${board_list}">
			<div class="container_2">
				<div class="top">
					<div></div>
					<div style="font-size: 25px;"><b>${board_list.title}</b></div>
					<div>작성일 : ${board_list.reg_date}</div>
				</div>
				<div class="bottom">
					<div>
						<a href="/side_project_donggoo/Controller?cmd=view_page&board_id=${board_list.board_id}">${board_list.content}</a>
					</div>
				</div>
			</div>
			<br><hr><br>
		</c:forEach>
	</div><!-- end : container_1 -->
</body>
</html>