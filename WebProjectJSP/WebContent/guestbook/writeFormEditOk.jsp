<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이전페이지 form의 데이타 request
	request.setCharacterEncoding("UTF-8");//한글셋팅
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("userName");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String pwd = request.getParameter("pwd");
    
    int cnt=0;//수정된 레코드수 
    try{
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	String url= "jdbc:oracle:thin:@localhost:1521:orcl";
    	Connection con = DriverManager.getConnection(url,"scott","tiger");
    	
    	String sql = "update guestbook set writer=?, title=?, content=? "
    			     +" where no=? and pwd=?";
    	PreparedStatement pstmt = con.prepareStatement(sql);
    	pstmt.setString(1, name);
    	pstmt.setString(2, title);
    	pstmt.setString(3, content);
    	pstmt.setInt(4, no);
    	pstmt.setString(5, pwd);
    	
    	cnt = pstmt.executeUpdate();
    	
    }catch(Exception e){
    	System.out.println(e.getMessage());
    }finally{}
    
    //실행결과
    if(cnt>0){//수정되었을때
    	%>
    	<script>
    		alert("수정되었습니다...");
    		location.href="list.jsp";
    	</script>
    	<%    	
    }else{//수정실패했을때
    	%>
    	<script>
    		alert("수정실패하였습니다.. 비밀번호를 확인하세요...");
    		history.go(-1);
 		</script>
    	<%
    }
%>