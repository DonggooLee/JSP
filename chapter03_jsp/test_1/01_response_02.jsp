<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String addr = request.getParameter("addr");
		if(addr.equals("naver")){
			response.sendRedirect("http://www.naver.com");
		}else if(addr.equals("google")){
			response.sendRedirect("http://www.google.com");
		}else if(addr.equals("daum")){
			response.sendRedirect("http://www.daum.net");
		}
		
		/* 선생님 문제풀이 */
		/* switch(addr){
		case "google" : 
			response.sendRedirect("http://www.google.com");
			break;
		case "naver" : 
			response.sendRedirect("http://www.naver.com"); 
			break;
		case "daum" : 
			response.sendRedirect("http://www.daum.net");
			break;
		} */
	%>
</body>
</html>