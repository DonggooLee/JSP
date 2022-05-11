<%@page import="org.ddongq.mybatis.guestBookDao"%>
<%@page import="org.ddongq.mybatis.guestBookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 보기</title>
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
		border : 1px solid #4169e1;
		padding: 10px;	
	}
	th {
		width: 100px;
		text-align: center;
		background-color: #6991e1;
		color: white;
	}
	tr:nth-of-type(7){
	text-align: center;
	}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		guestBookDto dto = guestBookDao.selectByIdx(idx);
		// session에 올려서 수정과 삭제할 때도 사용하자!
		session.setAttribute("dto", dto);
	%>
	<div>
		<h2>${dto.writer }의 방명록 </h2>
		<table>
			<tbody>
				<tr>
					<th>작성자</th>
					<td>${dto.writer }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${dto.title }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${dto.email }</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<c:choose>
						<c:when test="${dto.filename eq null }">
							<td>첨부파일 없음</td>
						</c:when>
						<c:otherwise>
							<td><a href="download.jsp?path=upload&filename=${dto.filename }">${dto.filename }</a></td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<th>내용</th>
					<td><pre>${dto.content }</pre></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${dto.reg_date }</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="방명록 수정" onclick="location.href='update_page.jsp'"/> &nbsp;&nbsp;
						<input type="button" value="방명록 삭제" onclick="location.href='remove_page.jsp'"/> &nbsp;&nbsp;
						<input type="button" value="목록으로 이동" onclick="location.href='index.jsp'"/>
					</td>
				</tr>
			</tbody>
		</table>	
	</div>		
</body>
</html>