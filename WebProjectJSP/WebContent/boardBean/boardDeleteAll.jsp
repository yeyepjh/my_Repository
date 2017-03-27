<%@page import="com.ikosmo.boardBean.BoardBeanDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String searchKey = request.getParameter("searchKey");
	String searchWord = request.getParameter("searchWord");
	if(searchWord==null)searchWord="";
	String numAll[] = request.getParameterValues("chk");
	
	BoardBeanDAO dao = new BoardBeanDAO();
	
	int result = dao.deleteRecordAll(numAll);
	String msg="삭제실패하였습니다....";	
	if(result>0){
		msg = "삭제되었습니다....";
	}
%>
<script>
    alert('<%=msg%>');
	location.href="boardlist.jsp?searchKey=<%=searchKey%>&searchWord=<%=searchWord%>"
</script>