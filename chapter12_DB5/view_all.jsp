<%@page import="org.ddongq.ex.GreenDao"%>
<%@page import="org.ddongq.ex.GreenDto"%>
<%@page import="java.util.List"%>
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
	<jsp:include page="index.jsp"/>
	<br><hr><br>
	<%
		// green 테이블의 전체 목록을 리턴하는 getAllList() 메소드 호출
		List<GreenDto> list = GreenDao.getInstance().getAllList();
		// 현재 페이지에서 출력할 것이기 때문에 pageContext 객체 사용
		pageContext.setAttribute("list", list);
	%>
	<div>
		<h1>전체 녹색 회원 목록</h1>
		<table>
			<thead>
				<tr>
					<th>순번</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>나이</th>
					<th>주소</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty list}">
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.idx }</td>
								<td>${dto.id }</td>
								<td>${dto.pw }</td>
								<td>${dto.name }</td>
								<td>${dto.age }</td>
								<td>${dto.addr }</td>
								<td>${dto.date }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">녹색회원이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>