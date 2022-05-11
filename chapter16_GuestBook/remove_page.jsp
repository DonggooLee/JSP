<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 삭제 확인</title>
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
		border : 1px solid #4169e1;
		padding: 10px;	
	}
	th {
		width: 150px;
		text-align: center;
		background-color: #6991e1;
		color: white;
	}
	tr:nth-of-type(3){
	text-align: center;
	}
</style>
<script type="text/javascript">
	function remove( f ){
		// 현재 방명록의 비밀번호
		var pw = "${dto.pw}";
		if(f.pw.value == ""){
			alert("방명록 작성시 설정한 비밀번호를 입력하세요.");
			f.pw.focus();
			return;
		} else if (f.pw.value != pw){
			alert("비밀번호가 다릅니다. 다시 입력하세요.");
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
		<h2>${dto.writer }의 방명록 삭제 확인</h2>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<th>제목</th>
						<td>${dto.title }</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="pw" size="80"/></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="방명록 삭제 " onclick="remove(this.form)">&nbsp;&nbsp;
							<input type="button" value="목록으로 이동" onclick="location.href='index.jsp'"/>
							<input type="hidden" name="idx" value="${dto.idx }"/>
						</td>
					</tr>					
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>