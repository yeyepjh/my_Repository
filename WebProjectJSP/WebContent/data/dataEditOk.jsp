<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.ikosmo.data.DataDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.ikosmo.data.DataVO"%>

<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getServletContext().getRealPath("/upload");//파일 업로드 위치의 절대경로
	int size=1024*1024*1024;
	DefaultFileRenamePolicy pol = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request, path,size,"UTF-8",pol);
	
	DataVO vo = DataVO.getInstance();
	vo.setNum(Integer.parseInt(mr.getParameter("num")));
	vo.setUserName(mr.getParameter("userName"));
	vo.setTitle(mr.getParameter("title"));
	vo.setContent(mr.getParameter("content"));
	
	/////////////업로드된 파일 정보
	Enumeration fileNames= mr.getFileNames();//원래 파일명
	String fileName[]=new String[5];
	int i=0;	
	while(fileNames.hasMoreElements()){
		String upFile = (String)fileNames.nextElement(); //원래 선택한 파일명
		String renameFile = mr.getFilesystemName(upFile); //rename된 파일명 얻기
		fileName[i++]=renameFile; //DB에 저장할 파일명
	}
	vo.setFileName(fileName);
	
	/////////////삭제된 파일 정보
	vo.setDelCount(Integer.parseInt(mr.getParameter("delCount")));//삭제된 파일수 
	String delName[]=new String[5];
	for(int j=0;j<vo.getDelCount();j++){
		delName[j] = mr.getParameter("delFile"+(j+1));
	}
	vo.setDelFile(delName);
	DataDAO dao = DataDAO.getInstance();
	int cnt = dao.updateRecord(vo);//DB등록	
	
	
%>