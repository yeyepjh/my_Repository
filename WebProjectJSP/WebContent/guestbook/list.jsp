<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Db의 레코드 전체를 내림차순으로 정렬하여 select한다.
	ResultSet rs=null;
	try{
		//1.
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//2.
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String userId="scott";
		String userPwd="tiger";
		Connection conn = DriverManager.getConnection(url, userId, userPwd);
		
		//3.
		String selectSql = "select no, title, writer, content, writedate "
		                   + " from guestbook order by no desc";
		PreparedStatement pstmt = conn.prepareStatement(selectSql);                      
		//4.
		rs = pstmt.executeQuery();
		
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 리스트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    var html;
    var obj;
	function  delForm(no,liObj){
		html = liObj.innerHTML; 
		obj = liObj;
		//삭제버튼을 클릭하면 비밀번호를 입력할수 있는 폼을 만들어 DOM객체에 추가해준다.
		var delFrm = "<form method='post' action='deleteOk.jsp' onSubmit='return delChk()'>";
		delFrm += "비밀번호 : <input type='password' name='pwd'/>";
		delFrm += "<input type='submit' value='삭제'/>";
		delFrm += "<input type='hidden' name='no' value='"+no+"'/>";
		delFrm += "</form>";
		liObj.innerHTML = delFrm;
	}
	function delChk(){
		//삭제 유무 확인
		var chk = confirm("정말로 삭제 하시겠습니까.");
		if(chk){//삭제
			return true;
		}else{//삭제 취소
			obj.innerHTML = html;
		    return false;
		}
	}
</script>
</head>
<body>
<div class="container">
	<h1>방명록 목록</h1>
	<div style="background-color:pink;color:#fff">
		<a href="writeForm.jsp">글쓰기</a> / 
		<a href="<%=request.getContextPath()%>/index.jsp">홈</a>
	</div>
	<%while(rs.next()){%>	
		<ul class="list-group">
			<li class="list-group-item"> 번호 : <%=rs.getInt(1)%></li>
			<li class="list-group-item"> 이름 : <%=rs.getString(3) %></li>
			<li class="list-group-item"> 제목 : <%=rs.getString(2) %></li>
			<li class="list-group-item"> 내용 : <%=rs.getString(4) %></li>
			<li class="list-group-item"> 작성일 : <%=rs.getString(5) %></li>
			<li class="list-group-item">
			    <input type="button" value="수정" onClick="location.href='writeFormEdit.jsp?no=<%=rs.getInt(1)%>'"/>
			    <input type="button" value="삭제" onClick="delForm(<%=rs.getInt(1)%>,this.parentElement)"/>
			</li>
		</ul>
	<%}//while %>
	
</div>
</body>
</html>