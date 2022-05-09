<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	파일 업로드 / 다운로드
	
	1. cos.jar
	2. WebContent -> 폴더 생성 -> 해당 위치를 업로드 위치로 사용(폴더명 자유)
	3. <form method="post" enctype="multipart/form-data">
	4. 일반 request 대신 MulitpartRequest 클래스 사용

 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form method="post" enctype="multipart/form-data" action="upload.jsp">
			<table>
				<tbody>
					<tr>
						<td>업로더</td>
						<td><input type="text" name="uploader"></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" name="filename"></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="업로드">
		</form>
	</div>
</body>
</html>