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
<h1>session 객체 정보 얻기</h1>
세션아이디 : <%= session.getId()%>
<%
	//세션에 값 저장하기
	String name = "홍길동";
    String num = "25";
    String loginStatus = "yes";
    //                  session변수, 값
    session.setAttribute("username",name);
    session.setAttribute("num",num);
    session.setAttribute("status",loginStatus);   
    
%><br/>
<a href="../index.jsp">홈으로</a>
<hr>
<h1>session 지우기</h1>
<%  //session객체를 삭제하면 session에 선언된 변수가 모두 소멸되고
    //새로운 세션id가 할당된다.
	//session.invalidate();//세션 삭제
%>
</html>