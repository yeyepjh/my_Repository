<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ikosmo.boardBean.BoardBeanVO"%>
<%@page import="com.ikosmo.boardBean.BoardBeanDAO"%>
<%
	BoardBeanVO vo = new BoardBeanVO();
    vo.setNum(Integer.parseInt(request.getParameter("num")));
    
    //페이지정보, 검색어, 검색키
    int nowPage = Integer.parseInt(request.getParameter("nowPage"));
    String searchKey = request.getParameter("searchKey");
    String searchWord = request.getParameter("searchWord");
    
    BoardBeanDAO dao = new BoardBeanDAO();
    dao.selectRecord(vo,1);
%>
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
	<h1>게시판 글내용 보기</h1>
	<form class="form-horizontal" name="boardForm" id="boardForm" method="post">
		<div class="form-group">
			<label class="control-label col-sm-2">작성자 : </label>
			<div class="col-sm-10">
			 	<%=vo.getUserName() %>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">등록일 : </label>
			<div class="col-sm-4">
			 	<%=vo.getWriteDate() %>
			</div>
			<label class="control-label col-sm-2">조회수 : </label>
			<div class="col-sm-4">
			 	<%=vo.getHit() %>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">제목 : </label>
			<div class="col-sm-10">
			 	<%=vo.getSubject() %>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">내용 : </label>
			<div class="col-sm-10">
			 	<%=vo.getContent() %>
			</div>
		</div>		
		<div style="text-align:center">
			<a href="boardEdit.jsp?num=<%=vo.getNum() %>&nowPage=<%=nowPage%>&searchKey=<%=searchKey%>&searchWord=<%=searchWord%>">수정<a/>
			<a href="boardDel.jsp?num=<%=vo.getNum() %>&nowPage=<%=nowPage%>&searchKey=<%=searchKey%>&searchWord=<%=searchWord%>">삭제</a>
			<a href="boardlist.jsp?nowPage=<%=nowPage%>&searchKey=<%=searchKey%>&searchWord=<%=searchWord%>">게시판 목록</a> 
			<a href="../index.jsp">홈</a>
		</div>
	</form>
</div>
</body>
</html>