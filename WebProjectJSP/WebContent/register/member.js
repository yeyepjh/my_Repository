function changeBox(){
	if(document.getElementById("domain").value=="not"){
		document.getElementById("domain").style.display ="none";
		document.getElementById("domain2").style.visibility = "visible";
	}
}
//유효성검사(회원가입)
function memberCheck(){
	
	//이름검사  2~5글자까지 입력, 한글
	var userName = document.getElementById("userName");
	// ^ : 처음부터   $:끝까지  []:찾을문자범위, {}:찾을 문자의 수
	reg = /^[가-힣]{2,5}$/; 
	if(!reg.test(userName.value)){
		alert("이름을 잘못입력하였습니다...다시입력하세요..");
		userName.value="";
		userName.focus();
		return false;
	}
	//아이디 검사 : 영문자, 숫자포함, 8~12글자 사이, 첫번째문자 영문자
	var userId = document.getElementById("userId");
	//reg = /^[a-zA-Z]{1}[a-zA-Z0-9]{7,11}$/;
	reg= /^[a-zA-Z]{1}\w{7,11}$/;// \w :영대소문자,숫자,_
	if(!reg.test(userId.value)){
		alert("아이디를 다시입력하세요...");
		userId.value = "";
		userId.focus();
		return false;
	}
	//아이디 중복검사 체크
	if(userId.value != document.getElementById("userIdChk").value){
		alert("아이디 중복검사를 하세요...");
		return false;
	}
	//비밀번호 검사
	var userPwd = document.getElementById("userPwd");
	var pwdChk = document.getElementById("pwdChk");
	if(!reg.test(userPwd.value)){
		alert("비밀번호를 잘못 입력하였습니다...");
		userPwd.focus();
		return false;
	}
	if(userPwd.value != pwdChk.value){
		alert("비밀번호가 다릅니다...다시입력하세요...");
		userPwd.focus();
		return false;
	}
	//
	var email = document.getElementById("email");
	var domain=document.getElementById("domain");
	if(domain.style.display=="none"){
		domain = document.getElementById("domain2");
	}
	var fullEmail = email.value +"@" + domain.value;
	//이메일 영대소문자,숫자,_ ,   @,   nate.com    korea.co.kr
	reg = /^\w{8,20}[@][a-zA-Z0-9]{2,10}[.][a-z]{2,6}([.][a-z]{2,3})?/;
	if(!reg.test(fullEmail)){	
		alert("이메일을 잘못입력하였습니다...");
		return false;
	}
	document.getElementById("fullEmail").value = fullEmail;
	
	//전화번호 검사
	reg = /^(010|016|017|018|019|011)[-][0-9]{3,4}[-][0-9]{4}$/;
	var hand1 = document.getElementById("hand1");
	var hand2 = document.getElementById("hand2");
	var hand3 = document.getElementById("hand3");
	var fullHand = hand1.value +"-" + hand2.value + "-" + hand3.value;
	if(!reg.test(fullHand)){
		alert("핸드폰 번호를 잘못입력하였습니다.");
		return false;
	}
	//우편번호검색
	reg = /[0-9]{5}/;
	if(!reg.test(document.getElementById("zipcode").value)){
		alert("우편번호를 검색하세요...");
		return false;
	}
	if(document.getElementById("addr").value == ""){
		alert("주소를 입력하세요....");
		return false;
	}
	if(document.getElementById("addr2").value == ""){
		alert("상세주소를 입력하세요....");
		return false;
	}
	//관심분야 : 목록 2개이상 반드시 선택해야 함.
	var inter = document.memFrm.interest;
	var cnt=0;
	for(i=0; i<inter.length; i++){
		if(inter[i].checked==true){
			cnt++;
		}
	}
	if(cnt<2){
		alert("관심분야는 2개이상 선택하여야 합니다..");
		return false;
	}	
	return true;
}

//회원정보 수정
function memberEditCheck(){
	reg= /^[a-zA-Z]{1}\w{7,11}$/;// \w :영대소문자,숫자,_
	//비밀번호 검사
	var userPwd = document.getElementById("userPwd");
	var pwdChk = document.getElementById("pwdChk");
	if(!reg.test(userPwd.value)){
		alert("비밀번호를 잘못 입력하였습니다...");
		userPwd.focus();
		return false;
	}
	if(userPwd.value != pwdChk.value){
		alert("비밀번호가 다릅니다...다시입력하세요...");
		userPwd.focus();
		return false;
	}
	//
	var email = document.getElementById("email");
	var domain=document.getElementById("domain");
	if(domain.style.display=="none"){
		domain = document.getElementById("domain2");
	}
	var fullEmail = email.value +"@" + domain.value;
	//이메일 영대소문자,숫자,_ ,   @,   nate.com    korea.co.kr
	reg = /^\w{8,20}[@][a-zA-Z0-9]{2,10}[.][a-z]{2,6}([.][a-z]{2,3})?/;
	if(!reg.test(fullEmail)){	
		alert("이메일을 잘못입력하였습니다...");
		return false;
	}
	document.getElementById("fullEmail").value = fullEmail;
	alert(fullEmail);
	//전화번호 검사
	reg = /^(010|016|017|018|019|011)[-][0-9]{3,4}[-][0-9]{4}$/;
	var hand1 = document.getElementById("hand1");
	var hand2 = document.getElementById("hand2");
	var hand3 = document.getElementById("hand3");
	var fullHand = hand1.value +"-" + hand2.value + "-" + hand3.value;
	if(!reg.test(fullHand)){
		alert("핸드폰 번호를 잘못입력하였습니다.");
		return false;
	}
	//우편번호검색
	reg = /[0-9]{5}/;
	if(!reg.test(document.getElementById("zipcode").value)){
		alert("우편번호를 검색하세요...");
		return false;
	}
	if(document.getElementById("addr").value == ""){
		alert("주소를 입력하세요....");
		return false;
	}
	if(document.getElementById("addr2").value == ""){
		alert("상세주소를 입력하세요....");
		return false;
	}
	//관심분야 : 목록 2개이상 반드시 선택해야 함.
	var inter = document.memFrm.interest;
	var cnt=0;
	for(i=0; i<inter.length; i++){
		if(inter[i].checked==true){
			cnt++;
		}
	}
	if(cnt<2){
		alert("관심분야는 2개이상 선택하여야 합니다..");
		return false;
	}	
	return true;
}



