<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="n" value="123456789.123456789"/>
	
	<h3>formatingNumber의 groupingUsed</h3>	
	천 단위 구분기호 + 소수 3자리 : <fmt:formatNumber value="${n}"/><br>
	<!-- 기본값은 소수 3자리 -->
	천 단위 구분기호 없이 + 소수 3자리 : <fmt:formatNumber value="${n}" groupingUsed="no"/><br>
	<!-- groupingUsed : 천 단위 구분 기호 -->
	<hr>
	
	<h3>formatingNumber의 pattern</h3>
	천 단위 구분기호 + 소수 2자리 : <fmt:formatNumber value="${n}" pattern="#,##0.00"/><br>
	<!-- pattern : 소수점 자리수 및 구분기호 표시 -->
	천 단위 구분기호 + 정수 : <fmt:formatNumber value="${n}" pattern="#,000"/><br>
	<hr>
	
	<h3>formatingNumber의 type</h3>
	퍼센트 : <fmt:formatNumber value="0.1" type="percent"/><br>
	원화 표기 : <fmt:formatNumber value="${n}" type="currency"/><br>
	<!-- currencySymbol : 표기문자지정 -->
	달러 표기 : <fmt:formatNumber value="${n}" type="currency" currencySymbol="$"/><br>
</body>
</html>