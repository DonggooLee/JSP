<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<style type="text/css">
	table {
		margin: 0 auto;
		border : 1px solid lightseagreen;
		font-family: 'Noto Sans KR', sans-serif;
	}
	thead {
		background-color: lightseagreen;
		color:white;
	}
	tfoot {
		background-color: lightseagreen;
	}
	td { 
		text-align: center;
		padding: 3px;
	}
	th {
		height: 30px;
		padding: 5px;
	}
	input[type=button],input[type=reset]  {
		background-color: lightseagreen;
		border: 1px solid white;
		padding: 5px;
		color:white;
	}
	input[type=button]:hover{
		background-color: white;
		color: lightseagreen;
		font-weight: bold;
	}
	input[type=reset]:hover{
		background-color: white;
		color: lightseagreen;
		font-weight: bold;
	}
</style>
<script type="text/javascript">
	// 1. 전체 검색
	function view_all() {
		location.href = "view_all.jsp";
 	}
	
	// 2. 검색(by id)
	function view_one( f ) {
		// id 검증 빈값 X
		if(f.id.value == ""){
			alert("아이디를 입력하세요")
			f.id.focus();
			return;
		}
		f.action = "view_one.jsp"
		f.submit();
	}
	
	// 3. 삽입
	function isert_one( f ) {
		// 전체 데이터 검증 후 전송
		if(f.id.value == ""){
			alert("아이디를 입력하세요")
			f.id.focus();
			return;
		}
		if(f.pw.value == ""){
			alert("비밀번호를 입력하세요")
			f.pw.focus();
			return;
		}
		if(f.name.value == ""){
			alert("비밀번호를 입력하세요")
			f.name.focus();
			return;
		}
		if(f.age.value == ""){
			alert("비밀번호를 입력하세요")
			f.age.focus();
			return;
		}
		if(f.addr.value == ""){
			alert("비밀번호를 입력하세요")
			f.addr.focus();
			return;
		}
		f.action = "insert.jsp"
		f.submit();
	}
	
	// 4. 삭제
	function remove_one( f ) {
		// 아이디 비번을 정확히 알면 삭제
		if(f.id.value == ""){
			alert("아이디를 입력하세요")
			f.id.focus();
			return;
		}
		if(f.pw.value == ""){
			alert("비밀번호를 입력하세요")
			f.pw.focus();
			return;
		}
		f.action = "remove.jsp"
		f.submit();
	}
			
	// 5. 수정 
	function update_page_go( f ) {
		// 아이디 비번을 정확히 알면 나머지 정보 수정
		if(f.id.value == ""){
			alert("아이디를 입력하세요")
			f.id.focus();
			return;
		}
		if(f.pw.value == ""){
			alert("비밀번호를 입력하세요")
			f.pw.focus();
			return;
		}
		f.action = "update_page.jsp"
		f.submit();
	}
</script>
</head>
<body>
	<form method="post">	<!-- 상황에 따라 이동하는 페이지가 다르므로 여기에 액션을 달지말자!!  -->
		<table>
			<thead>
				<tr>
					<th colspan="2"> 회원 정보관리</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" autocomplete="off"/></td>	<!-- DB생성시에 적은 항목들과 이름을 맞춰주자! -->
				</tr>		
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" /></td>
				</tr>			
				<tr>
					<td>성명</td>
					<td><input type="text" name="name" /></td>
				</tr>			
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" /></td>
				</tr>			
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" /></td>
				</tr>			
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2">
						<input type="button" value="전체보기" onclick="view_all()"/>&nbsp;&nbsp;
						<input type="button" value="검색" onclick="view_one(this.form)"/>&nbsp;&nbsp;
						<input type="button" value="삽입" onclick="isert_one(this.form)"/>&nbsp;&nbsp;
						<input type="button" value="삭제" onclick="remove_one(this.form)"/>&nbsp;&nbsp;
						<input type="button" value="수정" onclick="update_page_go(this.form)"/>&nbsp;&nbsp;
						<input type="reset" value="다시 작성" />
					</th>
				</tr>	
			</tfoot>
		</table>
	</form>
</body>
</html>