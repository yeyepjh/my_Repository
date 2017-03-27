<%@page import="com.ikosmo.register.RegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="com.ikosmo.register.RegisterVO" scope="page"/>
<jsp:setProperty property="*" name="vo"/>
<%
	RegisterDAO dao = new RegisterDAO();
    dao.idSearch(vo);
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div>
<h1>아이디 검색결과</h1>
<% if(vo.getUserId()!=null && !vo.getUserId().equals("")){ %>
	<h2>검색한 아이디는 <span style="color:red"><%=vo.getUserId() %></span>입니다..</h2>
<%	}else{%>	
	<h2>등록된 아이디정보가 없습니다..</h2>
<%  } %>
</div>
</body>
</html>




