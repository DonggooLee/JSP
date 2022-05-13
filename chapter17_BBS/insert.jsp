<%@page import="java.net.Inet4Address"%>
<%@page import="org.ddongq.mybatis.BDao"%>
<%@page import="org.ddongq.mybatis.BDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	/*
		데이터가 DB로 넘어가는 순서 : 
			insert_page -> insert.jsp -> BDao.java -> bbs.xml -> DB
			(insert_page에서 넘어온 parameter들은 insert.jsp에서 BDto로 만들어지고 그 후 BDao.java로 전달되고 그 후 bbs.xml로 전달된다!)
		데이터가 jsp로 돌아오는 순서 :
			DB -> bbs.xml -> BDao.java -> insert.jsp -> inpsert_page.jsp
			(bbs.xml에서 처리 후 Bdao.java로 전달되고 insert.jsp에서 결과에 따른 액션이 달라진다.)			
	*/
	
	// 1. insert_page.jsp 에서 넘어온 파라미터 처리(첨부파일 포함)
	String realPath = application.getRealPath("/upload");
	MultipartRequest mr = new MultipartRequest(
			request,											// 원래 받아야되는 request
			realPath, 											// 업로드 파일이 저장될 경로 
			1024*1024*10,										// 업로드 가능한 파일 사이즈
			"UTF-8",											// 인코딩
			new DefaultFileRenamePolicy()						// 동일한 이름의 파일 저장시 처리방법	
			);
	// 2. DB로 보낼 DTO 만들기
	BDto bdto = new BDto();
	bdto.setWriter(mr.getParameter("writer"));
	bdto.setTitle(mr.getParameter("title"));
	bdto.setContent(mr.getParameter("content"));
	bdto.setPw(mr.getParameter("pw"));
	bdto.setIp(Inet4Address.getLocalHost().getHostAddress());	// IPv4
	//bdto.setIp(request.getRemoteAddr());						// IPv6
	if (mr.getFile("filename") != null) {						// 먼저 저장된 파일 유무를 확인하고
		bdto.setFilename(mr.getFilesystemName("filename"));		// 파일의 원본 이름으로 확인
	} else {
		bdto.setFilename("");
	}
	// 3. DAO를 통해서 DTO를 전달해서 저장하기
	int result = BDao.getInsert(bdto);							
	pageContext.setAttribute("result", result);					// EL 사용을 위한 result 저장
	
	// 새 게시물을 정상적으로 삽입하고 index.jsp 페이지로 돌아가는 경우 
	// 첫 페이지로 이동시킨다
	
	/* 아래 코드 생략
	// insert_page.jsp에서 전달받은 currentPage로 이동하지 않을 수 있다.
	int totalRecord = 0;
	int totalPage = 0;
	int recordPerPage = 3;
	
	totalRecord = BDao.getTotalRecord();
	totalPage = totalRecord / recordPerPage;
	if( totalRecord % recordPerPage !=0 ){
		totalPage++;
	}
	String currentPage = totalPage + "";						// totalPage를 문자열로 만들기
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${result gt 0}">
			<script type="text/javascript">
				alert("새 게시글이 등록 되었습니다.");
				location.href="index.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("새 게시글의 등록이 실패하였습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>