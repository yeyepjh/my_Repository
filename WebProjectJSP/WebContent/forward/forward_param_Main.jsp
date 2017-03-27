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
<form action="colorOk.jsp">
	<input type="radio" value="red" name="color"/> red
	<input type="radio" value="blue" name="color"/> blue
	<input type="radio" value="yellow" name="color"/> yellow
	<input type="radio" value="green" name="color"/> green
	<input type="submit" value="이동"/>
</form>
</body>
</html>