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
				// 일반 텍스트 형식 결과 : responseText (html, jsp, txt 등)
				// xml의 결과 : responseXML (태그를 자동으로 파싱해준다)
				var xmlData = xhr.responseXML;
				
				var person = xmlData.getElementsByTagName("person");
				document.body.innerHTML += "<ul>";
				document.body.innerHTML += "<li>이름 : " + person[3].getAttribute("name") + "</li>";
				document.body.innerHTML += "<li>나이 : " + person[3].getAttribute("age") + "</li>";
				document.body.innerHTML += "</ul>";
				
				var names = xmlData.getElementsByTagName("name");
				var ages = xmlData.getElementsByTagName("age");
				for(var i=0; i<names.length; i++){
					// childNodes : 자식노드에 접근
					var name = names[i].childNodes[0].nodeValue;
					var age = ages[i].childNodes[0].nodeValue;
					
					document.body.innerHTML += "<ul>";
					document.body.innerHTML += "<li>이름 : " + name + "</li>";
					document.body.innerHTML += "<li>나이 : " + age + "</li>";
					document.body.innerHTML += "</ul>";
				}
			}
		}
		xhr.open("GET", "people.xml", true);	// true : 비동기식
	 	xhr.send();
	</script>
</body>
</html>