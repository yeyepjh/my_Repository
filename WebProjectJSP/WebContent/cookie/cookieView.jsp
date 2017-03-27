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
<h1>쿠키로 저장된 정보 얻어오기</h1>
<%
	//쿠키 객체 얻어오기
	Cookie cook[] = request.getCookies();

	for(int i=0; i<cook.length ; i++){
		out.println("cookieName : " + cook[i].getName()+" = ");//쿠키명
		out.println("cookieValue : " + cook[i].getValue()+"<br/>");//쿠키값
	}
%>
</body>
</html>