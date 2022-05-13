<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS 게시글 삭제하기</title>
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
		background-color: #0078ff;;
		color: white;
	}
	#btn {
		text-align: center;
	}
	h1 {
		color : #0078ff;;	
	}
</style>
<script type="text/javascript">
	function remove( f ){
		var pw = "${bdto.pw}";
		if(f.pw.value != pw){
			alert("비밀번호가 일치하지 않습니다. 다시 입력 하세요.");
			f.pw.focus();
			return;
		} else {
			var choice = confirm("정말 삭제하시겠습니까?");
			if( choice ){
				f.action = "remove.jsp";
			} else {
				f.action = "view.jsp";		
			}
		}
		f.submit();
	}
</script>
</head>
<body>
	<div>
		<h2>${bdto.b_idx }번 게시글 삭제</h2>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<th>작성자</th>
						<td>${bdto.writer }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${bdto.title }</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pw" size="80"/></td>
					</tr>
					<tr>
						<td colspan="2" id="btn">
							<input type="button" value="게시글 삭제 " onclick="remove(this.form)">&nbsp;&nbsp;
							<input type="reset" value="다시 작성" />&nbsp;&nbsp;
							<input type="button" value="목록으로 이동" onclick="location.href='index.jsp'"/>
							<%
								request.setCharacterEncoding("UTF-8");
								String currentPage = request.getParameter("currentPage");
							%>
							<!-- 현재 페이지 번호를 가지고 페이지 이동 한다! -->
							<input type="hidden" name="currentPage" value="<%=currentPage%>"/>
							<!-- remove.jsp에게 넘겨줄 파라미터 b_idx(조건으로 사용)를 hidden 처리해서 넘기자 -->
							<input type="hidden" name="b_idx" value="${bdto.b_idx }"/>
						</td>
					</tr>					
				</tbody>
			</table>
		</form>
	</div>

</body>
</html>