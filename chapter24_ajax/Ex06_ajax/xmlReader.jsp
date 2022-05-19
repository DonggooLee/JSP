<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax로 XML읽기</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "xml_data.xml", 		// 읽어올 정보(경로)
			dataType : "xml",			// 읽을 정보의 타입
			type	: "get",			// 읽을 방식
			success : function(data) {	// 성공 시 할 일(콜백)
				var message = "<ul>";
				$(data).find("person").each(function(){
					var name = $(this).find("name").text();
					var age = $(this).find("age").text();
					message += "<li>이름 : " + name + "</li>";
					message += "<li>나이 : " + age + "</li>";
				}); // end each
				message += "</ul>";
				$("#content").append(message);
			},
			error : function() {		// 에러 발생 시 할 일(콜백)
				var message = "xml_data.xml 데이터를 가져오지 못했습니다.";
				$("#content").append(message);
			}
		});
	});
</script>
</head>
<body>
	<div id="content"></div>
</body>
</html>