<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsEx09_daumLogin.html</title>
<style>
    body{background-color:#ccc}
    body,ul,li{margin:0px;padding:0px}
    
	#mainDiv{width:700px;background-color:#fff;height:800px;margin:0 auto}
	#mainDiv>div:nth-of-type(1){height:40px;text-align:center;border-bottom:1px gray solid;
	                            padding:30px 0}
	/*help*/
	#helpDiv{padding:20px 50px; height:40px; font-size:0.8em;border-bottom:1px gray solid;
	         background-color:#ddd;display:none}
	#helpDiv span{float:right}
	
	/**/
	#loginFrm,#cf{float:left}
	#loginFrm{width:400px;height:350px}
		#loginFrm ul{list-style-type:none;padding:50px 30px;font-size:0.8em}
		#loginFrm input:not([type=checkbox]){width:100%;height:40px;font-size:1.2em}
		#loginFrm li{margin:20px }
	#cf{width:240px;height:350px;padding:50px 30px;}
	#cf img{width:100%}
	#footer{width:700px;height:100px;text-align:center;word-spacing:20px}
</style>
<script>
	function helpShow(){
		document.getElementById("helpDiv").style.display = "block";
		document.body.scrollTop = 100;
	}
	function helpClose(){
		document.getElementById("helpDiv").style.display = "none";
	}
	//아이디와 비밀번호 입력유무 확인
	function chk(){
		if(document.getElementById("userId").value==""){
			alert("아이디를 입력하세요...");
			return false;
		}
		if(document.getElementById("userPwd").value==""){
			alert("비밀번호를 입력하세요...");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<div id="mainDiv">
	<div><img src="../img/logo_daum.png"/></div>
	<div id="helpDiv">
		<ul>
			<li>이메일아이디는 이메일 전체를 입력해 주세요. 예)abc@example.com <span onClick="helpClose()">도움말 닫기x</span></li>
			<li>폰번호아이디는 폰번호 앞에 #를 붙여서 입력해 주세요. 예)#01090003000</li> 
		</ul>
	</div>
	<div id="loginFrm">
		<form name="loginFrm" method="post" action="loginFormOk.jsp" onsubmit="return chk()">
			<ul>
				<li><span style="float:right" onClick="helpShow()">아이디 입력 도움말 ^</span><br/>
					<input type="text" name="userId" id="userId" placeholder="아이디 입력"/>
				</li>
				<li>
					입력한 아이디가 존재하지 않습니다. 아이디를 다시한번 입력해주세요.<br/>
					<a href="#">아이디 찾기</a>
				</li>
				<li>
					<input type="password" name="userPwd" id="userPwd" placeholder="비밀번호 입력"/>
				</li>
				<li>
					<input type="submit" value="로그인"/><br/>
					<input type="checkbox" name="logWrite"/>로그인 상태 유지
					<span style="float:right"><a href="#">IP보안</a>
					<a href="#">ON</a></span>
				</li>
				<li>
					<a href="registerForm.jsp">회원가입</a> | 
					<a href="#">아이디 찾기</a> |
					<a href="#">비밀번호 찾기</a>
				</li>
			</ul>
		</form>
	</div>
	<div id="cf"><img src="../img/102.jpg"/></div>
	<div id="footer">
		<a href="#">&copyKakao.Corp.</a> |
		<a href="#">고객센터</a>
	</div>
</div>
</body>
</html>