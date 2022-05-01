<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 쿠키 값 변경은 덮어쓰기다. 먼저 쿠키가 존재하는지 확인 필요
	
		* 1. 이름이 name인 쿠키의 값을 "마이클 조던"으로 변경
		  2. 유효 시간을 15일로 변경
		  3. 쿠키 저장소에 저장
	 -->
	<%
		Cookie[] cookieBox = request.getCookies();
		if(cookieBox != null && cookieBox.length>0){
			for(int i=0; i<cookieBox.length; i++){
				if(cookieBox[i].getName().equals("name")){
					// 이름은 name인 쿠키를 새로 만들면 값이 사라진다.
					Cookie cookie = new Cookie("name", URLEncoder.encode("마이클조던","UTF-8"));
					cookie.setMaxAge(60*60*24*15);
					response.addCookie(cookie);
					out.print("쿠키값을 변경했다.");
				}
			}
		}else{
			out.print("쿠키가 존재하지 않습니다.");
		}
	%>
</body>
</html>