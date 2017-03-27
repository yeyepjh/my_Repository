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
	//폼에 데이타 입력유무 확인
	function frmChk(){
		if(document.getElementById("userName").value==""){
			alert("글쓴이를 입력하세요...");
			return;
		}
		if(document.getElementById("subject").value==""){
			alert("제목을 입력하세요....");
			return;
		}
		if(document.getElementById("content").value==""){
			alert("글내용을 입력하세요....");
			return;
		}
		//데이타 모두 입력시 submit발생 시킴
		document.getElementById("boardForm").submit();
		//document.boardForm.submit();
	}
</script>
</head>
<body>
<div class="container">
	<h1>게시판 글쓰기</h1>
	<form class="form-horizontal" name="boardForm" id="boardForm" action="boardFormOk.jsp" method="post">
		<div class="form-group">
			<label class="control-label col-sm-2">작성자 : </label>
			<div class="col-sm-10">
			 	<input type="text" name="userName" id="userName" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">제목 : </label>
			<div class="col-sm-10">
			 	<input type="text" name="subject" id="subject" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">내용 : </label>
			<div class="col-sm-10">
			 	<textarea name="content" id="content" class="form-control" rows="10"></textarea>
			</div>
		</div>		
		<div style="text-align:center">
			<input type="button" value="등록" onClick="frmChk()"/>
			<input type="reset" value="다시쓰기"/>
			<a href="boardlist.jsp">게시판 목록</a> 
			<a href="../index.jsp">홈</a>
		</div>
	</form>
</div>
</body>
</html>