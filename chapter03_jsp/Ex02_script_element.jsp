<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public int add(int a, int b) {
		return a+b;
	}
	public int sub(int a, int b) {
		return a-b;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>0~9 사이의 모든 정수 출력하기</h2>
	<%for(int i=0; i<10; i++){%>
		i <!--HTML영역에서는 자바 변수 i를 사용하지 못한다. -->
	<%}%>
	<br><br>
	<%for(int i=0; i<10; i++){%>
		<%=i%> <!-- 표현식(Expression), 결과 값 출력(변수값, 리턴값) -->
	<%}%>
	
	
	<h2>1~100 사이의 모든 정수의 합계를 구해서 출력하기</h2>
	<% 
		int sum = 0;
		for(int i=1; i<=100; i++){
				sum+=i;
		}
	%>
	1~100 사이의 합 = <%=sum%>

	<!-- 선언부 (Declaration), 전역 변수 선언, 메소드 -->
	<h2>1~100 사이의 모든 짝수의 합계를 리턴하는 even() 메소드</h2>
	<%!
		public int even() {
			int sum = 0;
			for(int i=1; i<=100; i++){
				if(i%2==0){
					sum+=i;
				}
			}
			return sum;
		}
	%>
	1~100 사이의 짝수 합 = <%=even()%>
	
	
	<h2>1~100 사이의 모든 홀수의 합계를 리턴하는 odd() 메소드</h2>
	<%!
		public int odd() {
			int sum = 0;
			for(int i=1; i<=100; i++){
				if(i%2!=0){
					sum+=i;
				}
			}
			return sum;
		}
	%>
	1~100 사이의 홀수 합 = <%=odd()%>
	
	
	<h2>선언부를 사용한 두 정수 값의 곱</h2>
	<%!
		public int multiply(int a, int b) {
			return a*b;
		}
	%>
	10 * 25 = <%=multiply(10, 25)%><br>
	
	
	<h2>스크립트릿에서 자바코드로 처리 후 표현식으로 계산</h2>
	<% 
		int value1 = 3;
		int value2 = 9;
		// 메소드 호출은 일반 자바 코드로 처리 (메소드는 맨 윗단에서 생성)
		int addResult = add(value1, value2);
		int subResult = sub(value1, value2);
	%>
	<%=value1%> + <%=value2%> = <%=addResult%><br>
	<%=value1%> - <%=value2%> = <%=subResult%><br>
</body>
</html>