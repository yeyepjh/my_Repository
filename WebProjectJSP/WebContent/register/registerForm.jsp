<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="member.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="member.js"></script>
<script>
	$(function(){
		$("#idChk").click(function(){
			//                         +document.getElementById("userId").value
			//           idChk.jsp?id=goguma999
			window.open("idChk.jsp?id="+$("#userId").val(),"idChk","width=400,height=300");
		});
		$("#zipcodeSearch").click(function(){
			window.open("zipcodeSearch.jsp","zipWin","width=400,height=600");
		});
	});
</script>
</head>
<body>
<!--  -->
<form name="memFrm" action="registerFormOk.jsp" method="post" onsubmit="return memberCheck()">
	<ul id="memLst">
		<li><span id="title">회/원/가/입</span> 정확한 회원정보를 입력하여 주십시요.</li>
		<li>아이디</li>
		<li><input type="text" name="userId" id="userId" value="goguma999"/>
			<input type="button" value="아이디 중복검사" id="idChk"/>
			<input type="hidden" name="userIdChk" id="userIdChk"/>
		</li>
		<li>패스워드</li>
		<li><input type="password" name="userPwd" id="userPwd" value="goguma999"/></li>
		<li>비밀번호 확인</li>
		<li><input type="password" name="pwdChk" id="pwdChk" value="goguma999"/></li>
		<li>이름</li>
		<li><input type="text" name="userName" id="userName" value="홍길동"/></li>
		<li>E-mail</li>
		<li><input type="text" name="email" id="email" value="abababab"/>@		    
			<select name="domain" id="domain" onChange="changeBox()">
				<option value="not">직접입력</option>
				<option value="nate.com" selected>nate.com</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.com">daum.com</option>
			</select>
			<input type="text" name="domain2" id="domain2"/>
			<input type="hidden" name="fullEmail" id="fullEmail"/>
		</li>
		<li>핸드폰번호</li>
		<li><select name="hand1" id="hand1">
				<option value="010">010</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
				<option value="011">011</option>
		    </select> - 
		    <input type="text" name="hand2" id="hand2"/> - 
		    <input type="text" name="hand3" id="hand3"/>
		</li>
		<li>주소</li>
		<li><input type="text" name="zipcode" id="zipcode" size="5"/>
			<input type="button" value="우편번호검색" id="zipcodeSearch"/>
			<input type="text" name="addr" id="addr" />
		</li>
		<li>상세주소</li>
		<li><input type="text" name="addr2" id="addr2" value="1021동 586호"/>
		</li>
		<li>이메일 수신여부</li>
		<li>
			<input type="radio" name="emailSend" value="Y" checked/> 수신함
			<input type="radio" name="emailSend" value="N"/> 수신하지않음
		</li>
		<li>관심분야</li>
		<li><input type="checkbox" name="interest"  value="쇼핑"/>쇼핑
		    <input type="checkbox" name="interest" value="게임"/>게임
		    <input type="checkbox" name="interest" value="인터넷"/>인터넷
		    <input type="checkbox" name="interest" value="자전거"/>자전거
		    <input type="checkbox" name="interest" value="등산"/>등산 
		</li>
		<li>
			<input type="submit" value="가입시작"/>
			<input type="reset" value="다시쓰기"/>
		</li>
	</ul>
</form>
</body>
</html>