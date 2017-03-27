<%@page import="com.ikosmo.register.RegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="com.ikosmo.register.RegisterVO" scope="page"/>
<jsp:setProperty name="vo"  property="*"/>
<%
	vo.setUserId((String)session.getAttribute("userId"));

	RegisterDAO dao = new RegisterDAO();
	int result = dao.updateRecord(vo);
	
	if(result<=0){//수정 안됨
		%>
		<script>
			alert("회원정보 수정실패 하였습니다..");
			history.back();
		</script>
		<%
	}else{//수정됨
		%>
		<script>
			alert("회원정보가 수정되었습니다.");
			location.href="<%=request.getContextPath()%>/index.jsp";
		</script>
		<%
	}
%>
