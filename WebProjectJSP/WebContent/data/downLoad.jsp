<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    //                                    aaa.gif
	String filename= request.getParameter("filename");//파일명구하기
	String path = request.getServletContext().getRealPath("/upload");//실제파일이 있는 경로

	response.setContentType("application/x-msdownload");
	//한글파일명에 대한 인코딩
	boolean ex = (request.getHeader("user-agent").indexOf("MSIE") > -1) || (request.getHeader("user-agent").indexOf("Trident") > -1);    
	//파일명 인코딩
	String convName="";
	if(ex){                                
		convName = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+","%20");
	}else{
		convName = new String(filename.getBytes("UTF-8"), "8859_1");
	}                                         
	response.setHeader("Content-Disposition","attachment;filename=\""+convName+"\";");

	File f = new File(path, filename);
	byte b[] = new byte[(int)f.length()];
	if(f.length()>0 && f.isFile()){//파일크기가 0보다 크고 파일이면
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		try{
			int readByte=0;
			out.clear();
			while((readByte=bis.read(b)) != -1){
				bos.write(b, 0, readByte);
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{
			if(bis!=null) bis.close();
			if(bos!=null) bos.close();
		}
	}
%>

