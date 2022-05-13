<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.ddongq.mybatis.BDao"%>
<%@page import="org.ddongq.mybatis.BDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String realPath = application.getRealPath("/upload");
	MultipartRequest mr = new MultipartRequest(
			request,
			realPath,
			1024 * 1024 * 10,
			"UTF-8",
			new DefaultFileRenamePolicy()
			);	
	BDto bdto = new BDto();
 	bdto.setB_idx( Integer.parseInt(mr.getParameter("b_idx")));	// BDto생성, view.jsp 이동에 사용
 	bdto.setWriter( mr.getParameter("writer") );
 	bdto.setTitle( mr.getParameter("title") );
 	bdto.setPw( mr.getParameter("pw") );
 	bdto.setContent( mr.getParameter("content") );
 	bdto.setIp( request.getRemoteAddr() );						// ip 확인은 mr이 아닌 request!!
 	/*
 		첨부 파일 수정
 		1. 기존 첨부가 있는 경우
 			1) 새 첨부가 없으면 기존 첨부 그대로 사용
 	 		2) 새 첨부가 있으면 기존 첨부 삭제 후 새 첨부 사용
 		2. 기존 첨부가 없는 경우
 			새 첨부 사용
 	*/
 	File newfile = mr.getFile("filename");				// 새 첨부 파일 (newfile)
 	String oldfile = mr.getParameter("oldfile");		// 기존 첨부 파일(oldfile)
	if(newfile != null ){ 								// 새 첨부 파일 O
		if( oldfile != null){							// 기존 첨부 파일 O
			File removefile = new File(realPath + "/" + oldfile);
			if ( removefile.exists() ){					// 기존 첨부 파일 유무 확인
				removefile.delete();					// 기존 첨부 파일 삭제
			}			
		}
		bdto.setFilename( newfile.getName() );			// 새 첨부 파일의 이름 가져오기
	} else {											// 새 첨부 파일 X
		if( oldfile != null){							// 기존 첨부 파일 O
			bdto.setFilename(oldfile);					// 기존 첨부 파일 이름 그대로 쓰기
		} else {
			bdto.setFilename("");						// 새 첨부 파일 X, 기존 첨부 파일 X
		}
	}
	int result = BDao.updateByIdx(bdto);
	pageContext.setAttribute("result", result);
 	String currentPage = mr.getParameter("currentPage");
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
				alert("게시글이 수정 되었습니다.");
				location.href="view.jsp?b_idx=${bdto.b_idx}&currentPage=<%=currentPage%>";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("게시글 수정을 실패하였습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>