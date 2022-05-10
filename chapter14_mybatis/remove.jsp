<%@page import="org.ddongq.ex.GreenDao"%>
<%@page import="org.ddongq.ex.GreenDto"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
 <%
	request.setCharacterEncoding("utf-8");

	GreenDto dto = new GreenDto();
	dto.setId(request.getParameter("id"));
	dto.setPw(request.getParameter("pw"));   
%>
<!--
	// delete문의 커밋 처리 
	// 1. 수동 커밋을 사용 : openSession(false)
	// 2. 커밋		  : commit()
	// 3. 닫기		  : close()	
	
	
	SqlSessionFactory factory = DBService.getFactory();
	SqlSession sqlSession = factory.openSession(false);

	/*
	delete문의 메소드
	1. delete("sql문의 id")				- 
	2. deltet("sql문의 id", 파라미터) 
	
	*/	
	
	int result = sqlSession.delete("remove", dto);
	if( result > 0 ){
		sqlSession.commit();
		sqlSession.close();
		response.sendRedirect("view_all.jsp");
	} else {
		sqlSession.close();
%>
	<script type="text/javascript">
		alert("회원 삭제에 실패했습니다.");
		history.back();
	</script>
<% // } %>
-->
<%
	GreenDao dao = GreenDao.getInstance();
	int result = dao.getRemove(dto);
	
	if (result > 0) {
		out.println("<script>");
		out.println("alert('회원 삭제 성공!')");
		out.println("location.href='view_all.jsp'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('회원 삭제 실패!')");
		out.println("history.back()");
		out.println("</script>");
	}
%>



