<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement"%>
<%
	//1. 이전페이지의 폼에 있는 데이타를 서버로 가져와야 함.(request)
	request.setCharacterEncoding("UTF-8");//한글 인코딩 post전송방식 전송시 필요
	String name=request.getParameter("userName");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	String ip = request.getRemoteAddr();//접속자 ip정보 얻기
	//2. DB처리
	int cnt = 0;//레코드 insert결과 값저장
	try{
		//-jdbc드라이브 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//-db연결
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String userid = "scott";
		String userpwd = "tiger";
		Connection con= DriverManager.getConnection(url,userid,userpwd);
		//-statement 생성
		String sql ="insert into guestbook values(guestbookSq.nextVal,?,?,?,?,sysdate,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, content);
		pstmt.setString(4, pwd);
		pstmt.setString(5, ip);
		
		//-실행
		cnt = pstmt.executeUpdate();
		
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		//-DB닫기
	}
	//3. 페이지 이동
	if(cnt>0){//레코드 추가됨  -->리스트
		%>
		<script>
		    alert("방명록이 등록되었습니다.");
			location.href="list.jsp";
		</script>
		<%
	}else{//레코드 추가안됨 --> 폼
		%>
		<script>
			alert("방명록이 등록되지 않았습니다..");
			history.back(); // history.go(-1);
		</script>
		<%
	}
%>