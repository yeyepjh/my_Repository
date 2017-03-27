<%@page import="com.ikosmo.register.RegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session의 아이디를 기분으로 레코드 삭제
	RegisterDAO dao = new RegisterDAO();
    int r = dao.deleteRecord(session.getAttribute("userId").toString());
    String msg="";
    if(r>0){
    	session.invalidate();
    }else{
    	msg="실패";
    }    
%>
<script>
	alert("회원탈퇴 <%=msg%> 하였습니다...");
	location.href="../index.jsp";
</script>

