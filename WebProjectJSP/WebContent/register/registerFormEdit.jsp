<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ikosmo.register.RegisterDAO"%>
<%@page import="com.ikosmo.register.RegisterVO"%>
<%
	//session의 userId를 구하여 DB검색한다.
	RegisterVO vo = new RegisterVO();
    vo.setUserId((String)session.getAttribute("userId"));
    RegisterDAO dao = new RegisterDAO();
    dao.selectRecord(vo);    
%>
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
		$("#zipcodeSearch").click(function(){
			window.open("zipcodeSearch.jsp","zipWin","width=400,height=600");
		});
	});
</script>
</head>
<body>
<!--  -->
<form name="memFrm" action="registerFormEditOk.jsp" method="post" onsubmit="return memberEditCheck()">
	<ul id="memLst">
		<li><span id="title">회/원/정/보/수/정</span> 정확한 회원정보를 입력하여 주십시요.</li>
		<li>아이디</li>
		<li><%=vo.getUserId() %></li>
		</li>
		<li>패스워드</li>
		<li><input type="password" name="userPwd" id="userPwd"/></li>
		<li>비밀번호 확인</li>
		<li><input type="password" name="pwdChk" id="pwdChk"/></li>
		<li>이름</li>
		<li><%=vo.getUserName() %></li>
		<li>E-mail</li>
		<li><input type="text" name="email" id="email" value="<%=vo.getEmail()%>"/>@		    
			<select name="domain" id="domain" onChange="changeBox()">
				<option value="not">직접입력</option>
				<option value="nate.com" <%if(vo.getDomain().equals("nate.com"))out.println("selected"); %>>nate.com</option>
				<option value="naver.com" <%if(vo.getDomain().equals("naver.com"))out.println("selected"); %>>naver.com</option>
				<option value="daum.com" <%if(vo.getDomain().equals("daum.com"))out.println("selected"); %>>daum.com</option>
			</select>
			<input type="text" name="domain2" id="domain2"/>
			<input type="hidden" name="fullEmail" id="fullEmail"/>
		</li>
		<li>핸드폰번호</li>
		<li><select name="hand1" id="hand1">
				<option value="010" <%=vo.getHandChk(vo.getHand1(),"010")%>>010</option>
				<option value="016" <%=vo.getHandChk(vo.getHand1(),"016")%>>016</option>
				<option value="017" <%=vo.getHandChk(vo.getHand1(),"017")%>>017</option>
				<option value="018" <%=vo.getHandChk(vo.getHand1(),"018")%>>018</option>
				<option value="019" <%=vo.getHandChk(vo.getHand1(),"019")%>>019</option>
				<option value="011" <%=vo.getHandChk(vo.getHand1(),"011")%>>011</option>
		    </select> - 
		    <input type="text" name="hand2" id="hand2" value="<%=vo.getHand2()%>"/> - 
		    <input type="text" name="hand3" id="hand3" value="<%=vo.getHand3()%>"/>
		</li>
		<li>주소</li>
		<li><input type="text" name="zipcode" id="zipcode" size="5" value="<%=vo.getZipcode()%>"/>
			<input type="button" value="우편번호검색" id="zipcodeSearch"/>
			<input type="text" name="addr" id="addr" value="<%=vo.getAddr()%>" style="width:70%"/>
		</li>
		<li>상세주소</li>
		<li><input type="text" name="addr2" id="addr2" value="<%=vo.getAddr2()%>"/>
		</li>
		<li>이메일 수신여부</li>
		<li>
			<input type="radio" name="emailSend" value="Y" <%if(vo.getEmailSend().equals("Y"))out.println("checked"); %>/> 수신함
			<input type="radio" name="emailSend" value="N" <%if(vo.getEmailSend().equals("N"))out.println("checked"); %>/> 수신하지않음
		</li>
		<li>관심분야</li>
		<%   String inte[] = vo.getInterest();   %>
		<li><input type="checkbox" name="interest" value="쇼핑" <%for(int i=0;i<inte.length;i++ ){if(inte[i].equals("쇼핑")){out.println("checked");break;}} %>/>쇼핑
		    <input type="checkbox" name="interest" value="게임" <%for(int i=0;i<inte.length;i++ ){if(inte[i].equals("게임")){out.println("checked");break;}} %>/>게임
		    <input type="checkbox" name="interest" value="인터넷" <%for(int i=0;i<inte.length;i++ ){if(inte[i].equals("인터넷")){out.println("checked");break;}} %>/>인터넷
		    <input type="checkbox" name="interest" value="자전거" <%for(int i=0;i<inte.length;i++ ){if(inte[i].equals("자전거")){out.println("checked");break;}} %>/>자전거
		    <input type="checkbox" name="interest" value="등산" <%for(int i=0;i<inte.length;i++ ){if(inte[i].equals("등산")){out.println("checked");break;}} %>/>등산 
		</li>
		<li>
			<input type="submit" value="회원정보수정"/>
			<input type="reset" value="다시쓰기"/>
		</li>
	</ul>
</form>
</body>
</html>