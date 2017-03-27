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
</head>
<body>
<%
	String color = request.getParameter("pageColor");
    String name = request.getParameter("name");
    String tel = request.getParameter("tel");
%>
<h1>포워딩된 페이지 파일명 : <%=color %>.jsp</h1>
<%=name %>님의 좋아하는 색은 "<%=color %>"이고 자기탐구와 내적성장을 상징하는 색입니다.<br/>
<a href="forward_param_Main.jsp">폼으로 이동</a>
<style>
	body{background-color:<%=color%>}
</style>
</body>
</html>