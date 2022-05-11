<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 수정하기</title>
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
		text-align: center;
		background-color: #6991e1;
		color: white;
	}
	tr:nth-of-type(7){
	text-align: center;
	}
</style>
<script type="text/javascript">
	function update(f){
		// 현재 방명록의 비밀번호
		var pw = ${dto.pw};		
		// var pw = ${dto.pw};  : number
		// var pw = "${dto.pw}"; : String
		// 비밀번호가 문자일 수 있으니 따옴표 표기를 해준다.
		if( f.pw.value != pw ) {	// f.pw.value : 입력된 비밀번호
			alert("비밀번호가 다릅니다. 다시 입력해 주세요.");
			f.pw.focus();
			return;
		} 
		var choice = confirm("방명록을 수정하시겠습니까?");
		if( choice ){
			f.action = "update.jsp";
			f.submit();
		} 
	}
</script>
</head>
<body>
	<div>
		<h2>${dto.writer }의 방명록 수정</h2>
		<form method="post" >
			<table>
				<tbody>
					<tr>
						<th>번호</th>
						<td>${dto.idx }<input type="hidden" name="idx" value="${dto.idx }"/> </td>
					</tr>
					<tr>	
						<!-- view에서  idx를 받아왔으므로 다시  view로가려면 idx를 가져가야한다! -->
						<th>작성자</th>
						<td>${dto.writer }<input type="hidden" name="writer" value="${dto.writer }"/>  </td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" value=${dto.title } size="80" /></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="email" value=${dto.email } size="80"/></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="pw" size="80"/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="80" name="content" >${dto.content}</textarea></td>
						<!-- textarea에서는 value가 없고 textarea태그사이에 value값을 넣어주면 된다.  -->
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="방명록 저장" onclick="update(this.form)"/> &nbsp;&nbsp;
							<input type="reset" value="다시 작성"/> &nbsp;&nbsp;
							<input type="button" value="목록으로 이동" onclick="location.href='index.jsp'"/>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>