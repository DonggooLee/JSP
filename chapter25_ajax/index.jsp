<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// 1. CSV : 콤마로 구분된 일반 텍스트 파일
	function getCSV() {
		$.ajax({
			url : "/chapter25_ajax/csv.do", 		// 읽어올 정보(경로)
			dataType : "text",						// 읽을 정보의 타입
			type : "post",							// 읽을 방식
			success : function(data) {				// 성공 시 할 일(콜백)
				// 성공시 Controller 에서 넘어온 결과가 data 에 담긴다. 
				var members = data.split("/");
				var member = null;
				var result = '';

				for(var i=0; i<members.length; i++){
					member = members[i].split(",");	// [1, id, name..]
					result += "<tr>";
					for(var j=0; j<member.length; j++){
						result += "<td>" + member[j] + "</td>";
					}
					result += "</tr>";
				}
				
				$("#content").html(result);
				$("#typeCheck").text("CSV가져오기");
			},
			error : function() {					// 에러 발생 시 할 일(콜백)
				alert("실패");
			}
		});
	}
	function getXMLTag() {
		$.ajax({
			url : "/chapter25_ajax/xmlTag.do", 		// 읽어올 정보(경로)
			dataType : "xml",						// 읽을 정보의 타입
			type : "post",							// 읽을 방식
			success : function(data) {				// 성공 시 할 일(콜백)
				var result = '';
				$(data).find("member").each(function(){
					result += "<tr>";
					result += "<td>" + $(this).find("idx").text() + "</td>";
					result += "<td>" + $(this).find("id").text() + "</td>";
					result += "<td>" + $(this).find("name").text() + "</td>";
					result += "<td>" + $(this).find("email").text() + "</td>";
					result += "<td>" + $(this).find("phone").text() + "</td>";
					result += "<td>" + $(this).find("addr").text() + "</td>";
					result += "</tr>";
				});
				$("#content").html(result);
				$("#typeCheck").text("xmlTag가져오기");
			},
			error : function() {					// 에러 발생 시 할 일(콜백)
				alert("실패");
			}
		});
	}
	function getXMLProp() {
		$.ajax({
			url : "/chapter25_ajax/xmlProp.do", 	// 읽어올 정보(경로)
			dataType : "xml",						// 읽을 정보의 타입
			type : "post",							// 읽을 방식
			success : function(data) {				// 성공 시 할 일(콜백)
				var result = '';
				$(data).find("member").each(function(){
					result += "<tr>";
					// 속성값으로 찾아야 되므로 find() 말고 attr()을 쓴다!
					result += "<td>" + $(this).attr("idx") + "</td>"
					result += "<td>" + $(this).attr("id") + "</td>"
					result += "<td>" + $(this).attr("pw") + "</td>"
					result += "<td>" + $(this).attr("name") + "</td>"
					result += "<td>" + $(this).attr("email") + "</td>"
					result += "<td>" + $(this).attr("phone") + "</td>"
					result += "<td>" + $(this).attr("addr") + "</td>"
					result += "</tr>";
				});
				$("#content").html(result);
				$("#typeCheck").text("XML(속성) 가져오기 ");
			},
			error : function() {					// 에러 발생 시 할 일(콜백)
				alert("실패");
			}
		});
	}
	function getJSON(){
		$.ajax({
			url: "/chapter25_ajax/json.do",
			dataType: "json",
			type: "POST",
			success: function( data ){
				var result="";
				$.each(data, function(index, item){
					result += "<tr>";
					result += "<td>" + item.idx + "</td>";			// 마침표 표기법
					result += "<td>" + item.id + "</td>";
					result += "<td>" + item.name + "</td>";
					result += "<td>" + item["email"] + "</td>";		// 대괄호 표기법 - 여기서 두 표기법 모두 사용가능하다!
					result += "<td>" + item["phone"] + "</td>";
					result += "<td>" + item["addr"] + "</td>";
					result += "</tr>";
				}); // end each
				$("#content").html(result);
				$("#typeCheck").text("JSON 가져오기 ");
			}, 
			error: function(){
				alert("실패!");
			}
		});
	}
</script>
</head>
<body>
	<div>
		<h1>ajax 처리하기</h1>
		<form>
			<input type="button" value="CSV가져오기" onclick="getCSV()">&nbsp;		
			<input type="button" value="XML(태그)가져오기" onclick="getXMLTag()">&nbsp;	
			<input type="button" value="XML(속성)가져오기" onclick="getXMLProp()">&nbsp;		
			<input type="button" value="JSON가져오기" onclick="getJSON()">&nbsp;		
		</form>
		<br><hr><br>
		<!-- member_t 데이터 -->
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>연락처</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody id="content">
			</tbody>		
		</table>
	</div>
	<div id="typeCheck"></div>
</body>
</html>