<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function send(){
		location.href="scriptRequest.jsp?name=홍길동&tel=010-2356-8965";
	}
</script>
</head>
<body>
<div class="container">
	<form method="post" action="formOk.jsp?address=서울 금천구&num=34">
		이름 : <input type="text" name="userName" id="userName"/><br/>
		비밀번호 : <input type="password" name="userPwd" id="userPwd"/><br/>
		직업 : <select name="job" multiple size="4">
					<option value="Not">직업을 선택하세요</option>
					<option value="student">학생</option>
					<option value="사무직">사무직</option>
					<option value="공무원">공무원</option>
					<option value="전문직">전문직</option>
			  </select><br/>
		성별 : <input type="radio" name="gender" value="M">남 
		      <input type="radio" name="gender" value="F">여 <br/>
		취미 : <input type="checkbox" name="hobby" value="영화감상"/>영화감상
			  <input type="checkbox" name="hobby" value="여행"/>여행
			  <input type="checkbox" name="hobby" value="독서"/>독서
			  <input type="checkbox" name="hobby" value="쇼핑"/>쇼핑
			  <input type="checkbox" name="hobby" value="걷기"/>걷기<br/>
	    <input type="hidden" name="searchWord" value="산책길"/>
		
		<input type="submit" value="이동"/>	  
	</form>
	<input type="button" value="자바스크립트를 이용한 데이타 전송" onClick="send()"/>
</div>
</body>
</html>