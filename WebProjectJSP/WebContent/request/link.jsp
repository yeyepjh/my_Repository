<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>request : link.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<h2>a 태그를 이용한 데이타 전송</h2>
	<h3>a 태그를 이용하여 데이타 전송시 전송방식을 무조건 get방식으로 전송된다.</h3>
	<a href="linkOk.jsp?name=홍길동&age=20&data=3000&color=yellow">텍스트를 서버로 보내기</a>
</div>
</body>
</html>