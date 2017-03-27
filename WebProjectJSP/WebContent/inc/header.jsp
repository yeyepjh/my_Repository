<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//include 파일에서 데이타 호환여부확인
    	String name="김길동";
        int num = 100;
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	#navi{background-color:yellow;height:100px;text-align:right}
</style>
</head>
<body>
<div id="navi">
	<a href="#">로그인</a> / 
	<a href="#">회원가입</a>
	<hr>
	<%=name %> = <%=num %>
</div>
</body>
</html>