package com.yxq.action;

import com.yxq.actionSuper.MySuperAction;
import com.yxq.dao.OpDB;
import com.yxq.model.UserSingle;

public class LogInOutAction extends MySuperAction {	
	protected UserSingle user;
	
	public UserSingle getUser() {
		return user;
	}
	public void setUser(UserSingle user) {
		this.user = user;
	}

	/** ���ܣ��жϵ�ǰ�û��Ƿ��¼ */
	public String isLogin(){
		Object ob=session.get("loginUser");
		if(ob==null||!(ob instanceof UserSingle))
			return INPUT;
		else
			return LOGIN;
	}
	
	/** ���ܣ���ѯ���ݱ���֤�Ƿ���ڸ��û� */
	public String Login(){
		String sql="select * from tb_user where user_name=? and user_password=?";
		Object[] params={user.getUserName(),user.getUserPassword()};
		OpDB myOp=new OpDB();
		if(myOp.LogOn(sql, params)){				//��¼�ɹ�
			session.put("loginUser",user);
			return LOGIN;
		}
		else{										//�û������������
			addFieldError("loginE",getText("city.login.wrong.input"));
			return INPUT;
		}
	}
	
	/** ���ܣ��˳���¼ */
	public String Logout(){		
		session.clear();	
		return "logout";
	}
	
	/** ���ܣ���֤�Ƿ������û��������� */
	public void validateLogin() {
		String name=user.getUserName();
		String password=user.getUserPassword();
		
		if(name==null||name.equals(""))
			addFieldError("nameError",getText("city.login.no.name"));
		if(password==null||password.equals(""))
			addFieldError("passwordError",getText("city.login.no.password"));
	}
}
