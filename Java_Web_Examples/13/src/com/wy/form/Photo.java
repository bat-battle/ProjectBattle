package com.wy.form;

public class Photo {
	private Integer id = -1;       // �������ݿ��Զ���ŵĶ���
	private String photoName = ""; // ������Ƭ���ƵĶ���
	private String photoSize = ""; // ������Ƭ��С�Ķ���
	private String photoTime = ""; // ������Ƭ�ϴ�ʱ��Ķ���
	private String photoAddress = ""; // ������Ƭ�����ڷ������˵�ַ�Ķ���
	private String username = ""; // ������Ƭ�ϴ��û��Ķ���
	private String photoType = ""; // ������Ƭ����������ƵĶ���
	private String printAddress="";
	
	
	private String smallPhoto="";
	
	private Integer number=null;
	

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getPrintAddress() {
		return printAddress;
	}

	public void setPrintAddress(String printAddress) {
		this.printAddress = printAddress;
	}

	//���������Ϣ�Ĺ��췽��
	public Photo() {
	}
	
	/******************������Ƭ����������ƶ����getXXX()��setXXX()����*************/
	public String getPhotoType() {
		return photoType;
	}

	public void setPhotoType(String photoType) {
		this.photoType = photoType;
	}
	/***************************************************/
	
	/******************�������ݿ��Զ���Ŷ����getXXX()��setXXX()����*************/
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	/***************************************************/
	/******************������Ƭ��ŷ������˵�ַ�����getXXX()��setXXX()����*************/
	public String getPhotoAddress() {
		return photoAddress;
	}
	
	public void setPhotoAddress(String photoAddress) {
		this.photoAddress = photoAddress;
	}
	/***************************************************/
	/******************������Ƭ���ƶ����getXXX()��setXXX()����*************/
	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	/***************************************************/
	/******************������Ƭ��С�����getXXX()��setXXX()����*************/
	public String getPhotoSize() {
		return photoSize;
	}

	public void setPhotoSize(String photoSize) {
		this.photoSize = photoSize;
	}
	/***************************************************/
	/******************������Ƭ�ϴ�ʱ������getXXX()��setXXX()����*************/
	public String getPhotoTime() {
		return photoTime;
	}

	public void setPhotoTime(String photoTime) {
		this.photoTime = photoTime;
	}
	/***************************************************/
	/******************������Ƭ�ϴ��û��������getXXX()��setXXX()����*************/
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	/***************************************************/

	public String getSmallPhoto() {
		return smallPhoto;
	}

	public void setSmallPhoto(String smallPhoto) {
		this.smallPhoto = smallPhoto;
	}
}
