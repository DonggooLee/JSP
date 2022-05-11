<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/* 
		jsp가 controller(servlet)에게 요청
		
		servlet 호출 방법
		1. /프로젝트명(contextpath)/서블릿명
		2. /프로젝트명(contextpath)/URL매핑명
	*/
	
	// 현재 상황에서는 원래 하나의 컨트롤러를 사용해야 한다.
	function req_date() {
		// 위치가 다르기 때문에 절대경로를 작성해야 한다. (/contextpath/servlet명칭orURL매핑명칭)
		location.href="/chapter18_mvc/Controller1";
	}
	function req_time() {
		location.href="/chapter18_mvc/Controller2";
	}
</script>
</head>
<body>
	<div>
		<h1>원하는 정보의 버튼을 클릭하시오.</h1>
		<form>
			<input type="button" value="현재 날짜 확인하기" onclick="req_date()"><br>
			<input type="button" value="현재 시간 확인하기" onclick="req_time()">
		</form>
	</div>
</body>
</html>