<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
	//전페이지에서 no, pwd를 request한다.
	int no = Integer.parseInt(request.getParameter("no"));
    String pwd = request.getParameter("pwd");
    int cnt=0;
    try{
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    	Connection conn = DriverManager.getConnection(url,"scott","tiger");
    	
    	String sql = "delete from guestbook where no=? and pwd=?";
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	pstmt.setInt(1, no);
    	pstmt.setString(2, pwd);
    	
		cnt = pstmt.executeUpdate();    	
    }catch(Exception e){
    	System.out.println(e.getMessage());
    }finally{
    	
    }
    if(cnt>0){//삭제
    	%>
    	<script>
    		alert("방명록이 삭제 되었습니다...")
    		location.href="list.jsp";
    	</script>
    	<%
    }else{
    	%>
    	<script>
    	   alert("방명록이 삭제되지 않았습니다..");
    	   location.href="list.jsp";
    	</script>
    	<%
    }
%>