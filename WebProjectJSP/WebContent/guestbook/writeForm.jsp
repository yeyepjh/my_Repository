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
<script>
	$(function(){
		//폼에서 sumit이벤트가 발생하면 유효성검사를 하는 이벤트처리
		$("#guestForm").submit(function(){
			if($("#userName").val()==""){
				alert("작성자를 입력하세요....");
				return false;
			}
			if($("#title").val()==""){
				alert("제목을 입력하세요....");
				return false;
			}
			if($("#content").val()==""){
				alert("글내용을 입력하세요....");
				return false;
			}
			if($("#pwd").val()==""){
				alert("비밀번호를 입력하세요...");
				return false;
			}
			return true;
		});
	});
</script>
</head>
<body>
<div class="container">
	<h1>방명록 글쓰기</h1>
	<form class="form-horizontal" name="guestForm" id="guestForm" action="writeFormOk.jsp" method="post">
		<div class="form-group">
			<label class="control-label col-sm-2">작성자 : </label>
			<div class="col-sm-10">
			 	<input type="text" name="userName" id="userName" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">제목 : </label>
			<div class="col-sm-10">
			 	<input type="text" name="title" id="title" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">내용 : </label>
			<div class="col-sm-10">
			 	<textarea name="content" id="content" class="form-control"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">비밀번호 : </label>
			<div class="col-sm-10">
			 	<input type="password" name="pwd" id="pwd" class="form-control"/>
			</div>
		</div>
		<div style="text-align:center">
			<input type="submit" value="등록"/>
			<input type="reset" value="다시쓰기"/>
			<a href="list.jsp">방명록 목록</a> 
			<a href="../index.jsp">홈</a>
		</div>
	</form>
</div>
</body>
</html>