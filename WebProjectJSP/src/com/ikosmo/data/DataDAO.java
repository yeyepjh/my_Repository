package com.ikosmo.data;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.ikosmo.utility.DBConnection;

public class DataDAO extends DBConnection{

	public DataDAO() {}
	public static DataDAO getInstance(){
		return new DataDAO();
	}
	//ï¿½ì …?‚„ë¶¾ë±¶ ?•°ë¶½ï¿½
	public int dataInsert(DataVO vo){
		int result = 0;
		try{
			String sql = "insert into data(num, userName, title, content, filename1,"
					+ " filename2, filename3, filename4, filename5, writedate) "
					+ " values(boardSq.nextVal,?,?,?,?,?,?,?,?,sysdate)";
			dbConn(sql);
			pstmt.setString(1, vo.getUserName());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			
			String f[] = vo.getFileName();
			for(int i=0; i<f.length; i++){
				pstmt.setString(4+i, f[i]);
			}
			result = pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("ï¿½ì …?‚„ë¶¾ë±¶ ?•°ë¶½ï¿½ ï¿½ë¿‰ï¿½ìœ­ ="+e.getMessage());
		}finally{dbClose();}
		return result;
	}
	//ï¿½ì …?‚„ë¶¾ë±¶ ï¿½ìŸ¾ï§£ï¿½ ï¿½ê½‘ï¿½ê¹®
	public List<DataVO> selectAllRecord(){
		List<DataVO> lst = new ArrayList<DataVO>();
		try{
			String sql = "select num, userName, title, filename1, filename2, "
		               + " filename3, filename4, filename5, to_char(writedate,'YY-MM-DD') "
		               + " from data order by num desc";
			dbConn(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				DataVO vo = new DataVO();
				vo.setNum(rs.getInt(1));
				vo.setUserName(rs.getString(2));
				vo.setTitle(rs.getString(3));
				//ï§£â‘¤ï¿½ï¿½?™†ï¿½ì”ªï§ë‚†?“£ ï¿½ï¿½ï¿½ì˜£ï¿½ë¸· è«›ê³—ë¿?
				String fn[] = new String[5];
				int p=0;
				for(int i=0; i<fn.length; i++){
					if(rs.getString(i+4)!=null && !rs.getString(i+4).equals("")){
						fn[p++] = rs.getString(i+4);
					}
				}
				vo.setFileName(fn);
				vo.setWriteDate(rs.getString(9));
				lst.add(vo);
			}			
		}catch(Exception e){
			System.out.println("ÀüÃ¼ ·¹ÄÚµå ¼±ÅÃ ¿¡·¯ = "+e.getMessage());
		}finally{dbClose();}	
		return lst;
	}
	//·¹ÄÚµå ¼±ÅÃ
	public void selectRecord(DataVO vo){
		try{
			String sql = "select * from data where num=?";
			dbConn(sql);
			pstmt.setInt(1, vo.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setUserName(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setContent(rs.getString(4));
				String f[] = new String[5];
				int j=0;
				for(int i=0;i<f.length; i++){
					if(rs.getString(i+5)!=null && !rs.getString(i+5).equals(""))
						f[j++] = rs.getString(i+5);
				}
				vo.setFileName(f);
				vo.setWriteDate(rs.getString(10));
			}
		}catch(Exception e){
			System.out.println("·¹ÄÚµå ¼±ÅÃ¿¡·¯ = "+e.getMessage());
		}finally{
			dbClose();
		}
	}

	//·¹ÄÚµå ¼öÁ¤
	public int updateRecord(DataVO vo){
		int cnt = 0;
		try{
			//ÆÄÀÏÁ¤¸®
			String sql1 = "select filename1, filename2, filename3, filename4, filename5 "
					+ "from data where num=?";
			dbConn(sql1);
			con.setAutoCommit(false);
			pstmt.setInt(1,  vo.getNum());
			rs=pstmt.executeQuery();
			String oldFile[] = new String[5];
			int idx=0;
			if(rs.next()){
				for(int i=0;i<oldFile.length;i++){
					if(rs.getString(i+1)!=null){//5¹ÙÄû µ¹°í Á¡Á¡ Áõ°¡
						oldFile[idx++]=rs.getString(i+1);
					}
				}
			}
			//¿ø·¡ ÆÄÀÏ°ú »õ·Î ¾÷·ÎµåµÈ ÆÄÀÏ »èÁ¦µÈ ÆÄÀÏÀ» ÇÑ°³ÀÇ ¹è¿­·Î Á¤¸®
			String newFile[] = vo.getFileName();
			int idx1=0;
			System.out.println(newFile);
			for(int c=0;c<newFile.length;c++){//Ã·ºÎµÈ ÆÄÀÏÀÇ ¼ö¸¦ ±¸ÇÏ±â
				if(newFile[c]==null){
					idx1=c;
					break;
				}
			}
			for(int i=0;i<newFile.length;i++){	
				System.out.println("["+i+"]"+newFile[i]);
			}	
			//DBÀÇ ÆÄÀÏ¸íÀÌ »èÁ¦ ¸ñ·Ï¿¡ ÀÖ´ÂÁö È®ÀÎÈÄ ¾øÀ¸¸é newFile¿¡ Ãß°¡
			String delFile[] = vo.getDelFile();
			for(int i=0;i<oldFile.length;i++){
				int del=0;
				for(int j=0;j<delFile.length;j++){
					if(oldFile[i]!=null&&delFile[j]!=null && oldFile[i].equals(delFile[j])){
						del++;
					}
					if(del==0)newFile[idx1++] = oldFile[i];
				}						
				System.out.println("["+i+"]"+oldFile[i]);
			}
		}catch(Exception e){
			System.out.println("·¹ÄÚµå ¼öÁ¤ ¿¡·¯ ="+e.getMessage());
		}finally{
			dbClose();
		}
		return cnt;		
	}
	
}









