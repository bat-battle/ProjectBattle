package com.wgh.actionForm;

import org.apache.struts.action.ActionForm;

public class ManagerForm extends ActionForm {
	private int ID;			//ID��	
	private String pwd;		//����
	private String name;	//����Ա����
	private String oldpwd;	//ԭ����
	public int getID() {
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOldpwd() {
		return oldpwd;
	}
	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}
}