package com.mr.webiter;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.mr.dao.ObjectDao;
import com.mr.model.AdminInfo;

public class AdminAction extends ActionSupport
		implements
			ModelDriven<AdminInfo>,
			ServletRequestAware {
	private AdminInfo adminInfo = new AdminInfo();
	private ObjectDao<AdminInfo> objectDao = null;
	private String hql = "";
	protected HttpServletRequest request;

	public AdminInfo getModel() {
		return adminInfo;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void validateAdmin_passwordUpdate() {
		String oldPassword = request.getParameter("oldPassword");
		if (null == oldPassword || oldPassword.equals("")) {
			this.addFieldError("oldPassword", "������ԭ���룡");
		} else {
			oldPassword = com.mr.tools.ValidateExpression
					.encodeMD5(oldPassword);
			String admin = (String) request.getSession().getAttribute("admin");
			hql = "from AdminInfo where account = '" + admin + "'";
			objectDao = new ObjectDao<AdminInfo>();
			AdminInfo admininfo = objectDao.queryFrom(hql);
			if (!oldPassword.equals(admininfo.getPassword())) {
				this.addFieldError("oldPassword", "�������ԭ��������");
			}
		}
		if (adminInfo.getPassword().equals("")) {
			this.addFieldError("password", "�����������룡");
		}
		if (adminInfo.getRepassword().equals("")) {
			this.addFieldError("repassword", "������ȷ�����룡");
		}
		System.out.println("�����룺" + adminInfo.getPassword());
		System.out.println("����ȷ�ϣ�" + adminInfo.getRepassword());
		System.out.println("��֤�룺" + adminInfo.getCode());
		if (!adminInfo.getPassword().equals(adminInfo.getRepassword())) {
			this.addFieldError("repassword", "�������������������ȷ�ϲ�һ�£�");
		}
		if (adminInfo.getCode().equals("")) {
			this.addFieldError("code", "��������֤�룡");
		} else {
			String rand = (String) request.getSession().getAttribute("rand");
			if (!rand.equals(adminInfo.getCode())) {
				this.addFieldError("code", "�������У���벻��ȷ��");
			}
		}
	}

	public String admin_passwordUpdate() {
		String password = adminInfo.getPassword();
		password = com.mr.tools.ValidateExpression.encodeMD5(password);
		String admin = (String) request.getSession().getAttribute("admin");
		hql = "from AdminInfo where account = '" + admin + "'";
		objectDao = new ObjectDao<AdminInfo>();
		adminInfo = objectDao.queryFrom(hql);
		adminInfo.setPassword(password);
		String result = "����Ա�޸�����ʧ�ܣ�";
		if (objectDao.updateT(adminInfo)) {
			result = "����Ա�޸�����ɹ���";
		}
		request.setAttribute("result", result);
		return SUCCESS;
	}

	// ��̨����Ա�˳�
	public String landOutAdmin() {
		request.getSession().invalidate();
		request.setAttribute("sign", "4");
		return "operationAdmin";
	}

	// ��̨����Ա�û���¼У��
	public void validateAdmin_check() {
		if (adminInfo.getAccount().equals("")) {
			this.addFieldError("account", "&nbsp;&nbsp;�˺Ų���Ϊ�գ�");
		}
		if (adminInfo.getPassword().equals("")) {
			this.addFieldError("password", "&nbsp;&nbsp;���벻��Ϊ�գ�");
		}
		if (adminInfo.getCode().equals("")) {
			this.addFieldError("code", "&nbsp;&nbsp;У���벻��Ϊ�գ�");
		} else {
			String rand = (String) request.getSession().getAttribute("rand");
			if (!rand.equals(adminInfo.getCode())) {
				this.addFieldError("code", "&nbsp;&nbsp;�������У���벻��ȷ��");
			}
		}
	}
	// ��̨����Ա��¼����
	public String admin_check() {
		objectDao = new ObjectDao<AdminInfo>();
		String password = com.mr.tools.ValidateExpression.encodeMD5(adminInfo
				.getPassword());
		hql = "from AdminInfo where account = '" + adminInfo.getAccount() + "'";
		AdminInfo admin = objectDao.queryFrom(hql);
		if (null == admin) {
			this.addFieldError("account", "&nbsp;&nbsp;���û��������ڣ�");
		} else {
			if (!admin.getPassword().equals(password)) {
				this.addFieldError("password", "&nbsp;&nbsp;���������������");
			} else {
				request.setAttribute("admin", admin.getAccount());
				request.setAttribute("sign", "2");
			}
		}
		return "operationAdmin";
	}

}
