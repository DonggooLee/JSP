<%@page import="java.util.List"%>
<%@page import="org.ddongq.mybatis.CDto"%>
<%@page import="org.ddongq.mybatis.BDao"%>
<%@page import="org.ddongq.mybatis.BDto"%>
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
	<%
		request.setCharacterEncoding("UTF-8");
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		String currentPage = request.getParameter("currentPage");
		// 내가 클릭한 제목에 해당하는 b_idx 값을 던져서 해당 b_idx 에 부합하는 데이터를 조회해서 가져오기
		BDto bdto = BDao.selectByIdx(b_idx);
		// 처음으로 열었을때만 조회수가 증가해야함. 게시물을 열때 session에 open이라는 값을 저장한다.
		// session에 open 값이 있으면 조회수를 증가시키지 않고, open값이 없으면 조회수를 증가시킨다.
		String open = (String)session.getAttribute("open");
		if(open==null){
			// open이 null이면 해당 게시물을 처음 열었다는 의미
			session.setAttribute("open", "YES"); 	// value값은 아무거나 상관없음!
			// 표시할 게시글의 기존 hit 수 + 1 처리를 한다.
			int hit = bdto.getHit() + 1;
			bdto.setHit(hit);						// hit가 증가된 bdto를 생성
			BDao.updateByIdxHit(bdto);
		}
		// 수정 및 삭제 페이지에서 사용하기 위해 session 객체에 담기
		session.setAttribute("bdto", bdto);
	%>
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
						<input type="button" value="게시글 수정하기" onclick="location.href='update_page.jsp'"/> &nbsp;&nbsp;
						<input type="button" value="게시글 삭제하기" onclick="location.href='remove_page.jsp'"/> &nbsp;&nbsp;
						<input type="button" value="목록으로 이동" onclick="location.href='index.jsp'"/>
						<!-- 현재 페이지 번호를 가지고 페이지 이동을 한다. -->
						<input type="hidden" name="currentPage" value="<%=currentPage%>"/>
					</td>
				</tr>
			</tbody>
		</table>
		<br><hr><br>
		<!-- 댓글을 입력하는 화면  -->
		<form action="insert_comment.jsp" method="post">
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
						<input type="hidden" name="b_idx" value="<%=b_idx%>">
						<input type="hidden" name="currentPage" value="<%=currentPage%>"/> 
					</td>
				</tr>
			</table>
		</form>
		<br><hr><br>
		<!-- 댓글을 출력하는 화면  -->
		<%
			List<CDto> list = BDao.getListComment(b_idx);
			pageContext.setAttribute("list", list);
		 %>
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
								<a href="remove_comment.jsp?c_idx=${cdto.c_idx}&b_idx=<%=b_idx%>&currentPage=<%=currentPage%>">
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