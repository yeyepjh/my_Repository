package com.ikosmo.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	//드라이버 로딩
	static{
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e){
			System.out.println("드라이버 로딩 에러 = "+e.getMessage());
		}
	}
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	public MemberDAO() {
		try{
			String url="jdbc:oracle:thin:@localhost:1521:orcl";
			String id="scott";
			String pwd="tiger";
			conn = DriverManager.getConnection(url,id,pwd);
		}catch(Exception e){
			System.out.println("DB연결에러 = " + e.getMessage());
		}
	}
	//레코드추가
	public int insertRecord(MemberVO vo){
		int result=0;
		try{
			String sql = "insert into member(no, name, tel, email) "
					    + "values(guestbookSq.nextVal, ?,?,?)";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, vo.getName());
		    pstmt.setString(2, vo.getTel());
		    pstmt.setString(3, vo.getEmail());
		    
		    result = pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("레코드추가 에러 = "+e.getMessage());
		}finally{
			
		}
		return result;
	}
	//레코드 선택
	public void selectRecord(){}
	//레코드 전체선택
	public void selectAllRecord(){}
	//레코드 수정
	public void updateRecord(){}
	//레코드 삭제
	public void deleteRecord(){}

}
