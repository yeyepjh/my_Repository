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
<div class="container">
	<h2>a 태그로 보낸 데이타 서버로 가져오기</h2>
	<%
		//request : 이전페이지에서 보내 데이타 서버로 가져오는 내장 객체
		//      텍스트 가져오는 메소드
	    String name = request.getParameter("name");
	    String age = request.getParameter("age");
	    int data = Integer.parseInt(request.getParameter("data"));
	    String color = request.getParameter("color");
	    
	    data = data * 2;
	    out.println(name+"<br/>");
	    out.println(data+"<br/>");
	    out.println(color);
	%>
	<h1 style="background-color:<%=color%>">color보낸 값으로 배경색설정하기</h1>
</div>
<script>
	location.href="../index.jsp";
	
	
</script>
</body>
</html>