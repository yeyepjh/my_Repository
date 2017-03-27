<%@page import="com.ikosmo.data.DataDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String path = request.getServletContext().getRealPath("/upload");
	DataDAO dao= DataDAO.getInstance();
	int cnt = dao.deleteRecord(num, path);
	
	if(cnt>0){//삭제
		%>
		<script>
			alert('자료실이 삭제되었습니다.....');
			location.href="dataList.jsp";
		</script>
		<%
	}else{//삭제 실패
		%>
		<script>
			alert('자료실 삭제를 실패하였습니다...');
			history.back();
		</script>
		<%
	}
%>