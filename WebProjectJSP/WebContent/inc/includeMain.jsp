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
<div><jsp:include page="header.jsp" flush="true"/></div>
<div><!-- 메인부분 -->
    <!--  jsp파일로 include시 데이터가 호환되지 않는다. -->
    <%//=name %> = <%//=num %>
	<hr/>
	<img src="../img/1044.jpg"/>
</div>
<div><jsp:include page="footer.jsp" flush="true"/></div>
</body>
</html>