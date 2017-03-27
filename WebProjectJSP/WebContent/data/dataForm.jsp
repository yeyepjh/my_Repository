<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 글올리기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(function(){
		$("#dataFrm").submit(function(){
			if($("#userName").val()==""){
				alert("작성자를 입력하세요.....");
				return false;
			}
			if($("#title").val()==""){
				alert("제목을 입력하세요...");
				return false;
			}
			//첨부파일 1개 이상 입력하세요....
			var cnt=0;
			if($("#fileName1").val() != ""){cnt++;}
			if($("#fileName2").val() != ""){cnt++;}
			if($("#fileName3").val() != ""){cnt++;}
			if($("#fileName4").val() != ""){cnt++;}
			if($("#fileName5").val() != ""){cnt++;}
			
			if(cnt<=0){
				alert("첨부파일이 1개 이상 있어야 합니다.");
				return false;
			}
		});		
	});
</script>
</head>
<body>
<h1>자료실 글올리기</h1>
<form method="post" action="dataFormOk.jsp" enctype="multipart/form-data" id="dataFrm">
	<ul>
		<li> 작성자 : <input type="text" name="userName" id="userName"/></li>
		<li> 제목 : <input type="text" name="title" id="title"/></li>
		<li> 글내용 : <textarea name="content" id="content"></textarea></li>
		<li>첨부파일 :<input type="file" name="fileName1" id="fileName1"/><br/>
					<input type="file" name="fileName2" id="fileName2"/><br/>
					<input type="file" name="fileName3" id="fileName3"/><br/>
					<input type="file" name="fileName4" id="fileName4"/><br/>
					<input type="file" name="fileName5" id="fileName5"/><br/>
					</li>
		<li><input type="submit" value="자료올리기"/>
		    <input type="reset" value="다시쓰기"/></li>
	</ul>
</form>
</body>
</html>