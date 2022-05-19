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
		/*
			onreadystatechange 이벤트 속성
			1) 각 진행 단계를 확인하는 이벤트 속성
			2) onreadystatechange 이벤트 속성을 사용하면 "비동기 통신"을 할 수 있다.
			
			readystate 값 : 데이터의 전송 결과 
			0 : 객체 생성, open 안 함
			1 : open() 함, send() 안함
			2 : send() 함, 데이터를 받지 않음
			3 : send() 함, 데이터의 일부만 받음
			4 : 성공
			
			status 값 : 오류 관련
			200 : 정상(오류 없음)
			4XX : 클라이언트 측 오류
			5XX : 서버 측 오류				
		*/
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4){	// 데이터 전송결과 성공
				if(xhr.status == 200){	// 오류 결과 정상
					document.body.innerHTML += xhr.responseText;
				}
			}
		}
		xhr.open("GET", "data.jsp", true);	// true : 비동기식
	 	xhr.send();
	</script>
</body>
</html>