<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS 게시글 수정</title>
<style type="text/css">
	div {
		width: 800px;
		margin: auto;
		text-align: center;
	}
	table {
		width: 800px;
		text-align: left;
		border-collapse: collapse;		
	}
	td,th {
		border : 1px solid #1e90ff;
		padding: 10px;	
	}
	th {
		width: 100px;
		text-align: center;
		background-color: #0078ff;
		color: white;
	}
	tr:nth-of-type(6){
		text-align: center;
	}
	h1 {
		color : #0078ff;	
	}
</style>
<script type="text/javascript">
	function update(f){
		var pw = ${bdto.pw};		
		// var pw = ${dto.pw};  : number
		// var pw = "${dto.pw}"; : String
		// 비밀번호가 문자일 수 있으니 따옴표 표기를 해준다.
		if( f.pw.value != pw ) {
			alert("비밀번호가 다릅니다. 다시 입력해 주세요.");
			f.pw.focus();
			return;
		} 
		var choice = confirm("게시글 수정하시겠습니까?");
		if( choice ){
			f.action = "update.jsp";
			f.submit();
		} 
	}
</script>
</head>
<body>
	<div>
		<h2>${bdto.b_idx}번 게시글 수정</h2>
		<form method="post" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>	
						<th>작성자</th>
						<td>${bdto.writer}<input type="hidden" name="writer" value="${bdto.writer}"/></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" size="80" value="${bdto.title}"/></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pw" size="80"/></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="file" name="filename" />
							<c:choose>
								<c:when test="${bdto.filename eq null}">
									<c:set var="a" value="[ 기존 첨부 파일: 첨부파일 없음 ]"/>
									<c:out value="${a}"/>
								</c:when>
								<c:otherwise>
									<c:set var="b" value="[ 기존 첨부 파일: ${bdto.filename} ]"/>
									<c:out value="${b}"/>
									<input type="hidden" name="oldfile" value="${bdto.filename}">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="80" name="content" >${bdto.content}</textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="게시글 수정" onclick="update(this.form)"/> &nbsp;&nbsp;
							<input type="reset" value="다시 작성"/> &nbsp;&nbsp;
							<input type="button" value="목록으로 이동" onclick="location.href='index.jsp'"/>
							<%
								request.setCharacterEncoding("UTF-8");
								String currentPage = request.getParameter("currentPage");
							%>
							<!-- 현재 페이지 번호를 가지고 페이지 이동 한다! -->
							<input type="hidden" name="currentPage" value="<%=currentPage%>"/>
							<!-- update.jsp에게 넘겨줄 파라미터 b_idx(조건으로 사용)를 hidden 처리해서 넘기기 -->
							<input type="hidden" name="b_idx" value="${bdto.b_idx}"/>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>