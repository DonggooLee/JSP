<%@page import="org.ddongq.ex.GreenDao"%>
<%@page import="org.ddongq.ex.GreenDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		// 화면에서 입력받은 데이터를 "UTF-8" 인코딩
		request.setCharacterEncoding("UTF-8");
		// 화면에서 입력받은 데이터 변수에 저장
		String id = request.getParameter("id");
		// 아이디를 저장한 변수를 Dao 클래스의 getOneList 메소드에 던진후 결과를 리턴 받아 dto 객체에 저장
		GreenDto dto = GreenDao.getInstance().getOneList(id);
		// 해당 페이지에서 변수를 사용하기 위해 pageContext에 담기
		pageContext.setAttribute("dto", dto);
	%>
	<jsp:include page="index.jsp"/>
	<br><hr><br>
	<div>
		<h2><%=id %>의 정보</h2>
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
				<tr>
					<td>${dto.idx }</td>				
					<td>${dto.id }</td>				
					<td>${dto.pw }</td>				
					<td>${dto.name }</td>				
					<td>${dto.age }</td>				
					<td>${dto.addr }</td>	
					<!-- getter의 이름과 필드명이 달라서 일반 필드를 호출하면 오류가 난다. -->			
					<td>${dto.getDate() }</td>				
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>