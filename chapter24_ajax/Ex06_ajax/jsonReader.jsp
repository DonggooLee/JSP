<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax로 JSON 읽기</title>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "json_data.js", 		// 읽어올 정보(경로)
			dataType : "json",			// 읽을 정보의 타입
			type	: "get",			// 읽을 방식
			success : function(data) {	// 성공 시 할 일(콜백)
				
				var msg = "<table>";
				msg += "<thead>";
				msg += "<tr><th>이름</th><th>나이</th></tr>";
				msg += "</thead>";
				msg += "<tbody>";
				
				$.each(data,function(){
					msg+= "<tr>"
					msg+= "<td>" + this.name + "</td>" 
					msg+= "<td>" + this.age + "</td>" 
					msg+= "</tr>"
				});
				
				msg += "</tbody>";
				msg+= "</table>";
				
				$("body").html(msg);
				
			},
			error : function() {		// 에러 발생 시 할 일(콜백)
				alert("실패!");
			}
		});
	});
</script>
</head>
<body>
</body>
</html>