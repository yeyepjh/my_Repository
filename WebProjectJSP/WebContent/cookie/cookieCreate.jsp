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
<h1>쿠키 설정하기</h1>
<script>
	//자바스크립트에서 쿠키 저장하기
	document.cookie = "test=jsCookie;path=/;expires=2017";
	document.cookie = "login=yes";
</script>
<%
	//jsp에서 쿠키 저장하기
	//쿠키객체 생성
	Cookie cook = new Cookie("name","박길동");
	//쿠키소멸 시점
	cook.setMaxAge(60*60);//쿠키유효시간 (초단위)
	//쿠키 저장
	response.addCookie(cook);
%>
<a href="cookieView.jsp">쿠키정보 얻어오기</a>
</body>
</html>