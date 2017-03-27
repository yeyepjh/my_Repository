<%@page import="com.ikosmo.boardBean.BoardBeanDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

    int nowPage = Integer.parseInt(request.getParameter("nowPage"));
    String searchKey = request.getParameter("searchKey");
    String searchWord = request.getParameter("searchWord");

	BoardBeanDAO dao = new BoardBeanDAO();
	
	int result = dao.recordDelete(num);
	
	if(result>0){//삭제됨
		%>
		<script>
			alert("삭제되었습니다..");
			location.href="boardlist.jsp?nowPage=<%=nowPage%>&searchKey=<%=searchKey%>&searchWord=<%=searchWord%>";
		</script>
		<%
	}else{//삭제실패
		%>
		<script>
			history.back();
		</script>
		<%
	}
%>



