<%@page import="org.ddongq.bean.MemberDto"%>
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
		// 클래스 파일(import)을 이용하여 데이터 저장, 사용
		MemberDto m = new MemberDto();
	
		m.setId("admin");
		m.setPw("1234");
		m.setName("홍길동");
		m.setAge(50);
		m.setAddr("서울");
		m.setGender("남자");
		String[] h = {"게임", "수면"};
		m.setHobbies(h);
		String[] l = {"삼겹살", "닭갈비"};
		m.setLikeFood(l);
		String[] d = {"홍어", "미더덕"};
		m.setDislikeFood(d);
	%>
	<ul>
		<li>아이디 : <%=m.getId() %></li>
		<li>비밀번호: <%=m.getPw() %></li>
		<li>이름: <%=m.getName() %></li>
		<li>나이: <%=m.getAge() %></li>
		<li>주소: <%=m.getAddr() %></li>
		<li>성별: <%=m.getGender() %></li>
		<li>취미 :
			<%
				for(String hobby : m.getHobbies()){
					out.print(hobby + "&nbsp;");
				}
			%>
		</li>
		<li>좋아하는 음식 :
			<%
				for(String lf : m.getLikeFood()){
					out.print(lf + "&nbsp;");
				}
			%>
		</li>
		<li>싫어하는 음식 :
			<%
				for(String df : m.getDislikeFood()){
					out.print(df + "&nbsp;");
				}
			%>
		</li>
	</ul>
</body>
</html>