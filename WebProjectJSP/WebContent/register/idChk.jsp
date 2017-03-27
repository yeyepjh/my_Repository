<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ikosmo.register.RegisterDAO"%>
<%
	//회원가입폼 또는 아이디 중복검사 폼에서 보낸 아이디 request
	String id= request.getParameter("id");
    //DB에 아이디 있는 찾기
    RegisterDAO dao = new RegisterDAO();
    int result = dao.idCheck(id);
    //////////
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(function(){
		$("#idSetting").click(function(){
			opener.document.getElementById("userId").value="<%=id%>";
			opener.document.getElementById("userIdChk").value="<%=id%>";
			self.close();//close(), window.close();
		});
	});
</script>
</head>
<body>
<h1>아이디 중복검사</h1>
<div>
	<% if(result==0){%>
		<span style="color:red"><%=id %></span>는 사용가능한 아이디 입니다.
		<input type="button" value="사용하기" id="idSetting"/>
	<%}else{%>
		<span style="color:blue"><%=id %></span>는 사용불가능한 아이디 입니다.
	<%}%>
	<hr/>
	<form method="post" action="idChk.jsp">
		아이디 입력 : <input type="text" name="id" id="id"/>
		<input type="submit" value="아이디 중복확인"/>
	</form>
</div>
</body>
</html>