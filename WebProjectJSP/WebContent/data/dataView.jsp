<%@page import="com.ikosmo.data.DataDAO"%>
<%@page import="com.ikosmo.data.DataVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DataVO vo = DataVO.getInstance();
    
    vo.setNum(Integer.parseInt(request.getParameter("num")));
	
    DataDAO dao = DataDAO.getInstance();
    dao.selectRecord(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 상세페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function delChk(num){
		var qu = confirm("지금보고 있는 자료를 삭제 하시겠습니까????");
		if(qu){
			location.href="dataDelOk.jsp?num="+num;
		}
	}


</script>
</head>
<body>
<h1>자료실 글내용보기</h1>
<ul class="list-group">
	<li class="list-group-item">번호 : <%=vo.getNum() %></li>
	<li class="list-group-item">작성자 : <%=vo.getUserName() %></li>
	<li class="list-group-item">등록일 : <%=vo.getWriteDate() %></li>
	<li class="list-group-item">제목 : <%=vo.getTitle() %></li>
	<li class="list-group-item">내용 : <%=vo.getContent() %></li>
	<li class="list-group-item">첨부파일 : 
	<%
		String file[] = vo.getFileName();
		for(int i=0; i<file.length; i++){
			if(file[i]!=null && !file[i].equals("")){
			%>
	            <a href="downLoad.jsp?filename=<%=file[i]%>"><%=file[i]%></a>
	<%	    }//if
	    }//for %>
	</li>
	<li style="text-align:center">
		<a href="dataEdit.jsp?num=<%=vo.getNum()%>">수정</a>
		<a href="javascript:delChk(<%=vo.getNum()%>)">삭제</a>
		<a href="dataList.jsp">자료실목록</a>
		<a href="<%=request.getContextPath()%>/index.jsp">홈</a>
	</li>
</ul>
</body>
</html>