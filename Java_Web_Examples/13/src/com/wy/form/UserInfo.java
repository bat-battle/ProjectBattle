package com.wy.form;

public class UserInfo {
	private Integer id = -1;      //�������ݿ��Զ���Ŷ���
	private String username = ""; //�����û����ƶ���
	private String password = ""; //�����û���¼�������
	private String realname = ""; //�����û���ʵ��������
	private String email = "";    //�����û�email��ַ����
	private String question = ""; //�����û��������
	private String result = "";   //�����û��𰸶���
	/*************��email��ַ��������ΪgetXXX()��setXXX()*******************/
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	/***********************************************/
	/*************��id��������ΪgetXXX()��setXXX()*******************/
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	/*************��password��������ΪgetXXX()��setXXX()*******************/
	/***********************************************/
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	/***********************************************/
	/*************��question��������ΪgetXXX()��setXXX()*******************/
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	/***********************************************/
	/*************��realname��������ΪgetXXX()��setXXX()*******************/
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	/***********************************************/
	/*************��result��������ΪgetXXX()��setXXX()*******************/
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}	
	/***********************************************/
	/*************��username��������ΪgetXXX()��setXXX()*******************/
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	/***********************************************/
}
