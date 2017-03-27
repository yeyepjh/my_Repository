<%@page import="com.ikosmo.register.RegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="com.ikosmo.register.RegisterVO" scope="page"/>
<jsp:setProperty name="vo" property="*"/>

<%
  	RegisterDAO dao = new RegisterDAO();
	int cnt = dao.insertRecord(vo);
	
	if(cnt>0){//가입
		%>
		<script>
			alert("회원가입되었습니다.. 로그인페이지로 이동합니다..");
			location.href="loginForm.jsp";
		</script>
		<%
	}else{//가입실패
		%>
		<script>
			alert("회원가입실패하였습니다..");
			history.back();
		</script>
		<%
	}
%>