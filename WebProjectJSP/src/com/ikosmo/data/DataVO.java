package com.ikosmo.data;

public class DataVO {
	private int num;
	private String userName;
	private String title;
	private String content;
	private String fileName[];
	private String writeDate;
	//?????? ???? ????
		private int delCount;//?????? ????
		private String delFile[];//?????? ?????
		public int getDelCount() {
			return delCount;
		}
		public void setDelCount(int delCount) {
			this.delCount = delCount;
		}
		public String[] getDelFile() {
			return delFile;
		}
		public void setDelFile(String[] delFile) {
			this.delFile = delFile;
		}
	public DataVO() {}
	public static DataVO getInstance(){
		return new DataVO();
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String[] getFileName() {
		return fileName;
	}
	public void setFileName(String[] fileName) {
		this.fileName = fileName;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	
}
