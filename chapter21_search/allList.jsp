<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Empolyee 전체 직원 목록</title>
<style type="text/css">
	div {
		width: 800px;
		margin : auto;
		text-align: center;
	}
	
	table {
		width:800px;
		text-align: center;
		border-collapse: collapse;
	}
	
	th, td{
		border: 1px solid gray;
	}
	
	th {
		padding:5px;
		background: darkslateblue;
		color:white;
	}
</style>
</head>
<body>
	<div>
		<h1>전체 직원 목록</h1>
		<table>
			<thead>
				<tr>
					<th>직원ID</th>
					<th>성명</th>
					<th>연락처</th>
					<th>연봉</th>
					<th>부서ID</th>
					<th>고용일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list }">
					<c:forEach var="dto" items="${list }">
						<tr>
							<td>${dto.employee_id }</td>
							<td>${dto.first_name } ${dto.last_name }</td>							
							<td>${dto.phone_number }</td>
							<td><fmt:formatNumber value="${dto.salary }" pattern="#,##0만원" /></td>
							<td>${dto.department_id }</td>
							<td><fmt:formatDate value="${dto.hire_date }" pattern="yyyy년 MM월 dd일 E요일" /></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty list }">
					<tr>
						<td colspan="6">조건을 만족하는 직원이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>