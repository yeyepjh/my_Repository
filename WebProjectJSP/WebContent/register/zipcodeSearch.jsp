<%@page import="com.ikosmo.register.ZipcodeVO"%>
<%@page import="java.util.List"%>
<%@page import="com.ikosmo.register.RegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//입력한 도로명 request
    request.setCharacterEncoding("UTF-8");
    String doroName = request.getParameter("doroName");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(function(){
		$("#zipcodeList>li").click(function(){
			var juso = $(this).text();
			opener.document.getElementById("zipcode").value = juso.substring(0, 5);
		    opener.document.getElementById("addr").value = juso.substring(6);
		    window.close();
		});
	});
</script>
</head>
<body>
<div>
<form method="post" action="zipcodeSearch.jsp">
	도로명 입력 : 
	<input type="text" name="doroName" id="doroName"/>
	<input type="submit" value="우편번호찾기"/>
</form>
</div>
<hr/>
<div>
	<ul id="zipcodeList">
	<% if(doroName==null || doroName.equals("")){//입력한 도로명이 없을때 %>
		<li>도로명을 입력후 우편번호찾기를 누르세요...</li>
	<%}else{//입력한 도로명이 있을때
		  RegisterDAO dao = new RegisterDAO();
	      List<ZipcodeVO> list = dao.zipcodeSelect(doroName);
	      if(list.size()<=0){
	 		%>
				<li>검색한 주소가 없습니다...</li>
		<%}else{
			   for(int i=0; i<list.size(); i++){
					ZipcodeVO vo = list.get(i);   
		       %>
				 <li><%=vo.getZipcode()%> <%=vo.getSido()%> <%=vo.getSigungu() %> <%=vo.getUm()%> <%=vo.getDoroName() %> <%=vo.getGunmula() %> <%=vo.getGunmulb() %> <%=vo.getGunmulc() %> <%if(!vo.getDong().equals(" "))out.println("("+vo.getDong()+")");%></li>
	<%         }
	      }
	}%>
	</ul>
</div>
</body>
</html>




