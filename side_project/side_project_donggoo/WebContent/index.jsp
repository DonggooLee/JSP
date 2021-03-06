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
	}
	#logo{
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
	.container_3{
		display: flex;
		flex-wrap: wrap;
		justify-content: space-around;
	}
	.content{
		display: flex;
		margin-top: 20px;
		justify-content: space-around;
		border-radius: 10px;
	}
	.content:hover{
		-webkit-transform:scale(1.1);
		cursor: pointer;
	}
	.content_top{
		width: 400px;
		height: 200px;
		border-bottom: 1px solid gray;
	}
	.content_mid{
		width: 400px;
		height: 170px;
		/* border: 1px solid black; */
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}
	.content_bottom{
		width: 400px;
		height: 30px;
		/* border: 1px solid black; */
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.content_bottom_sub{
		display: flex;
		align-items: center;
	}
	a{
		text-decoration: none;
		color: black;
		font-weight: bold;
	}
	#content_{
		border: 1px solid black;
	}
	.c1{
		padding: 8px;
		text-align: center;
		margin-top: 5px;
	}
	.c2{
		width : 390px;
		overflow: hidden;
		padding: 10px;
		text-overflow: clip;
		
	}
	.non_content{
		text-align: center;
		margin-top: 300px;
	}
	.truncate-text {
	    max-width: 390px; /** Adjust width to your needs */
	    display: inline-block;
	    vertical-align: middle;
	    overflow: hidden;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	}
</style>
</head>
<body>
	<div class="root">
        <div class="container_1">
            <div>
                <a href="/side_project_donggoo/Controller?cmd=index" id="logo">Velog</a>
            </div>
            <div class="container_1_1">
            	<c:choose>
            		<c:when test="${not empty login_info.id && not empty login_info.pw}">
		                <div>
		               		<a href="/side_project_donggoo/Controller?cmd=search_page">
		               			<img src="./images/search.png" style="width: 30px; height: 30px;">
		               		</a>
		                </div>
	               		&nbsp;&nbsp;
                        <div>
                            <a href="/side_project_donggoo/Controller?cmd=write_page">????????????</a>
                            <a href="/side_project_donggoo/Controller?cmd=update_user_page">??????????????????</a>
                            <a href="/side_project_donggoo/Controller?cmd=my_post_page&user_id=${login_info.user_id }">????????????</a>
                            <a href="/side_project_donggoo/Controller?cmd=logout">????????????</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div><button type="button" onclick="location.href='/side_project_donggoo/Controller?cmd=log_in_page'"><b>?????????</b></button></div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div><!-- end : container_1 -->
		<br>
        <div class="container_2">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="btn_order">
	            <a href="/side_project_donggoo/Controller?cmd=index_order_hit">
	           		<img src="./images/trending.jpg" style="width: 30px; height: 30px;">
	            </a>
            </div>
            &nbsp;&nbsp;/&nbsp;&nbsp;
           	<div class="btn_order">
           		<a href="/side_project_donggoo/Controller?cmd=index_order_reg">
           			<img src="./images/time.jpg" style="width: 30px; height: 30px;">
           		</a>
           	</div>
        </div><!-- end : container_2 -->
        <div class="container_3">
            <c:choose>
                <c:when test="${not empty login_info.id && not empty login_info.pw}"><!-- ??????????????? ?????? ?????? ????????? ?????? -->
                    <c:forEach var="board_list" items="${board_list}">
                        <div class="content">
                            <div id="content_">
                            	<!-- ????????? ????????? ?????? -->
                                <div class="content_top" onclick="location.href='/side_project_donggoo/Controller?cmd=view_page&board_id=${board_list.board_id}'">
                                    <a><img src="upload/${board_list.filename}" width="100%" height="100%"></a>
                                </div>
								<!-- ????????? ?????? ?????? -->
                                <div class="content_mid" onclick="location.href='/side_project_donggoo/Controller?cmd=view_page&board_id=${board_list.board_id}'">
                                    <div class="c1"><b>${board_list.title}</b></div>
                                    <div class="c2"><div class="truncate-text">${board_list.content}</div></div>
                                    <c:forEach var="count_list" items="${count_list}">
                                    	<!-- ?????????DB??? ????????? ???????????? ?????? DB??? ????????? ???????????? ???????????? ?????? -->
		                                <c:if test="${board_list.board_id eq count_list.board_id}">
                                   			<div>&nbsp;${board_list.reg_date} ?? <img src="./images/comment.jpg" style="width: 20px; height: 17px;"> ${count_list.count} ?????? ??????</div>
		                                </c:if>
                                    </c:forEach>
                                </div>
								<!-- ????????? ????????? ?????? -->
                                <div class="content_bottom">
                                    <div>
                                        <c:forEach var="user_list" items="${user_list}">
		                                    <c:if test="${board_list.user_id eq user_list.user_id}">
		                                   		&nbsp;Write by <b>${user_list.name}</b> 
		                                    </c:if>
                                        </c:forEach>
                                    </div>
                                    <div class="content_bottom_sub">
                                    	<div><img src="./images/view.jpg" style="width: 30px; height: 30px;"></div>
                                    	<div>${board_list.hit}&nbsp;&nbsp;</div>
                                    </div>
                                </div>
                            </div><!-- end : content_ -->
                        </div><!-- end : content -->
                    </c:forEach>
                </c:when>
                <c:otherwise><!-- ??????????????? ?????? ?????? ????????? ?????? X -->
                    <h1 class="non_content">???????????? ?????? ???????????? ???????????? ???????????? :)</h1>
                </c:otherwise>
            </c:choose>
        </div><!-- end : container_3 -->
    </div><!-- end : root -->
</body>
</html>