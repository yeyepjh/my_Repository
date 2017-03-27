<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ikosmo.member.MemberDAO"%>
<!-- Beans 
	빈즈 객체 만들고
	MemberVo vo =  new MemberVO();
	빈즈 객체에 데이터 셋팅
										scope : 객체 생명주기
										      request, session, page
-->                                                 
<jsp:useBean id="vo" class="com.ikosmo.member.MemberVO" scope="page"/>
<jsp:setProperty name="vo" property="*"/>

<%
	MemberDAO dao = new MemberDAO();
    int result = dao.insertRecord(vo);
    if(result>0){//추가 성공
    	%>
    	<script>
    		alert("레코드 추가 됨");
    		location.href="../index.jsp"
    	</script>
    	<%
    }else{//추가 실패
    	%>
    	<script>
    		alert("레코드 추가 실패");
    		location.href="../index.jsp"
    	</script>
    	<%
    }
%>