package com.hiernate.persistence;
/**
 * �û��־û���
 *
 */
public class User {
   private int id;                //�û���id��
   private String userName;       //�û���¼ϵͳʱ���õ��û���
   private String pwd;            //�û�����
   private String name;           //�û�����ʵ����
   private String purview;        //�û�Ȩ��
   private String branch;         //�û����ڵĲ���
   private String job;            //�û�����
   private String sex;            //�û��Ա�
   private String email;          //�û���E-mail��ַ
   private String  tel;           //�û��绰
   private String address;        //�û���ַ
   private int bestMan;           //����Ա�����

public int getBestMan() {
	return bestMan;
}
public void setBestMan(int bestMan) {
	this.bestMan = bestMan;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}

public String getBranch() {
	return branch;
}
public void setBranch(String branch) {
	this.branch = branch;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getJob() {
	return job;
}
public void setJob(String job) {
	this.job = job;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPurview() {
	return purview;
}
public void setPurview(String purview) {
	this.purview = purview;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
}