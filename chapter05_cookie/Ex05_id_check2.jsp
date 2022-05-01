<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = null;
	String save_id = request.getParameter("save_id");
	String id = request.getParameter("id");
	
	// 아이디 기억하기를 체크했을 때
	if(save_id != null){
		cookie = new Cookie("save_id",id);	// 폼에서 넘어온 아이디 값을 쿠키의 값으로 넣는다.
		cookie.setMaxAge(60*60*24);	// 유효기간 설정
		response.addCookie(cookie);	// 저장소에 저장
	}else{
		// 기존에 만들어진 "save_id" 쿠키 확인 후 삭제
		// 쿠키 삭제는 기존 쿠키가 같은 이름의 쿠키를 새로 만들고, 유효 시간을 0으로 만든다.
		Cookie[] cookieBox = request.getCookies();
		if(cookieBox != null && cookieBox.length>0){
			for(int i=0; i<cookieBox.length; i++){
				if(cookieBox[i].getName().equals("save_id")){
					Cookie bisket = new Cookie("save_id", "");
					bisket.setMaxAge(0);
					response.addCookie(bisket);	// 저장되는 기준은 쿠키이름 ★★
					out.print("쿠키값 삭제");
					break;
				}
			}
		}else{
			out.print("쿠키가 존재하지 않습니다.");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Ex05_id_check1.jsp">
		<input type="submit" value="로그인 화면 돌아가기">
	</form>
</body>
</html>