<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ikosmo.register.RegisterDAO"%>
<%@page import="com.ikosmo.register.RegisterVO"%>
<%
	//로그인폼의 아이디와 비밀번호를 request
	RegisterVO vo = new RegisterVO();
    vo.setUserId(request.getParameter("userId"));
    vo.setUserPwd(request.getParameter("userPwd"));
    
    RegisterDAO dao = new RegisterDAO();
    dao.loginSelect(vo);
    
    if(vo.getUserName()!=null && !vo.getUserName().equals("")){
    	//로그인 성공 session로그인 정보기록 홈으로 이동
    	session.setAttribute("userId", vo.getUserId());
   		session.setAttribute("userName", vo.getUserName());
    	session.setAttribute("loginChk","YES");
    	%>
    		<script>
    			alert("로그인 되었습니다..");
    			location.href="<%=request.getContextPath()%>/index.jsp";
    		</script>
    	<%
    }else{//로그인 실패 로그인폼으로 이동
    	%>
    		<script>
    			alert("로그인 실패하였습니다.");
    			history.back();
    		</script>
    	<%
    }
%>



