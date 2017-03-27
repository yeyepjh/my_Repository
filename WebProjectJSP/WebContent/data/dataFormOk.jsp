<%@page import="java.io.File"%>
<%@page import="com.ikosmo.data.DataDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.sun.jmx.snmp.Enumerated"%>
<%@page import="com.ikosmo.data.DataVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//upload폴더의 절대주소를 구한다.
	String path = request.getServletContext().getRealPath("/upload");

    //업로드 최대 크기
    int maxSize = 1024*1024*1024;//1giga
    DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

	//데이타 request + 파일 업로드  request내장객체,업로드위치,업로드최대크기(byte),한글인코딩,rename
	MultipartRequest mr = new MultipartRequest(request,path,maxSize,"UTF-8",rename);
	
	DataVO vo = DataVO.getInstance();
	//mr에 데이타를 vo에 담기
	vo.setUserName(mr.getParameter("userName"));
	vo.setTitle(mr.getParameter("title"));
	vo.setContent(mr.getParameter("content"));
	
	//파일명 얻어오기  - 클라이언트 폼의 화면에서 선택한 파일명을 구해줌
	Enumeration fileName = mr.getFileNames();
	String renameFile[] = new String[5];
	int i=0;
	while(fileName.hasMoreElements()){
		String filename = (String)fileName.nextElement();//원 파일명
		renameFile[i++] = mr.getFilesystemName(filename);//변경된 파일명 얻기
	}
	vo.setFileName(renameFile);
	for(int k=0; k<renameFile.length ; k++){
		System.out.println("["+k+"]="+renameFile[k]);
	}
	
	//DB에 넣기
	DataDAO dao = DataDAO.getInstance();
	int result = dao.dataInsert(vo);
	
	if(result>0){//등록성공시
		%>
		<script>
			alert("자료실에 등록되었습니다...");
			location.href="dataList.jsp";
		</script>
		<%
	}else{//등록실패시
		//업로드 실패시 업로드 된 파일 삭제
		for(int idx=0; idx<renameFile.length; idx++){
			if(renameFile[idx]!=null){
				File f = new File(path+"/"+renameFile[idx]);
				f.delete();
			}
		}
		%>
		<script>
			alert("자료실 업로드가 실패하였습니다..");
			history.go(-1);
		</script>	
		<%
	}
%>





