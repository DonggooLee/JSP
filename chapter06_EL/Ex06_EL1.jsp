<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 취미에 관한 내용 배열을 만들어 2번 파일에 전송 -->
	<%-- 
	<%
		String[] hobbies = {"게임", "잠자기", "음주"};
		request.setAttribute("HOBBIES", hobbies);
		request.getRequestDispatcher("Ex06_EL2.jsp").forward(request, response);
	%> 
	--%>
	
	<!-- 1. 위 속성 문제를 2번 파일로 전달하여 출력하기 -->
	<!-- 2. 위 데이터를 체크박스로 작성하여 전달하고 2번 파일에서 EL로 출력하기 -->
	<form action="Ex06_EL2.jsp">
		<input type="checkbox" name="HOBBIES" value="게임">게임
		<input type="checkbox" name="HOBBIES" value="잠자기">잠자기
		<input type="checkbox" name="HOBBIES" value="음주">음주
		<input type="submit">
	</form>
</body>
</html>