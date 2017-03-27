package com.ikosmo.register;

import java.util.ArrayList;
import java.util.List;

import com.ikosmo.utility.DBConnection;
import com.ikosmo.utility.Encoding;

public class RegisterDAO extends DBConnection{

	public RegisterDAO() {}
	//회원가입
	public int insertRecord(RegisterVO vo){
		int cnt = 0;
		try{
			String sql = "insert into register values(registerSq.nextVal,?,?,?,?,?,?,?,?,?,?,sysdate)";
			dbConn(sql);
			
			//데이타 셋팅
			pstmt.setString(1, vo.getUserId());//아이디
			pstmt.setString(2, vo.getUserPwd());//비밀번호
			pstmt.setString(3, Encoding.toKorUTF(vo.getUserName()));//이름
			pstmt.setString(4, vo.getFullEmail());//이메일
			pstmt.setString(5, vo.getPhone());//전화번호
			pstmt.setInt(6, vo.getZipcode());//주소
			pstmt.setString(7, Encoding.toKorUTF(vo.getAddr()));
			pstmt.setString(8, Encoding.toKorUTF(vo.getAddr2()));
			pstmt.setString(9, vo.getEmailSend());//수신여부
			pstmt.setString(10, vo.getInterestStr());//관심분야
			
			cnt = pstmt.executeUpdate();
		}catch(Exception e){System.out.println("회원가입에러 = "+e.getMessage());}
		finally{dbClose();}		
		return cnt;
	}
	//아이디 중복검사
	public int idCheck(String id){
		int result = 0;
		try{
			String sql = "select count(userId) from register where userId=?";
			dbConn(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
			}
		}catch(Exception e){
			System.out.println("아이디 중복확인 = "+e.getMessage());
		}finally{dbClose();}
		return result;
	}
	//우편번호 검색
	public List<ZipcodeVO> zipcodeSelect(String doroName){
		List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
		try{
			String sql = "select num, zipcode, nvl(sido,' '), nvl(sigungu,' '), nvl(um,' '), "
					+ "nvl(doroName,' '),nvl(gunmula,' '), nvl(gunmulb,' '), "
					+ "nvl(gunmulc,' '), nvl(dong,' ')  from zipcode where doroName like '%"+doroName+"%'";
			dbConn(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ZipcodeVO vo = new ZipcodeVO();
				vo.setZipcode(rs.getInt(2));
				vo.setSido(rs.getString(3));
				vo.setSigungu(rs.getString(4)); 
				vo.setUm(rs.getString(5));
				vo.setDoroName(rs.getString(6));
				vo.setGunmula(rs.getString(7));
				vo.setGunmulb(rs.getString(8));
				if(vo.getGunmulb().equals("0"))vo.setGunmulb("");
				vo.setGunmulc(rs.getString(9));
				if(vo.getGunmulc().equals("0"))vo.setGunmulc("");
				vo.setDong(rs.getString(10));
				list.add(vo);
	
			}
		}catch(Exception e){
			System.out.println("우편번호 검색에러 = "+e.getMessage());
		}finally{
			dbClose();
		}		
		return list;
	}
	//로그인 
	public void loginSelect(RegisterVO vo){
		try{
			String sql = "select userName from register where userId=? and userPwd=?";
			dbConn(sql);
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getUserPwd());
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setUserName(rs.getString(1));
			}
		}catch(Exception e){
			System.out.println("로그인 검색에러 = "+e.getMessage());
		}finally{dbClose();}
	}
	//1명의 회원 선택
	public void selectRecord(RegisterVO vo){
		try{
			String sql ="select * from register where userId=?";
			dbConn(sql);
			pstmt.setString(1, vo.getUserId());
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setNum(rs.getInt(1));
				vo.setUserName(rs.getString(4));
				vo.setFullEmail(rs.getString(5));
				vo.setPhone(rs.getString(6));
				vo.setZipcode(rs.getInt(7));
				vo.setAddr(rs.getString(8));
				vo.setAddr2(rs.getString(9));
				vo.setEmailSend(rs.getString(10));
				vo.setInterest(rs.getString(11));
			}
		}catch(Exception e){
			System.out.println("레코드 선택에러 ="+ e.getMessage());
		}finally{dbClose();}
	}
	//회원정보 수정
	public int updateRecord(RegisterVO vo){
		int result = 0;
		try{
			//아이디와 비밀번호가 일치할 경우 수정
			String sql = "update register set email=?, phone=?, zipcode=?, "
					+ "addr=?, addr2=?, emailSend=?, interest=? "
					+ "where userId=? and userPwd=?";
			dbConn(sql);
			pstmt.setString(1, vo.getFullEmail());
			pstmt.setString(2, vo.getPhone());
			pstmt.setInt(3, vo.getZipcode());
			pstmt.setString(4, Encoding.toKorUTF(vo.getAddr()));
			pstmt.setString(5, Encoding.toKorUTF(vo.getAddr2()));
			pstmt.setString(6, vo.getEmailSend());
			pstmt.setString(7, vo.getInterestStr());
			pstmt.setString(8, vo.getUserId());
			pstmt.setString(9, vo.getUserPwd());
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("회원정보 수정 에러 = "+e.getMessage());
		}finally{dbClose();}
		
		return result;
	}
	//회원탈퇴
	public int deleteRecord(String userId){
		int r = 0;
		try{
			String sql = "delete from register where userId=?";
			dbConn(sql);
			pstmt.setString(1, userId);
			r = pstmt.executeUpdate();
		}catch(Exception e){System.out.println("회원탈퇴에러 ="+e.getMessage());}
		finally{dbClose();}
		return r;
	}
	//아이디 검색
	public void idSearch(RegisterVO vo){
		try{
			//아이디의 50%출력  나머지 ******    abcdd*****    abdscde******
			//                        RPAD(출력할문자, 총자리수, 나머지자리에표시할 문자) 
			String sql = "select RPAD(substr(userId,0,FLOOR(LENGTH(userId)/2)),LENGTH(userId),'*') "
					+ "from register where userName=? and phone=?";
			dbConn(sql);
			pstmt.setString(1, Encoding.toKorUTF(vo.getUserName()));
			pstmt.setString(2, vo.getPhone());
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setUserId(rs.getString(1));
			}
		}catch(Exception e){System.out.println("아이디검색에러 = "+e.getMessage());}
		finally{dbClose();}
	}
	//비밀번호 찾기
	public void pwdSearch(RegisterVO vo){
		try{
			String sql = "select RPAD(SUBSTR(userPwd,0,FLOOR(LENGTH(userPwd)/2)),LENGTH(userPwd),'*') "
					+ "from register where userId=? and userName=? and phone=?";
			dbConn(sql);
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, Encoding.toKorUTF(vo.getUserName()));
			pstmt.setString(3, vo.getPhone());
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setUserPwd(rs.getString(1));
			}
		}catch(Exception e){
			System.out.println("비밀번호 검색 에러 = "+e.getMessage());
		}finally{dbClose();}
	}
}








