<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	
	<%-- MemberDto dto = new MemberDto(); (보통 자바빈 이름은 dto를 많이 쓴다!) --%>
	<jsp:useBean id="myBean" class="org.ddongq.bean.MemberDto" scope="page"/> 
	
	<%-- MemberDto 클래스의 9개 setter를 호출 하는 부분 ( * == 전체 ) --%>
	<jsp:setProperty property="*" name="myBean"/> 
	
	<ul>
		<li>아이디 : <jsp:getProperty property="id" name="myBean"/></li>
		<li>비밀번호 : <jsp:getProperty property="pw" name="myBean"/></li>
		<%-- <jsp:getProperty property="name" name="myBean"/> 은 myBean.getName()과 동일하다. --%>
		<li>이름 : <%= myBean.getName() %></li>
		<li>나이 : <%= myBean.getAge() %></li>
		<li>주소 : <%= myBean.getAddr() %></li>
		<li>성별 : <%= myBean.getGender() %></li>
		<li>취미 : 
			<%
				for ( String hobbies : myBean.getHobbies() ) {
					out.print(hobbies + "&nbsp;");
				}
			%>
		</li>
		<li>좋아하는 음식 : 
			<%
				for ( String likeFood : myBean.getLikeFood() ) {
					out.print(likeFood + "&nbsp;");
				}
			%>
		<li>싫어하는 음식 : 
			<%
				for ( String hateFood : myBean.getDislikeFood() ) {
					out.print(hateFood + "&nbsp;");
				}
			%>
	</ul>
</body>
</html>