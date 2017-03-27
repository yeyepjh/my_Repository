package com.ikosmo.register;

import com.ikosmo.utility.Encoding;

public class RegisterVO {
	private int num;
	private String userId;
	private String userPwd;
	private String userName;
	
	private String fullEmail;
	private String email;
	private String domain;
	
	private String hand1;
	private String hand2;
	private String hand3;	
	private String phone;
	
	private int zipcode;
	private String addr;
	private String addr2;
	private String emailSend;
	private String interest[];
	private String writeDate;	
	
	public RegisterVO() {}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFullEmail() {
		return fullEmail;
	}

	public void setFullEmail(String fullEmail) {
		String mail[] = fullEmail.split("@");
		this.email = mail[0];
		this.domain = mail[1];
		this.fullEmail = fullEmail;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getHand1() {
		return hand1;
	}

	public void setHand1(String hand1) {
		this.hand1 = hand1;
	}
	/////////////                vo->010     010
	public String getHandChk(String h1, String h2){
		String result="";
		if(h1.equals(h2)){
			result = "selected";
		}
		return result;
	}
	////////////
	public String getHand2() {
		return hand2;
	}

	public void setHand2(String hand2) {
		this.hand2 = hand2;
	}

	public String getHand3() {
		return hand3;
	}

	public void setHand3(String hand3) {
		this.hand3 = hand3;
	}

	public String getPhone() {
		return hand1+"-"+hand2+"-"+hand3;
	}
//                              010-1234-2568
	public void setPhone(String phone) {
		String hand[] = phone.split("-");
		this.hand1 = hand[0];
		this.hand2 = hand[1];
		this.hand3 = hand[2];
		this.phone = phone;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getEmailSend() {
		return emailSend;
	}

	public void setEmailSend(String emailSend) {
		this.emailSend = emailSend;
	}

	public String[] getInterest() {
		return interest;
	}
	//////////////////////////
	public String getInterestStr(){
		String str="";
		for(int i=0; i<interest.length; i++){
			str += Encoding.toKorUTF(interest[i])+"/";
		}		
		return str;
	}	
	////////////////////////
	public void setInterest(String[] interest) {
		this.interest = interest;
	}
	/////
	public void setInterest(String interest){
		//게임/인터넷/자전거/     split  ->  게임 인터넷 자전거 _
		this.interest = interest.split("/");
	}
	/////
	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}	
}
