<%@page import="org.ddongq.ex.GreenDao"%>
<%@page import="org.ddongq.ex.GreenDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="index.jsp" /> 
	<br /><hr /><br />
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		GreenDto dto = 	GreenDao.getInstance().getOneList(id);
		pageContext.setAttribute("DTO", dto);
	%>
	<div>
		<h1><%=id %>의 정보</h1>
		<table>
			<thead>
				<tr>
					<th>순번</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>성명</th>
					<th>나이</th>
					<th>주소</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty DTO}">
						<tr>
							<td>${DTO.idx }</td>
							<td>${DTO.id }</td>
							<td>${DTO.pw }</td>
							<td>${DTO.name }</td>
							<td>${DTO.age }</td>
							<td>${DTO.addr }</td>
							<td>${DTO.date }</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">검색한 회원이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>	
</body>
</html>