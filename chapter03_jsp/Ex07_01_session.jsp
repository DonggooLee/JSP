<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function saveSession() {
		location.href = '/chapter03_jsp/Ex07_02_session_save.jsp';
	}
	function removeSession(val) {
		location.href = 'Ex07_02_session_remove.jsp?type='+val;
	}
	function initSession() {
		location.href = 'Ex07_02_session_init.jsp';
	}
</script>
</head>
<body>
	<h1>세션 관리하기</h1>
	<form>
		세션에 정보 저장하기<input type="button" value="확인" onclick="saveSession()"><br>
		세션에 정보 삭제하기<input type="button" value="이름" onclick="removeSession('name')"><br>
		세션에 정보 초기화하기<input type="button" value="확인" onclick="initSession()"><br>
	</form>
	<br><br>
	<%
		// 세션에 저장된 데이터 (이름, 나이) 확인하기
		String name = null;
		String age = null;
		
		if(session.getAttribute("name")==null){
			name = "이름없음";
		}else{
			name = (String)session.getAttribute("name");
			// getAttribute()의 리턴타입은 Object이므로 반드시 다운캐스팅 필요 ★★★
		}
		
		if(session.getAttribute("age")==null){
			age = "나이없음";
		}else{
			age = (String)session.getAttribute("age");
		}
	%>
	<h1>세션 확인하기</h1>
	<h3>세션에 저장된 이름 = <%=name%></h3>
	<h3>세션에 저장된 나이 = <%=age%></h3>
</body>
</html>