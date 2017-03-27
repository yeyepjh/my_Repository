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
	request.setCharacterEncoding("UTF-8");
%>
<div class="container">
	<h2>request 객체</h2>
	<ul>
		<li>클라이언트 ip 얻어오기 : <%=request.getRemoteAddr()%></li>
		<li>인코딩 코드 : <%=request.getCharacterEncoding() %></li>
		<li>ContentType : <%=request.getContentType() %></li>
		<li>method : <%=request.getMethod() %></li>
		<li>protocol : <%=request.getProtocol() %></li>
		<li>URI : <%=request.getRequestURI() %></li>
		<li>contextPath : <%=request.getContextPath() %></li> /WebprojectJSP
		<li>serverName : <%=request.getServerName() %></li>
		<li>port : <%=request.getServerPort() %></li>
		<li>realPath : <%=request.getServletContext().getRealPath("/") %>
	</ul>
</div>
</body>
</html>