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
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		GreenDto dto = new GreenDto();
		dto.setId(id);
		dto.setPw(pw);
		
		GreenDto rs_dto = GreenDao.getInstance().getUpdateView(dto);
		pageContext.setAttribute("dto", rs_dto);
	%>
	<jsp:include page="index.jsp"/>
	<br><hr><br>
	<div>
		<form>
			<!-- 표현식으로 사용하는 이유 : dto객체에 만약에 값이 안들어 가면 값을 가져올 수 없기 때문에 -->
			<h1>${param.id } 회원의 정보</h1>
			<table>
				<tbody>
					<c:choose>
						<c:when test="${not empty dto}">
							<tr>
								<td>순번</td>
								<td>${dto.idx}<input type="hidden" name="idx" value="${dto.idx }"></td>
							</tr>
							<tr>
								<td>아이디</td>
								<td>${dto.id}<input type="hidden" name="id" value="${dto.id }"></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>${dto.pw}<input type="hidden" name="pw" value="${dto.pw }"></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" name="name" value="${dto.name }"></td>
							</tr>
							<tr>
								<td>나이</td>
								<td><input type="text" name="age" value="${dto.age }"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input type="text" name="addr" value="${dto.addr }"></td>
							</tr>
							<tr>
								<td>가입일</td>
								<td>${dto.getDate()}<input type="hidden" name="reg_date" value="${dto.getDate() }"></td>
							</tr>
						</c:when>				
						<c:otherwise>
							<tr>
								<td colspan="2">${param.id } 회원의 정보가 없습니다</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>		
				<tfoot>
					<tr>
						<td colspan="2">
							<c:if test="${not empty dto }">
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