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
</head>
<body>
	<jsp:include page="view_all.jsp" />
	<br><hr><br>
	<%
		// request로 받은 데이터를 dto 객체 생성 후 setter에 값을 넣고 dao클래스의 getInsert메소드에 매개변수로 던지기
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
		
		// dao클래스의 getInsert() 메소드를 통해 쿼리를 타고 리턴된 결과값을 result에 담는다
		int result = GreenDao.getInstance().getInsert(dto);
		pageContext.setAttribute("Result", result);
	%>
	<c:if test="${Result gt 0}">
		<script type="text/javascript">
			alert("회원이 추가되었습니다.")		
			location.href = "view_all.jsp"
		</script>
	</c:if>
	<c:if test="${Result eq 0}">
		<script type="text/javascript">
			alert("회원 추가를 실패했습니다. 다시 시도하세요.")
			history.go(-1);
		</script>
	</c:if>
</body>
</html>