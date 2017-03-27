package com.ikosmo.data;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.ikosmo.utility.DBConnection;

public class DataDAO extends DBConnection{

	public DataDAO() {}
	public static DataDAO getInstance(){
		return new DataDAO();
	}
	//�젅?��붾뱶 ?��붽�
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
			System.out.println("레코드 삽입 에러  ="+e.getMessage());
		}finally{dbClose();}
		return result;
	}
	//�젅?��붾뱶 �쟾泥� �꽑�깮
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
				//泥⑤��?���씪紐낆?�� ���옣�븷 諛곗�?
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
			System.out.println("레코드 전체 선택 에러 = "+e.getMessage());
		}finally{dbClose();}	
		return lst;
	}
	//���ڵ� ����
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
			System.out.println("레코드 선택 에러 = "+e.getMessage());
		}finally{
			dbClose();
		}
	}

	//���ڵ� ����
	public int updateRecord(DataVO vo,String path){
		int cnt = 0;
		try{
			//��������
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
					if(rs.getString(i+1)!=null){//5���� ���� ���� ����
						oldFile[idx++]=rs.getString(i+1);
					}
				}
			}
			//원래파일과 새로 업로드 된 파일 삭제된 파일을 한개의 배열 정리ㅋ
			String newFile[] = new String[5];//새로 업로드 된 파일
			String fileName[] = vo.getFileName();
			int idx1=0;
			
			for(int i=0;i<fileName.length;i++){//새로 업로드 된 파일
				if(fileName[i]!=null && !(fileName[i].equals(""))){
					newFile[idx1] = fileName[i];
					idx1++;//첨부파일수
					
				}
			}
			
			//DB의 파일명이 삭제 목록에 있는 확인후 없으면 newFile에 추가
			String delFile[] = vo.getDelFile();
			for(int i=0;i<oldFile.length;i++){
				int del=0;
				if(oldFile[i]!=null){
					for(int j=0;j<delFile.length;j++){
						if(delFile[j]!=null &&oldFile[i].equals(delFile[j])){
							del++;
						}					
					}						
					if(del==0)newFile[idx1++] = oldFile[i];
				}
			}
			
			/* 추가된 파일이름 확인
			 * for(int i=0;i<newFile.length;i++){
			 * System.out.println("["+i+"]"+newFile[i]);
			}*/	
			
			sql1= "update data set userName=?, title=?, content=?, "
					+ "filename1=?, filename2=?, filename3=?, filename4=?, filename5=? "
					+ "where num=?";
			pstmt=con.prepareStatement(sql1);
			pstmt.setString(1, vo.getUserName());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			for(int k=0; k<newFile.length; k++){
				pstmt.setString(k+4, newFile[k]);
			}pstmt.setInt(9, vo.getNum());
			
			cnt=pstmt.executeUpdate();
			if(cnt>0){//수정되었을때... 수정하면서 사라진 파일을 db에서 삭제한다.
				for(int z=0; z<delFile.length; z++){
					if(delFile[z]!=null&&!delFile[z].equals("")){
						File ff = new File(path,delFile[z]); //path : 절대경로
						ff.delete();
					}
				}
				con.commit();			
				
			}else{//수정실패시 새로 선택한 첨부파일을 삭제 한다. 레코드는 고쳐졌지만 파일은 바꾼상황
				for(int z=0; z<fileName.length;z++){
					if(fileName[z]!=null&&!fileName[z].equals("")){
						File ff = new File(path,fileName[z]);
					}					
				}
				con.rollback();
			}
		}catch(Exception e){
			System.out.println("레코드 수정 에러  ="+e.getMessage());
			try{
				con.rollback();
			}catch(Exception ee){System.out.println("rollback(*)에러 발생");}
			
		}finally{
			dbClose();
		}
		return cnt;		
	}
	//삭제 - 첨부파일들의 이름을 구하고 삭제한다.
	public int deleteRecord(int num, String path){
		int cnt=0;
		try{
			String sql = "select filename1, filename2, filename3, filename4, filename5 from data where num=?";
			dbConn(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			String[] filename = new String[5];
			if(rs.next()){
				for(int i=0;i<filename.length;i++){
					filename[i] = rs.getString(i+1);
				}				
			}
			//// 레코드 삭제 쿼리
			sql = "delete from data where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			cnt = pstmt.executeUpdate();
			if(cnt>0){////레코드가 지워졌다는 정보를 근거로 파일을 지운다.
				for(int i=0;i<filename.length;i++){
					if(filename[i]!=null && !filename[i].equals("")){					
						File f= new File(path, filename[i]);
						f.delete();
					}
				}
			}
		}catch(Exception e){
			System.out.println("레코드 삭제 실패 = "+e.getMessage());
		}finally{
			dbClose();
		}
		return cnt;
	}
	
}









