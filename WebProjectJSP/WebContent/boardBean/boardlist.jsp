<%@page import="com.ikosmo.boardBean.BoardBeanVO"%>
<%@page import="java.util.List"%>
<%@page import="com.ikosmo.boardBean.BoardBeanDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int totalRecord = 0 ;//총레코드 수
    int nowPage = 1;     //현재 페이지 번호
    int totalPage = 0; //총페이지 수
    int rowCount = 3;  //한페이지당 출력할 레코드 수
    int pageCount = 5; //한페이지당 표시할 페이지 수
    
    //검색어 request------------
    String searchKey = request.getParameter("searchKey");
    String searchWord = request.getParameter("searchWord");
    if(searchWord==null)searchWord="";
    //System.out.println(searchKey+" , "+searchWord);
    //---------------
    BoardBeanDAO dao = new BoardBeanDAO();
    totalRecord = dao.totalRecordCount(searchKey, searchWord);//총레코드수
   
    //현재페이지 구하기
    String strNum = request.getParameter("nowPage"); 
    if(strNum==null) nowPage = 1;
    else{nowPage = Integer.parseInt(strNum);}
    
    //총페이지 수  4.0  = 16 / 5.0  
    totalPage = (int)Math.ceil(totalRecord / (double)rowCount);
    
    //레코드 선택
    //              현재페이지 , 한페이지당 출력할 레코드 수
    List<BoardBeanVO>  list =  dao.selectPage(nowPage, rowCount, searchKey, searchWord);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	ul,li{padding:0px;margin:0px;list-style-type:none;height:30px}
	.count>li, .title>li, .list>li, .listPage>li{float:left;}
	
	.count>li{width:50%}
		.count>li:nth-of-type(2){text-align:right}
		
	.title>li, .list>li{width:10%;background-color:#ddd;height:30px; line-height:30px}
		.title>li:nth-of-type(3), .list>li:nth-of-type(3){width:50%}	
	.list>li{background-color:#fff;border-bottom:1px solid #ccc}
	
	.listPage>li{width:25%;height:50px;}
		.listPage>li:nth-of-type(2){width:50%}	
		.listPage>li:nth-of-type(3){text-align:right}
    #searchForm{height:50px;text-align:center;}
</style>
<script>
$(function(){
	$("#allChk").change(function(){
		if(this.checked){//체크일때
			$(".list input").prop("checked", true);
		}else{//체크해제일때
			$(".list input").prop("checked", false);
		}
	});
});

function allDel(){
	//리스트 체크 수를 구하여 하나 이상 체크시 삭제
    // []    []
	chkList = document.listFrm.chk;
	cnt = 0;
	for(i=0 ; i<chkList.length; i++){
		if(chkList[i].checked==true){
			cnt++;
		}
	}
	if(cnt>0){//체크 목록이 있다.
	  	document.listFrm.submit();
	}else{//체크된 목록이 없다.
		alert("삭제할 레코드를 선택후 클릭하세요...");
	}
}
</script>
</head>
<body>
<div class="container">
	<h1>게시판</h1>
	<ul>
		<li>
			<ul class="count">
				<li>총레코드 수 : <%=totalRecord %></li>
		        <li><%=nowPage %>/<%=totalPage %></li>
		    </ul>
		</li>
		<li>
		    <ul class="title">
		    	<li><input type="checkbox" value="allChk" name="allChk" id="allChk"/>전체</li>
		    	<li>번호</li>
		    	<li>제목</li>
		    	<li>글쓴이</li>
		    	<li>hit</li>
		    	<li>등록일</li>
		    </ul>
		</li>
		<!-- 목록시작 -->
		<form name="listFrm" action="boardDeleteAll.jsp?searchKey=<%=searchKey%>&searchWord=<%=searchWord%>">
			<% for(int i=0; i < list.size() ; i++){
					BoardBeanVO vo = list.get(i); 
				%>
			<li>
				<ul class="list">
					<li><input type="checkbox" value="<%=vo.getNum() %>" name="chk"/></li>
					<li><%=vo.getNum() %></li>
					<li style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis"><a href="boardView.jsp?num=<%=vo.getNum()%>&nowPage=<%=nowPage%>&searchKey=<%=searchKey%>&searchWord=<%=searchWord%>"><%=vo.getSubject() %></a></li>
					<li><%=vo.getUserName() %></li>
					<li><%=vo.getHit() %></li>
					<li><%=vo.getWriteDate() %></li>
				</ul>
			</li>
			<%} %>		
		</form>
		<!-- 목록 끝  -->
		<li>
			<ul class="listPage">
				<li>
				    <a href="<%=request.getContextPath()%>/index.jsp">홈</a>
				    <a href="javascript:allDel()">삭제</a>
				</li>
				<li>
					<%
						//start페이지
						//페이지에서 마지막페이지 인경우 그렇지 경우
						int startPage = 1;
						if(nowPage%pageCount==0){
							//(몫-1)*rowCount +1
							//  10    / 5   -  1 * 5 + 1  = 6
							startPage = (nowPage/pageCount-1)*pageCount+1 ;
						}else{
							//몫*rowCount +1
							//             (13   /    5)   *  5   +  1  =11
							startPage = (nowPage/pageCount)*pageCount+1;
						}
					%>
					<ul class="pagination pagination-sm">
					    <%  //이전 5페이지 
					    if(startPage==1){//이전5페이지가 없다.
					    %>
					    	<li> <span> << </span></li>
					    <%}else{//이전5페이지가 있다.  num=startPage-pageCount
					     %>
					    	<li> <a href="boardlist.jsp?nowPage=<%=startPage-pageCount%>&searchKey=<%=searchKey%>&searchWord=<%=searchWord%>"> << </a></li>
					    <%}%>						
						
						<% if(nowPage==1){//이전페이지가 없을때%>
							<li><span> < </span></li>
						<% }else{//이전페이지%>
						    <li> <a href="boardlist.jsp?nowPage=<%=nowPage-1%>&searchKey=<%=searchKey%>&searchWord=<%=searchWord%>"> < </a></li>
						<%}
						//                      11  +   5
						for(int p=startPage; p<startPage+pageCount; p++){ 
						    if(p==nowPage){
						    	%>
						    	<li class="active"> <a href="boardlist.jsp?nowPage=<%=p%>&searchKey=<%=searchKey%>&searchWord=<%=searchWord%>"> <%=p %> </a></li>	
						    	<%
						    }else{
						    	%>
								<li> <a href="boardlist.jsp?nowPage=<%=p%>&searchKey=<%=searchKey%>&searchWord=<%=searchWord%>"> <%=p %> </a></li>
							<%}
								//출력할 페이지 번호가 마지막 페이지 반복중단
							  if(p>=totalPage){break;}
						}%>
						<%
						//다음페이지      
						if(nowPage+1 > totalPage){
						%>
							<li> <span> > </span></li>
						<%}else{
						%>
						    <li> <a href="boardlist.jsp?nowPage=<%=nowPage+1%>&searchKey=<%=searchKey%>&searchWord=<%=searchWord%>"> > </a></li>
						<%}
						//다음 5페이지
						if( startPage+pageCount > totalPage ){%>
							<li> <span> >> </span></li>
						<%}else{%>
						 	<li> <a href="boardlist.jsp?nowPage=<%=startPage+pageCount%>&searchKey=<%=searchKey%>&searchWord=<%=searchWord%>"> >> </a></li>
						<% }%>
					</ul>
				</li>
				<li>
					<a href="boardForm.jsp">글쓰기</a>
				</li>
			</ul>
		</li>
		<!-- 검색어 -->
		<li id="searchForm">
			<form action="boardlist.jsp">
				<select name="searchKey">
					<option value="subject">제목</option>
					<option value="username">글쓴이</option>
					<option value="content">글내용</option>
				</select>
				<input type="text" name="searchWord"/>
				<input type="submit" value="검색"/>
			</form>
		</li>
	</ul>
</div>
</body>
</html>