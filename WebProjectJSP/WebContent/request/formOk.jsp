<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
	//post 방식으로 전송시 한글 깨짐 처리
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("userName");
	String pass = request.getParameter("userPwd");
	// 값이 여러개인 경우
	String job[] = request.getParameterValues("job");
	String gender = request.getParameter("gender");
	String hobby[] = request.getParameterValues("hobby");
	String searchWord = request.getParameter("searchWord");
	//
	String addr = request.getParameter("address");
	String num = request.getParameter("num");
%>
이름 : <%=name %><br/>
비밀번호 : <%=pass %><br/>
직업 : 
<%   for(int i=0; i<job.length ; i++){%>
		<%=job[i]%>,
<%}%><br/>
성별 : <%=gender %><br/>
취미 :
<%  if(hobby!=null){ //request한 값이 있는지 확인 
		for(String h : hobby){
			out.println(h+",");
		}
	}
%><br/>
검색어 : <%=searchWord %><br/>
주소 : <%= addr %><br/>
번호 : <%= num %>
</body>
</html>





