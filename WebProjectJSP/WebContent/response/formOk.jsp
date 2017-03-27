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
<%
	//form에 입력한 데이타 서버로 전송
	
	// a, form ->  post(인코딩)방식, get방식
	request.setCharacterEncoding("UTF-8");//한글인코딩
	
	String name = request.getParameter("username");
    String addr = request.getParameter("addr");    
%>
<h1>서버로 전송된 값</h1>
이름 : <%=name %><br/>
주소 : <%=addr %>

<!--  페이지 이동하는 방법
	  javascript : location객체, history객체
	  response객체 
	  
	  이름이 홍길동이면 index.jsp로 이동
	  홍길동이 아니면 폼으로 이동
 -->
 <% if(name.equals("홍길동")){ //홍길동일때	 
	%>	
	<script>
		alert("홈페이지로 이동합니다..");
		location.href="../index.jsp";
	</script>
<%
    //response.sendRedirect("../index.jsp");
 }else{ //홍길동이 아닐때
	//response.sendRedirect("form.jsp");
	%>
	<script>
	    alert("이름을 잘못입력하였습니다..");
		//location.href="form.jsp";
		//history.go(-1);
		history.back();
	</script>
<%} %>
</body>
</html>