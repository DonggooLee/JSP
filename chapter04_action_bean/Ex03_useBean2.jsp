<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
		자바빈 사용방법
		1. 특정 패키지에 자바빈을 만든다.
		2. 자바빈을 생성한다.
			<jsp:useBean id="별명" class="패키지.자바클래스명" scope="생명주기" />
			* scope
				page(기본) < request < session < application
		3. 자바빈에 값을 저장한다.
			<jsp:setProperty property="*" name = "별명" />
		4. 자바빈의 값을 사용한다.
			<jsp:getProperty property="파라미터명" name = "별명" />
	 --%>
	 <!-- 생성자를 선언한것 과 같다. -->
	<jsp:useBean id="mb" class="org.ddongq.bean.PersonVO"></jsp:useBean>	
	 <!-- 자바 빈에 값 저장 -->
	 <!-- myBean.setName(request.getParameter("name")); 과같다 property에 *는 전체를 모두 저장하는 것이다. -->
	<jsp:setProperty property="*" name="mb"/>
	 
	 <!-- 자바 빈의 값 사용 -->
	 <!-- myBean.getName(); -->
	 <h1>
		이름 : <jsp:getProperty property="name" name="mb"/><br>
	 	나이 : <jsp:getProperty property="age" name="mb"/><br>
	 	신장 : <jsp:getProperty property="height" name="mb"/><br>
	 	주소 : <jsp:getProperty property="addr" name="mb"/><br>
	 </h1>
</body>
</html>