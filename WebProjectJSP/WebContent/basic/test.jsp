<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar,java.util.Scanner,java.util.Date" %>
<%@ page import="java.io.InputStream" %>
<%@ page trimDirectiveWhitespaces="true" %><!-- 실행결과 페이지의 여백제거 -->
<!--지시부 : 첫번째줄에 지시부 설정  -->
<%!
   //선언부 : 메소드를 생성하는 곳
   //두수를 입력받아 사칙연산결과를 리턴하는 메소드 
   //실행부(스크립트릿) 보다 먼저 기술하여야 한다.
    public int add(int n1, int n2){
		int c = n1 + n2;
		return c;
	}
	public int multiple(int n1, int n2){
		int c = n1 * n2;
		return c;
	}
%>
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
	//오늘 날짜를 구하여 출력   2017년 3월 10일   ---> Calendar 
	Calendar now = Calendar.getInstance();//날짜 객체 생성
	out.println( now.get(Calendar.YEAR) +"년 ");
	out.println( now.get(Calendar.MONTH) +1+"월 ");
	out.println( now.get(Calendar.DATE)+"일 ");
%>
<hr/>
<%=now.get(Calendar.YEAR) %>년 
<%=now.get(Calendar.MONTH)+1 %>월
<%=now.get(Calendar.DATE)%>일
<hr/>
두수를 더한 결과는 : 
<%
	out.println(add(15,21));
%>
<hr/>
<%  
	// 스크립트릿
	/*  */
	for(int i=2; i<=9; i++){
		out.println("<h1>"+i+"</h1>");
		for(int j=2; j<=9; j++){
			out.println( i +" * " + j + " = " + (i*j) +"<br/>");
		}
	}
%>
</body>
</html>