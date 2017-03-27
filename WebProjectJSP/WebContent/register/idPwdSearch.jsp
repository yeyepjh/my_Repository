<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(function(){
		//아이디 찾기 유효성 검사
		$("#idChk").submit(function(){
			if($("#userName").val()=="" || $("#phone").val()==""){
				alert("이름과 전화번호를 입력후 아이디를 검색하세요...");
				return false;
			}
		});
		//비밀번호 찾기 유효성 검사
		$("#pwdChk").submit(function(){
			if($("#userId").val()=="" || $("#userName1").val()=="" || $("#phone1").val()==""){
				alert("아이디, 이름, 전화번호를 모두 입력하셔야 합니다..");
				return false;
			}
		});
	});
</script>
</head>
<body>
<div class="container">
	<div>
		<h1>아이디 찾기</h1>
		<form method="post" action="idSearchOk.jsp" id="idChk">
			이름 : <input type="text" name="userName" id="userName"/><br/>
			전화번호 : <input type="text" name="phone" id="phone"/>예)010-1234-1234<br/>
			<input type="submit" value="아이디찾기"/>
		</form>
	</div>
	<div>
		<h1>비밀번호 찾기</h1>
		<form method="post" action="pwdSearchOk.jsp" id="pwdChk">
			아이디 : <input type="text" name="userId" id="userId"/><br/>
			이름 : <input type="text" name="userName" id="userName1"/><br/>
			전화번호 : <input type="text" name="phone" id="phone1"/><br/>
			<input type="submit" value="비밀번호 찾기"/>
		</form>
	</div>
</div>
</body>
</html>