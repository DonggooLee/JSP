<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		request.setCharacterEncoding("UTF-8"); 
		String name = request.getParameter("name");
		String age = request.getParameter("age");
	%>
	<h1>페이지 이동의 중간 페이지 입니다.</h1>
	이름 = <%=name%><br>
	나이 = <%=age%><br>
	<hr>
	<%-- 1. <a> 태그로 이동하기 --%>
	<a href="Ex06_03_page_move.jsp">parameter 전달하지 않기</a><br>
	<a href="Ex06_03_page_move.jsp?name=<%=name%>&age=<%=age%>">parameter 전달하기</a><br>
	<hr>
	<%-- 2. location.href 로 이동하기 --%>
	<input type="button" value="parameter 전달하지 않기" onclick="location.href='Ex06_03_page_move.jsp'"><br>
	<input type="button" value="parameter 전달하기" onclick="location.href='Ex06_03_page_move.jsp?name=<%=name%>&age=<%=age%>'"><br>
	<!-- 선생님 풀이 -->
	<button onclick="location.href='/chapter03_jsp/Ex06_03_page_move.jsp'">parameter 전달하지 않기</button><br>
	<button onclick="location.href='/chapter03_jsp/Ex06_03_page_move.jsp?name=<%=name%>&age=<%=age %>'">parameter 전달하기</button><br>
	<hr>
	<%-- 3. 포워드로 이동하기 --%>
	<%	
		// **forward
		// request 값을 유지하는 이동 방식 ★★★
		// URL을 통해서 페이지 이동 여부를 확인 할 수 없다. ★★★
		// 시스템 변경이 없는 경우 활용하는 방식 (ex.단순 검색, 게시 글 확인용)
		// "새로고침" 시 처리작업을 다시 수행해도 되는 경우에 활용하는방식이다.
		// <jsp:forward page="Ex06_03_page_move.jsp" />											// 액션 태그
	 	// pageContext.forward("Ex06_03_page_move.jsp");										// pageContext 객체
		// request.getRequestDispatcher("Ex06_03_page_move.jsp").forward(request, response);	// request 객체
	%>	
	<br><br>
	<hr>
	<%-- 4. 리다이렉트로 이동하기 --%>
	<%
		// **redirect
		// request값을 유지하지 않는 이동 방식 ★★★
		// URL을 통해서 페이지 이동 여부를 확인 할 수 있다.
		// 시스템 변경이 있는 경우 활용하는 방식 (ex. 회원가입, 로그인, 게시글 쓰기)
		// "새로고침" 시 처리작업을 다시 수행하면 안되는 경우에 활용하는 방식이다.
		// response.sendRedirect("/chapter03_jsp/Ex06_03_page_move.jsp");						// response 객체
	%>
</body>
</html>