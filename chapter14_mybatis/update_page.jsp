<%@page import="org.joonzis.ex.GreenDao"%>
<%@page import="org.joonzis.ex.GreenDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function update(f) {
		if(f.name.value==""||f.age.value==""||f.addr.value==""){
			alert("수정할 항목을 모두 입력해주세요.");
			return;
		}
		f.action = "update.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<jsp:include page="index.jsp"/>
	<br><hr><br>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		GreenDto dto = new GreenDto();
		dto.setId(id);
		dto.setPw(pw);
		
		GreenDto dto2 = GreenDao.getInstance().getUpdateView(dto);
		pageContext.setAttribute("dto2", dto2);
	%>
	<div>
		<form>
			<!-- 표현식으로 사용하는 이유 : dto객체에 만약에 값이 안들어 가면 값을 가져올 수 없기 때문에 -->
			<h1><%=id%> 회원의 정보</h1>
			<table>
				<tbody>
					<c:choose>
						<c:when test="${not empty dto2}">
							<tr>
								<td>순번</td>
								<td>${dto2.idx}<input type="hidden" name="idx" value="${dto2.idx }"></td>
							</tr>
							<tr>
								<td>아이디</td>
								<td>${dto2.id}<input type="hidden" name="id" value="${dto2.id }"></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>${dto2.pw}<input type="hidden" name="pw" value="${dto2.pw }"></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" name="name" value="${dto2.name }"></td>
							</tr>
							<tr>
								<td>나이</td>
								<td><input type="text" name="age" value="${dto2.age }"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input type="text" name="addr" value="${dto2.addr }"></td>
							</tr>
							<tr>
								<td>가입일</td>
								<td>${dto2.reg_date}<input type="hidden" name="reg_date" value="${dto2.reg_date }"></td>
							</tr>
						</c:when>				
						<c:otherwise>
							<tr>
								<td colspan="2"><%=id%> 회원의 정보가 없습니다</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>		
				<tfoot>
					<tr>
						<td colspan="2">
							<c:if test="${not empty dto2 }">
								<input type="button" value="회원 정보 수정" onclick="update(this.form)">&nbsp;
								<input type="reset" value="다시작성">
							</c:if>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>