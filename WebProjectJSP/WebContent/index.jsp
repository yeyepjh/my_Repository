<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function registerOutChk(){
		//예 : true,  아니오 : false
		var chk = confirm("정말로 회원탈퇴 하시겠습니까...");
		if(chk){
			location.href="register/registerDelete.jsp";
		}
	}
</script>
</head>
<body>
<div class="container">
	<div style="height:150px">
		<h1>세션값 얻어오기</h1>
		<%
			session.setAttribute("status", "no");
			String name = (String)session.getAttribute("username");
		    String num = (String)session.getAttribute("num");
		    String status = (String)session.getAttribute("status");
		 	out.println("이름 : " + name + "<br/>");
		 	out.println("번호 : " + num + "<br/>");
		 	out.println("로그인 여부 : " + status);
		 %>
	</div>
	<div>
		<ul class="list-group">
			<li class="list-group-item"><a href="basic/test.jsp">기본문법</a></li>
			<li class="list-group-item">
			      <a href="request/requestObject.jsp">reqeust 객체</a> / 
			      <a href="request/link.jsp">request: A tag</a> / 
			      <a href="request/form.jsp">request: form tag</a>
			</li>
			<li class="list-group-item"><a href="response/form.jsp">response객체</a></li>
			<li class="list-group-item"><a href="session/session.jsp">session객체</a></li>	
			<li class="list-group-item"><a href="cookie/cookieCreate.jsp">Cookie객체</a></li>
			<li class="list-group-item"><a href="error/error.jsp">error페이지 만들기</a></li>
			<li class="list-group-item">
			      <a href="forward/forwardMain.jsp">forward</a> /
				  <a href="forward/forward_param_Main.jsp">forward(파라미터)</a>			
			</li>
			<li class="list-group-item">
			      <a href="inc/includeMain.jsp">include(jsp)</a> / 
			      <a href="inc/includeMain_jspf.jsp">include(jspf:조각파일)</a>
			</li>
			<li class="list-group-item"><a href="<%=request.getContextPath()%>/member/memberForm.jsp">Beans사용하기</a></li>
			<li class="list-group-item"><a href="guestbook/list.jsp">방명록</a></li>
			<li class="list-group-item"><a href="boardBean/boardlist.jsp">게시판(Beans)</a> / 
										<a href="data/dataList.jsp">자료실(fileupload)</a>
			</li>
			<li class="list-group-item">
			<%if(session.getAttribute("loginChk")==null ||  !session.getAttribute("loginChk").equals("YES")){ %>
				<a href="register/registerForm.jsp">회원가입</a> / 
				<a href="register/loginForm.jsp">로그인</a> /
				<a href="register/idPwdSearch.jsp">아이디찾기/비밀번호 찾기</a>
			<%}else{ %>
				<a href="register/registerFormEdit.jsp">회원정보수정</a> / 
				<%=session.getAttribute("userName") %>님 <a href="register/logout.jsp">로그아웃</a> /
				<a href="javascript:registerOutChk()">회원탈퇴</a>
			<%} %>
			</li>		
		</ul>
	</div>
</div>
</body>
</html>