<%@page import="org.ddongq.ex.GreenDao"%>
<%@page import="org.ddongq.ex.GreenDto"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택한 회원 정보</title>
</head>
<body>	
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		
		//SqlSessionFactory factory = DBService.getFactory();
		//SqlSession sqlSession = factory.openSession();
		
		//GreenDto dto = sqlSession.selectOne("select_by_id", id);
		GreenDto dto = GreenDao.getInstance().getOneList(id);
		
		pageContext.setAttribute("dto", dto);
	%>
	
	<jsp:include page="index.jsp" /><br /><hr/><br />
	
	<div>
		<h1>${param.id } 회원의 정보</h1>
		<table>
			<thead>
	 			<tr>
	 				<td>순번</td>
	 				<td>아이디</td>
	 				<td>성명</td>
	 				<td>비밀번호</td>
	 				<td>나이</td>
	 				<td>주소</td>
	 				<td>가입일</td>
	 			</tr>
 			</thead>
 			<tbody>
 				<c:choose>
 					<c:when test="${dto ne null }">
 						<tr>
							<td>${dto.idx }</td>
							<td>${dto.id }</td>
							<td>${dto.name }</td>
							<td>${dto.pw }</td>
							<td>${dto.age }</td>
							<td>${dto.addr }</td>
							<td>${dto.reg_date }</td>
						</tr>
 					</c:when>
 					<c:otherwise>
 						<tr>
 							<td colspan="7"> ${param.id } 회원의 정보가 없습니다.</td>
 						</tr>
 					</c:otherwise>
 				</c:choose>
 			</tbody>
		</table>
	</div>	
	<% // sqlSession.close(); %>
</body>
</html>