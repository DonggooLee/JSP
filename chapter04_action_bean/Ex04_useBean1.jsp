<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	fieldset { width: 500px; }
</style>
</head>
<body>
	<h1>자바빈을 활용한 파라미터 전송하기</h1>
	<form action="Ex04_useBean2.jsp" method="post">
	   <fieldset>
	   		<legend>정보 전송</legend>
	   		<div>아이디 : <input type="text" name="id" /> </div>
	   		<div>패스워드 : <input type="password" name="pw" /> </div>
	   		<div>이름 : <input type="text" name="name" /> </div>
	   		<div>나이 : <input type="text" name="age" /> </div>
	   		<div>주소 : <input type="text" name="addr" /> </div>
	   		<div>성별 : <input type="radio" name="gender" value="남" /> 남  
	   		           <input type="radio" name="gender" value="여" /> 여
	   		</div>
	   		<div>취미 : 
	   		         <input type="checkbox" name="hobbies" value="운동" /> 운동  
	   		         <input type="checkbox" name="hobbies" value="독서" /> 독서  
	   		         <input type="checkbox" name="hobbies" value="영화" /> 영화  
	   		         <input type="checkbox" name="hobbies" value="게임" /> 게임  
	   		</div>
	   		<div>좋아하는 음식 :
	   				<select name="likeFood">
	   		              <option>::좋아하는 음식::</option>
	   		              <option value="떡볶이">떡볶이</option>
	   		              <option value="순대">순대</option>
	   		              <option value="튀김">튀김</option>
	   		              <option value="오뎅">오뎅</option>
	   				</select>
	   		</div>
	   		<div>싫어하는 음식 : <br />
	   				<select name="dislikeFood" multiple>
	   		              <option value="떡볶이">떡볶이</option>
	   		              <option value="순대">순대</option>
	   		              <option value="튀김">튀김</option>
	   		              <option value="오뎅">오뎅</option>
	   				</select>
	   		</div>
	   		<div>
	   			<input type="submit" value="보내기" />
	   			<input type="reset" value="취소" />
	   		</div>
	   </fieldset> 
	</form>
</body>
</html>