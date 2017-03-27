package com.ikosmo.boardBean;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.ikosmo.utility.DBConnection;
import com.ikosmo.utility.Encoding;

public class BoardBeanDAO extends DBConnection{

	public BoardBeanDAO(){}
	//레코드추가
	public int insertRecord(BoardBeanVO vo){
		int result=0;
		
		try{
			String sql = "insert into board values(boardSq.nextVal,?,?,?,0,sysdate,?)";
		    dbConn(sql);
		    //값셋팅
		    pstmt.setString(1, Encoding.toKorUTF(vo.getUserName()));
		    pstmt.setString(2, Encoding.toKorUTF(vo.getSubject()));
		    pstmt.setString(3, Encoding.toKorUTF(vo.getContent()));
		    pstmt.setString(4, vo.getIp());
		    
		    result = pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("레코드 추가 에러="+e.getMessage());
		}finally{
			dbClose();
		}		
		return result;
	}
	//총레코드수 구하기
	public int totalRecordCount(String searchKey, String searchWord){
		int cnt=0;
		try{
			if(searchWord==null || searchWord.equals("")){//검색어가 없을때
				String sql = "select count(num) from board";
				dbConn(sql);
			}else{//검색어가 있을때
				String sql = "select count(num) from board where "+searchKey+" like '%"+searchWord+"%'";
				dbConn(sql);				
			}
			rs = pstmt.executeQuery();
			if(rs.next())cnt=rs.getInt(1);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		finally{dbClose();}
		return cnt;
	}
	//한페이지에 출력할 레코드 선택    2              5
	public List<BoardBeanVO> selectPage(int nowPage, int rowCount, String searchKey, String searchWord){
		List<BoardBeanVO> list = new ArrayList<BoardBeanVO>();
		try{
			//마지막page의 레코드수를 구하기 위해 총페이지 수를 구한다.
			//    올림(총 레코드수 / 한페이지당 출력할 레코드 수)
			int totalRecord = totalRecordCount(searchKey,searchWord);
			int totalPage = (int)Math.ceil(totalRecord/(double)rowCount);
			
			//한페이지 레코드수 쿼리 문    nowPage*rowCount ,  rowCount
			String sql = "select * from  "
					             +"(select * from "
							          +" (select num, username, subject, hit, writedate " 
							              +" from board ";
						if(!(searchWord==null || searchWord.equals(""))){//검색어가 있는 지 확인후 있으면 where절 추가
							sql += " where "+searchKey+"  like '%"+searchWord+"%' ";
						}				
							             sql+= " order by num desc) "
							     +" where rownum<=? order by num asc) "
					    +" where rownum<=? order by num desc";
			dbConn(sql);
			pstmt.setInt(1, nowPage*rowCount);
			
			if(totalPage==nowPage){//마지막페이지, 0,1,2,3,4
				int mod = totalRecord % rowCount;
				if(mod==0) mod=rowCount;
				pstmt.setInt(2, mod);
			}else{pstmt.setInt(2, rowCount);}
			
			rs = pstmt.executeQuery();			
			//vo에 1개의 레코드를 담고, vo를 list컬렉션 담는다.			
			while(rs.next()){
				BoardBeanVO vo = new BoardBeanVO();
				vo.setNum(rs.getInt(1));
				vo.setUserName(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setHit(rs.getInt(4));
				//   01234567890123456789
				//   2017-03-12 10:10:2.0
				Calendar cal = Calendar.getInstance();//오늘날짜
				//Db의 날짜와 현재날짜 비교
				String nowDate = cal.get(Calendar.YEAR)+"-";
				
				int m = cal.get(Calendar.MONTH)+1;
				if(m<10) nowDate+="0"+m+"-";
				else{nowDate+=m+"-";}
				
				int d = cal.get(Calendar.DATE);
				if(d<10)nowDate +="0"+d;
				else nowDate+=d;
				
				//System.out.println(nowDate+"=="+rs.getString(5).substring(0, 10));
				if(nowDate.equals(rs.getString(5).substring(0, 10))){
					vo.setWriteDate(rs.getString(5).substring(11,16));
				}else{
					vo.setWriteDate(rs.getString(5).substring(5,10));
				}
			
				list.add(vo);
			}
			
		}catch(Exception e){
			System.out.println("selectPage() 에러 =" + e.getMessage());
		}finally{dbClose();}
		
		//컬렉션에 담김 vo객체들을 리턴한다.
		return list;
	}
	//레코드 선택 (1개 레코드) 
	public void selectRecord(BoardBeanVO vo, int hit){
		try{
			//레코드 선택
			String sql = "select num, userName, subject, content, writedate, hit from board where num=?";
			dbConn(sql);
			pstmt.setInt(1, vo.getNum());
			
			rs = pstmt.executeQuery();
			if(rs.next()){				 
			     vo.setUserName(rs.getString(2));
			     vo.setSubject(rs.getString(3));
			     vo.setContent(rs.getString(4));
			     vo.setWriteDate(rs.getString(5));
			     vo.setHit(rs.getInt(6)+1);
			     
			     //조회수 
			     if(hit==1)hitCount(vo.getNum());
			}
			
		}catch(Exception e){
			System.out.println("레코드 선택에러 = "+e.getMessage());
		}
		finally{dbClose();}
		
	}
	public void hitCount(int num){
		try{
			String sql = "update board set hit=hit+1 where num=?";
			dbConn(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("조회수 count에러 = "+e.getMessage());
		}finally{dbClose();}
	}
	//레코드 수정
	public int updateRecord(BoardBeanVO vo){
		int result=0;
		try{
			String sql = "update board set userName=?, subject=?, content=? where num=?";
			dbConn(sql);
			pstmt.setString(1, Encoding.toKorUTF(vo.getUserName()));
			pstmt.setString(2, Encoding.toKorUTF(vo.getSubject()));
			pstmt.setString(3, Encoding.toKorUTF(vo.getContent()));
			pstmt.setInt(4, vo.getNum());
			
			result = pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("레코드 수정 에러 = "+e.getMessage());
		}finally{dbClose();}
		
		return result;
	}
	//레코드 삭제
	public int recordDelete(int num){
		int result=0;
		try{
			String sql = "delete from board where num=?";
			
			dbConn(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("레코드 삭제 에러 = " + e.getMessage());
		}
		finally{
			dbClose();
		}
		return result;
	}
	//여러개의 레코드 삭제
	public int deleteRecordAll(String num[]){
		int result=0;
		try{
			String sql = "delete from board where num=? ";
			for(int i=1; i<num.length; i++){
				sql += " or num=? ";
			}
			dbConn(sql);
			for(int i=0; i<num.length; i++){
				pstmt.setInt(i+1, Integer.parseInt(num[i]));
			}
			result = pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("deleteRecordAll() 에러 = "+ e.getMessage());}
		finally{dbClose();}
		return result;
	}
}





