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
<%	request.setCharacterEncoding("UTF-8");
	//form에 입력 color변수의 값을 가져오기
	String color = request.getParameter("color");
	System.out.println(session.getAttribute("username"));
%>
<!--  param액션태그는 값을 전달할때 사용한다. -->
<jsp:forward page='<%=color+".jsp" %>'>
	<jsp:param name="name" value='<%=session.getAttribute("username") %>'/>
	<jsp:param name="tel" value="010-1234-5678"/>
	<jsp:param name="pageColor" value="<%=color %>"/>
</jsp:forward>
</body>
</html>