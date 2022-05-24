<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.root{
		width: 900px;
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
		border: 1px solid black;
	}
	#logo {
		text-decoration: none;
		font-family: serif;
		font-weight: bold;
		font-size: 40px;
		color: black;
	}
	.container_1_1{
		display: flex;
		align-items: center;
	}
	a{
		text-decoration: none;
		color: black;
		font-weight: bold;
	}
	h1{
		text-align: center;
	}
	.sub_info{
		text-align: right;
		margin-right: 10px;
	}
	.btn_comment{
		text-align: right;
	}
	.container_4{
		display: flex;
		flex-direction: column;
	}
	.comment_top{
		padding: 10px;
		font-size: 18px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.comment_bottom{
		padding: 10px;
		font-size: 20px;
	}
	.btn_index{
		text-align: center;
		margin-bottom: 30px;
	}
	#btn_comment{
		text-align: right;
		padding: 5px;
	}
	#count_comment{
		display: flex;
		text-align: left;
		align-items: center;
	}
	.bottom_comment{
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="root">
        <div class="container_1">
            <div>
                <a href="/side_project_donggoo/Controller?cmd=index" id="logo">Velog</a>
            </div>
            <div class="container_1_1">
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
        </div><!-- end : container_1 -->
        <br>
        <div class="container_2">
        	<h1>${select_board.title}</h1>
			<div class="sub_info">
				<c:set var="user_length" value="${fn:length(user_list)}"/>
				<c:forEach var="user_list" begin="0" end="${user_length}" items="${user_list}" step="1">
					<c:if test="${select_board.user_id eq user_list.user_id}">
						${select_board.reg_date} · Write by <b>${user_list.id}</b>
					</c:if>
				</c:forEach>
			</div>
			<br>
			<div class="content">
				<img src="upload/${select_board.filename}" width="100%" height="100%">
					${select_board.content}
				<hr>
			</div>
			<br>
			<div class="btn_index">
				<button onclick="location.href='/side_project_donggoo/Controller?cmd=index'" style="padding: 5px;">목록으로 이동</button>
			</div>
        </div><!-- end : container_2 -->
        <br><hr>
        <div class="container_3">
        	<form action="/side_project_donggoo/Controller?cmd=insert_comment" method="post">
        		<div><h2>댓 글</h2></div>
        		<textarea name="comment" cols="131" rows="10" placeholder="댓글을 작성하세요" style="resize: none;"></textarea>
        		<input type="hidden" name="user_id" value="${login_info.user_id}">
        		<input type="hidden" name="board_id" value="${select_board.board_id}">
        		<br><br>
        		<div class="bottom_comment">
	        		<div id="count_comment">
	        			<div><img src="./images/comment.jpg" style="width: 30px; height: 30px;"></div>
	        			<div><b>&nbsp;&nbsp;${comment_count}</b></div>
	        		</div>
	        		<div id="btn_comment"><input type="submit" value="댓글작성" style="padding: 5px;"></div>
        		</div>
        	</form>
        </div><!-- end : container_3 -->
         <br><hr><br>
        <div class="container_4">
      		<c:choose>
      			<c:when test="${not empty comment_list}">
      				<c:set var="comment_length" value="${fn:length(comment_list)}"/>
                    <c:forEach var="comment_list" begin="0" end="${comment_length}" items="${comment_list}" step="1">
						<c:forEach var="user_list" begin="0" end="${user_length}" items="${user_list}" step="1">
							 <c:if test="${comment_list.user_id eq user_list.user_id}">
								<div class="comment_top">
									<div class="comment_sub_info">
										Write by <b>${user_list.id}</b> · ${comment_list.reg_date}
									</div>
									<!-- 로그인한 사용자와 댓글의 사용자 고유 id값이 동일할 경우에만 수정 및 삭제 버튼이 활성화 -->
									<c:if test="${login_info.user_id eq comment_list.user_id}">
										<div>
											<a href="/side_project_donggoo/Controller?cmd=update_comment_page&comment_id=${comment_list.comment_id}&board_id=${select_board.board_id}">
												<img src="./images/update.jpg" style="width: 25px; height: 25px;">
											</a>
											&nbsp;&nbsp;
											<a href="/side_project_donggoo/Controller?cmd=remove_comment&comment_id=${comment_list.comment_id}&board_id=${select_board.board_id}">
												<img src="./images/delete.jpg" style="width: 25px; height: 25px;">
											</a>
										</div>
									</c:if>
								</div>
								<div class="comment_bottom">${comment_list.comments}</div>
								<br><br>
							 </c:if>
						</c:forEach>
                    </c:forEach>
      			</c:when>
       			<c:otherwise>
       				<h1>작성된 댓글이 없습니다</h1> 
       			</c:otherwise>
      		</c:choose>
        </div><!-- end : container_4 -->
	</div><!-- end : root -->
</body>
</html>