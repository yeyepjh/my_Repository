package com.ikosmo.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnection {
	//�뱶�씪�씠踰� 濡쒕뵫
	static{
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e){System.out.println("�뱶�씪�씠釉� 濡쒕뵫 �뿉�윭");}
	}
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String dbId="scott";
	String dbPwd="tiger";
	
	protected Connection con;
	protected PreparedStatement pstmt;
	protected ResultSet rs;
	public DBConnection() {
	}
	//Db�뿰寃�
	public void dbConn(String sql){
		try{
			con = DriverManager.getConnection(url, dbId, dbPwd);
			pstmt = con.prepareStatement(sql);
		}catch(Exception e){
			System.out.println("DB�뿰寃곗뿉�윭 = "+e.getMessage());
		}
	}
	
	//Db�떕湲�
	public void dbClose(){
		try{
			if(con!=null)con.close();
			if(pstmt!=null)pstmt.close();
			if(rs!=null)rs.close();
		}catch(Exception e){
			System.out.println("DB�떕湲� �뿉�윭 = " + e.getMessage());
		}
	}
}
