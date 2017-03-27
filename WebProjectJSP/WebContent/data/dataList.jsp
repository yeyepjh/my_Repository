<%@page import="com.ikosmo.data.DataVO"%>
<%@page import="java.util.List"%>
<%@page import="com.ikosmo.data.DataDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
    body{width:800px; margin:0 auto}
	ul,li{margin:0px;padding:0px;list-style-type:none}
	#head>li, #list>li{float:left}
	.a1{width:80px}
	.a2{width:400px}
	.a3{width:100px}
	.a4{width:100px}
	.a5{width:120px}
</style>
</head>
<body>
<h1>자료실 게시판 목록</h1>
<ul id="head">
	<li class="a1">번호</li>
	<li class="a2">제목</li>
	<li class="a3">작성자</li>
	<li class="a4">첨부파일</li>
	<li class="a5">등록일</li>
</ul>
<!-- 목록 -->
<%
	DataDAO dao = DataDAO.getInstance();
	
    List<DataVO> lst = dao.selectAllRecord();
%>
<ul id="list">
<% for(int i=0; i<lst.size();i++ ){
	DataVO vo = lst.get(i);
%>
	<li class="a1"><%=vo.getNum() %></li>
	<li class="a2"><a href="javascript:viewShow(<%=vo.getNum()%>)"><%=vo.getTitle() %></a></li>
	<li class="a3"><%=vo.getUserName() %></li>
	<li class="a4">
		<% String file[] = vo.getFileName();
		for(int j=0; j<file.length; j++){
			if(file[j]!=null && !file[j].equals("")){
		%>
		       <a href="downLoad.jsp?filename=<%=file[j]%>"><img src='../img/disk.gif'/></a>
	    <%  }//if
		}//for%>
	</li>
	<li class="a5"><%=vo.getWriteDate() %></li>
<% }%>
</ul>
<hr/>
<a href="../index.jsp">홈</a>
<a href="dataForm.jsp">글쓰기</a>
<!-- ---------- -->
<script>
	function viewShow(num){
		document.getElementById("num").value=num;
		document.getElementById("view").submit();
	}
</script>
<form method="post" action="dataView.jsp" id="view">
	<input type="hidden" name="num" id="num"/>
</form>
</body>
</html>