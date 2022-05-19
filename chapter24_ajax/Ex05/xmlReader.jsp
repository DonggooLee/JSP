<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>XML 데이터 읽기</title>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() { // onload
		$("#btn").click(function() { // 버튼 클릭이벤트
			
			$.get("xml_data.xml",function(data){
				// data : xml_data.xml 파일을 읽어들인 내용
				// jQuery.find()
				// 어떤 요소의 하위 요소 중 특정 요소를 찾을 때 사용
				var msg = "<ul>";
				$(data).find("person").each(function() {
					// find("name")까지는 태그를 가지고 온 것임 || text()는 태그 사이의 값을 가져오는 기능 ex) <name>test_data</name>
					var name = $(this).find("name").text();
					var age = $(this).find("age").text();
					msg += "<li>이름 :" + name + "</li>"
					msg += "<li>나이 :" + age + "</li>"
				});
				msg+= "</ul>"
				$("#content").append(msg);
			});
		
		}); // end click event
	}); // end onload
</script>
</head>
<body>
	<form>
		<input type="button" value="가져오기" id="btn"><br>
	</form>
	<div>
		<h1 style="color: blue;">xmlReader.jsp입니다</h1>	
		<div id="content"></div>
	</div>
</body>
</html>