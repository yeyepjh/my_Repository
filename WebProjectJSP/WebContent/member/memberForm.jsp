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
<form method="post" action="memberFormOk.jsp">
	<!-- VO객체에 있는 변수와 같은 name을 설정하여야 한다. -->
	이름 : <input type="text" name="name"/><br/>
	연락처 : <input type="text" name="tel"/><br/>
	이메일 : <input type="text" name="email"/><br/>
	<input type="submit" value="전송"/>
	
</form>
</body>
</html>