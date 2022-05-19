<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON 데이터 읽기</title>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() { // onload
		$("#btn").click(function() { // 버튼 클릭이벤트
			$.getJSON("json_data.js",function(data){ 

				var msg = "<table>";
				for(var i=0; i<data.length; i++){
					msg+= "<tr>"
					msg+= "<td>" + data[i].name + "</td>" 
					msg+= "<td>" + data[i].age + "</td>" 
					msg+= "</tr>"
				}
				msg+= "</table>";
				
				$("#content").empty();
				$("#content").append(msg);
				
			}); // get방식으로 JSON 데이터 읽기
		}); // end click event
	}); // end onload
</script>
</head>
<body>
	<form>
		<input type="button" value="가져오기" id="btn"><br>
	</form>
	<div>
		<h1 style="color: blue;">jsonReader.jsp입니다</h1>	
		<div id="content"></div>
	</div>
</body>
</html>