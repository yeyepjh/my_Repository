<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ikosmo.boardBean.BoardBeanDAO"%>
<!-- 빈 객체생성  id=객체명, class=객체를 생성할 클래스, 
               scope=생명주기(application, session, page, request)-->
<jsp:useBean id="boardVo" class="com.ikosmo.boardBean.BoardBeanVO" scope="page"/>
<!-- 이전페이지의 폼에 있는 데이타를 request후 bean객체 담는다. -->
<jsp:setProperty name="boardVo" property="*"/>
<!-- 접속ip는 폼에 있는 정보가 아니기 때문에 ip를 구하여 셋팅하여야 함 -->
<jsp:setProperty name="boardVo" property="ip" value="<%=request.getRemoteAddr() %>"/>
<%
	//boardVo.setIp(request.getRemoteAddr());

	BoardBeanDAO dao = new BoardBeanDAO();
	
	int result = dao.insertRecord(boardVo);
	//
	if(result>0){//추가
		%>
		<script>	
			alert("글이 등록되었습니다..");
			location.href="boardlist.jsp"
		</script>
		<%
	}else{//실패
		%>
		<script>
			alert("글등록 실패하였습니다..");
			history.back();
		</script>
		<%
	}
%>