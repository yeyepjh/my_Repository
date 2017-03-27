package com.ikosmo.utility;

public class Encoding {

	//iso_8859-1을 UTF-8로 인코딩하여 리턴하는 메소드
	public static String toKorUTF(String str){
		String encode="";
		try{
			encode = new String(str.getBytes("ISO_8859-1"), "UTF-8");			
		}catch(Exception e){
			System.out.println("인코딩 에러 = "+ e.getMessage());
		}
		return encode;
	}
}
