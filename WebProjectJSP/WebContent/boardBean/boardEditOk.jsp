<%@page import="com.ikosmo.utility.Encoding"%>
<%@page import="com.ikosmo.boardBean.BoardBeanDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="beanVo" class="com.ikosmo.boardBean.BoardBeanVO" scope="page"/>
<jsp:setProperty property="*" name="beanVo"/>
<%
  	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
    //request.setCharacterEncoding("UTF-8");
    
    String searchKey = request.getParameter("searchKey");
	String searchWord = Encoding.toKorUTF(request.getParameter("searchWord"));
	
	BoardBeanDAO dao = new BoardBeanDAO();
	int result = dao.updateRecord(beanVo);
	////
	if(result>0){//수정
		%>
		<script>
			alert("글이 수정되었습니다...");
			location.href="boardlist.jsp?nowPage=<%=nowPage%>&searchKey=<%=searchKey%>&searchWord=<%=searchWord%>";
		</script>
		<%
	}else{//실패
		%>
		<script>
			alert("수정실패하였습니다...");
			history.back();
		</script>
		<%
	}
%>