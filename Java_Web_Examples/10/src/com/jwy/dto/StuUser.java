package com.jwy.dto;

public class StuUser implements java.io.Serializable {
	private Integer id;			//ѧ�����
	private String stuName;		//ѧ������
	private String stuNo;		//ѧ��ѧ��
	private Integer specialtyId;//ѧ����ѧרҵ���	
	private String stuSex;		//ѧ���Ա�
	private String birthday;	//ѧ������������
	private String homeAddr;	//ѧ����ͥ��ַ
	private String tel;			//ѧ���绰
	private String addr;		//ѧ����ǰ��ס��ַ

	// Constructors

	/** default constructor */
	public StuUser() {
	}

	/** full constructor */
	public StuUser(Integer id, String stuName, String stuNo,
			Integer specialtyId, String stuSex, String birthday,
			String homeAddr, String tel, String addr) {
		this.id = id;
		this.stuName = stuName;
		this.stuNo = stuNo;
		this.specialtyId = specialtyId;
		this.stuSex = stuSex;
		this.birthday = birthday;
		this.homeAddr = homeAddr;
		this.tel = tel;
		this.addr = addr;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStuName() {
		return this.stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getStuNo() {
		return this.stuNo;
	}

	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}

	public Integer getSpecialtyId() {
		return this.specialtyId;
	}

	public void setSpecialtyId(Integer specialtyId) {
		this.specialtyId = specialtyId;
	}

	public String getStuSex() {
		return this.stuSex;
	}

	public void setStuSex(String stuSex) {
		this.stuSex = stuSex;
	}

	public String getBirthday() {
		return this.birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getHomeAddr() {
		return this.homeAddr;
	}

	public void setHomeAddr(String homeAddr) {
		this.homeAddr = homeAddr;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

}