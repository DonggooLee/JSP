<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/json2.js"></script>
</head>
<body>
	<script type="text/javascript">
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200){
				// 방법1
				// var jsonObj = eval("("+xhr.responseText+")");
				// eval : javascript 내장 함수 (보안 이슈가 있다 -> 사용 x)
				
				// 방법2
				var jsonObj = JSON.parse(xhr.responseText); // JSON 최신 브라우저 기본 내장
				document.body.innerHTML += "<ul>";
				document.body.innerHTML += "<li>이름 : " + jsonObj.name + "</li>";
				document.body.innerHTML += "<li>나이 : " + jsonObj.age + "</li>";
				document.body.innerHTML += "</ul>";
				// 만약 JSON.parse가 동작하지 않으면
				// json2.js 파일을 포함하여 사용할 수 있다.
				// json.org > JavaScript > json2.js 다운로드
				// WebContent/js 폴더 생성 후 json2.js 저장
				// <script type="text/javascript" src="../js/json2.js"> 추가하여 사용
			}
		}
		xhr.open("GET", "person.js", true);	// true : 비동기식
	 	xhr.send();	
	</script>
</body>
</html>