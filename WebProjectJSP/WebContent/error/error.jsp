<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 현재 페이지 실행시 에러발생이 될경우 이동하는 페이지 정보    p102-> true, false -->
<%@ page errorPage="isErrorPage.jsp" buffer="1kb" autoFlush="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	#result{background-color:yellow}
</style>
</head>
<body>
<h1>같은페이지 다시 호출하기</h1>
<form action="error.jsp">
	수1 : <input type="number" name="num1"/>, 
	수2 : <input type="number" name="num2"/>
	<input type="submit" value="수입력후 클릭"/>
</form>
<%
	//전페이지에 입력한 값을 가져온다.
	String num1 = request.getParameter("num1");
    String num2 = request.getParameter("num2");
    
	
	out.println("num1=" + num1 +"<br/>");
	out.println("num2=" + num2);
%>
<div id="result">사칙연산 결과 출력
	<hr/>
	<%  //사칙연산
		if(num1!=null && !num1.equals("") && num2!=null && !num2.equals("")){//값이 다 있을때
			//사직연산계산
			//네트워크를 통해서 전송되는 값은 모두 문자로 처리된다. 
			int num1Int = Integer.parseInt(num1);
		    int num2Int = Integer.parseInt(num2);
		    out.println(num1Int + " + " + num2Int + " = " + (num1Int+num2Int)+"<br/>");
		    out.println(num1Int + " - " + num2Int + " = " + (num1Int-num2Int)+"<br/>");
		    out.println(num1Int + " * " + num2Int + " = " + (num1Int*num2Int)+"<br/>");
		    out.println(num1Int + " / " + num2Int + " = " + (num1Int/num2Int)+"<br/>");
		    
		}else{//값이 하나라도 없을때
			out.println("값을 잘못입력하였습니다...");	
		}	
	%>
</div>
<%
	for(int i=0; i<10000; i++){
		out.println("12345ABCDE");//10*10000=100,000byte
	}
%>
</body>
</html>