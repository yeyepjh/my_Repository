<%@page import="com.ikosmo.boardBean.BoardBeanDAO"%>
<%@page import="com.ikosmo.boardBean.BoardBeanVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardBeanVO vo = new BoardBeanVO();
    vo.setNum(Integer.parseInt(request.getParameter("num")));
    
    //
    int nowPage = Integer.parseInt(request.getParameter("nowPage"));
    String searchKey = request.getParameter("searchKey");
    String searchWord = request.getParameter("searchWord");
    
    BoardBeanDAO dao = new BoardBeanDAO();
    dao.selectRecord(vo,2);
%>
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
	<form class="form-horizontal" name="boardForm" id="boardForm" action="boardEditOk.jsp" method="post">
		<input type="hidden" name="num" value="<%=vo.getNum() %>"/>
		<input type="hidden" name="nowPage" value="<%=nowPage%>"/>
		<input type="hidden" name="searchKey" value="<%=searchKey %>"/>
		<input type="hidden" name="searchWord" value="<%=searchWord%>"/>
		<div class="form-group">
			<label class="control-label col-sm-2">작성자 : </label>
			<div class="col-sm-10">
			 	<input type="text" name="userName" id="userName" value="<%=vo.getUserName() %>" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">제목 : </label>
			<div class="col-sm-10">
			 	<input type="text" name="subject" id="subject" value="<%=vo.getSubject() %>" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">내용 : </label>
			<div class="col-sm-10">
			 	<textarea name="content" id="content" class="form-control" rows="10"><%=vo.getContent() %></textarea>
			</div>
		</div>		
		<div style="text-align:center">
			<input type="button" value="수정" onClick="frmChk()"/>
			<input type="reset" value="다시쓰기"/>
			<a href="boardlist.jsp?nowPage=<%=nowPage%>&searchKey=<%=searchKey%>&searchWord=<%=searchWord%>">게시판 목록</a> 
			<a href="../index.jsp">홈</a>
		</div>
	</form>
</div>
</body>
</html>