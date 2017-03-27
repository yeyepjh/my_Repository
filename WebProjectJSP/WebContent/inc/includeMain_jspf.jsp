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
<style>
	#main>div{float:left}
	#bottom{clear:left}
</style>
</head>
<body>
<div id="top"><%@ include file="header_jspf.jspf" %></div>
<div id="main">
	<div id="left"><%@ include file="left_jspf.jspf" %></div>
	<div id="content">
		<%=name %>=<%=age %>
	    <hr/>
	 	<img src="../img/1039.jpg" width="400"/>
	</div>
</div>
<div id="bottom"><%@ include file="footer_jspf.jspf" %></div>
</body>
</html>