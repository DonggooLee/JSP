<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var jsonObj = JSON.parse(xhr.responseText); // JSON 최신 브라우저 기본 내장
				document.body.innerHTML += "<h1>" + JSON.stringify(jsonObj) + "</h1>"
				
				for(var i=0; i<jsonObj.length; i++){
					document.body.innerHTML += "<ul>";
					document.body.innerHTML += "<li>이름 : " + jsonObj[i].name + "</li>";
					document.body.innerHTML += "<li>나이 : " + jsonObj[i].age + "</li>";
					document.body.innerHTML += "</ul>";
				}

			}
		}
		xhr.open("GET", "people.js", true);	// true : 비동기식
	 	xhr.send();	
	</script>
</body>
</html>