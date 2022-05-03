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
	<%-- <%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String addr = request.getParameter("addr");
	
		GreenDto dto = new GreenDto();
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		dto.setAge(Integer.parseInt(age));
		dto.setAddr(addr);
		
		int result = GreenDao.getInstance().getUpdate(dto);
		pageContext.setAttribute("Result", result);
	%> --%>
	<!-- 선생님 문제풀이 -->
	<jsp:useBean id="dto" class="org.ddongq.ex.GreenDto"/>
	<!-- GreenDto dto = new GreenDto(); -->
	<jsp:setProperty property="*" name="dto"/>
	<%-- 
	<jsp:setProperty property="pw" name="dto" value="${param.pw }"/>
	<jsp:setProperty property="name" name="dto" value="${param.name }"/>
	<jsp:setProperty property="age" name="dto" value="${param.age }"/>
	<jsp:setProperty property="addr" name="dto" value="${param.addr }"/>
	<jsp:setProperty property="id" name="dto" value="${param.id }"/>
	<jsp:setProperty property="reg_date" name="dto" value="${param.reg_date }"/> 
	--%>
	<% 
		int result = GreenDao.getInstance().getUpdate(dto);
		pageContext.setAttribute("Result", result);
	%>
	<c:if test="${Result gt 0}">
		<script type="text/javascript">
			alert("회원정보가 변경되었습니다.")		
			location.href = "view_all.jsp"
		</script>
	</c:if>
	<c:if test="${Result eq 0}">
		<script type="text/javascript">
			alert("회원정보 변경에 실패 했습니다.")
			history.go(-1);
		</script>
	</c:if>
</body>
</html>