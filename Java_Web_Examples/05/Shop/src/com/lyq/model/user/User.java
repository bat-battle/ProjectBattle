package com.lyq.model.user;

import java.io.Serializable;
/**
 * ����Ա
 * @author Li Yongqiang
 */
public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	// ���
	private Integer id;
	// �û���
	private String username;
	// ����
	private String password;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
