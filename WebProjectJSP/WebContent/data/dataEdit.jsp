<%@page import="com.ikosmo.data.DataDAO"%>
<%@page import="com.ikosmo.data.DataVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	DataVO vo = DataVO.getInstance();
    
    vo.setNum(Integer.parseInt(request.getParameter("num")));
	
    DataDAO dao = DataDAO.getInstance();
    dao.selectRecord(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 글수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    //유효성검사
	$(function(){
		//첨부파일의 클릭이벤트
		var delCnt=1;
		$("#f img").click(function(){
			$(this).prev().css("display","none");//span숨기기
			$(this).next().css("display","block");//input 보기
			$(this).css("display","none");////
			var str = $(this).prev().text(); //span태그의 파일명
			$("#delCount").val(delCnt);//삭제된 파일의 수를 hidden에 셋팅
			var htm = "<input type='hidden' name='delFile"+delCnt +"' id='delFile"
			           +delCnt++ +"' value='"+str+"'/>";
			$("#f").append(htm);
		});
		//폼이벤트
		$("#dataEdit").submit(function(){///////////
			if($("#userName").val() == ""){
				alert("이름을 입력하세요...");
				return false;
			}
			if($("#title").val() == ""){
				alert("제목을 입력하세요....");
				return false;
			}
			if($("#content").val()==""){
				alert("글내용을 입력하세요...");
				return false;
			}
		});/////////////
		
	});
</script>
</head>
<body>
<h1>자료실 글수정 폼</h1>
<ul class="list-group">
	<form method="post" action="dataEditOk.jsp" id="dataEdit" enctype="multipart/form-data">
		<input type="hidden" value="<%=vo.getNum() %>" name="num"/>
		<input type="hidden" name="delCount" id="delCount"/><!-- 삭제된 파일의 수 -->
		<li class="list-group-item">작성자 : 
		    <input type="text" name="userName" id="userName" value="<%=vo.getUserName() %>"/></li>
		<li class="list-group-item">제목 : 
		    <input type="text" name="title" id="title" value="<%=vo.getTitle() %>"/></li>
		<li class="list-group-item">내용 : 
		    <textarea name="content" id="content"><%=vo.getContent() %></textarea></li>
		<li class="list-group-item" id="f">첨부파일 : 
		<%
			String file[] = vo.getFileName();
		    int fileCnt = 0;
			for(int i=0; i<file.length; i++){
				if(file[i]!=null && !file[i].equals("")){
					fileCnt++;
				%>				
		            <span><%=file[i]%></span><img src="../img/close.gif" title="<%=fileCnt%>"/>
		            <input type="file" style="display:none" name="filename<%=fileCnt%>" id="filename<%=fileCnt %>"/><br/>
		<%	    
		        }//if
		    }//for
			for(int j=fileCnt+1; j<=5; j++){
				%>
					<input type="file" name="filename<%=j %>" id="filename<%=j%>"/>
				<%
			}
			%>		    
		</li>
		<li>
			<input type="submit" value="자료실 수정"/>
			<input type="reset" value="다시쓰기"/>
		</li>
	</form>
	<li style="text-align:center">
		<a href="dataList.jsp">자료실목록</a>
		<a href="<%=request.getContextPath()%>/index.jsp">홈</a>
	</li>
</ul>
</body>
</html>