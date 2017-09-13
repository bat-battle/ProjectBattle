package com.action;

import org.apache.struts.action.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.actionForm.ManagerForm;
import com.dao.ManagerDAO;
import javax.servlet.http.HttpSession;

public class Manager extends Action {
	private ManagerDAO managerDAO = null;

	public Manager() {
		this.managerDAO = new ManagerDAO();
	}

	public void execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		System.out.println("��ȡ�Ĳ�ѯ�ַ�����" + action);
		if (action == null || "".equals(action)) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		} else if ("login".equals(action)) {
			return managerLogin(mapping, form, request, response);
		} else if ("managerAdd".equals(action)) {
			return managerAdd(mapping, form, request, response);
		} else if ("managerQuery".equals(action)) {
			return managerQuery(mapping, form, request, response);
		} else if ("managerModifyQuery".equals(action)) {
			return managerModifyQuery(mapping, form, request, response);
		} else if ("managerModify".equals(action)) {
			return managerModify(mapping, form, request, response);
		} else if ("managerDel".equals(action)) {
			return managerDel(mapping, form, request, response);
		} else if ("querypwd".equals(action)) {
			return pwdQuery(mapping, form, request, response);
		} else if ("modifypwd".equals(action)) {
			return modifypwd(mapping, form, request, response);
		}
		request.setAttribute("error", "����ʧ�ܣ�");
		request.getRequestDispatcher("error.jsp").forward(request, response);
	}

	// ����Ա�����֤

	public void managerLogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		managerForm.setName(managerForm.getName());
		managerForm.setPwd(managerForm.getPwd());
		int ret = managerDAO.checkManager(managerForm);
		System.out.print("��֤���ret��ֵ:" + ret);
		if (ret == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("manager", managerForm.getName());
			return mapping.findForward("managerLoginok");
		} else {
			request.setAttribute("error", "������Ĺ���Ա���ƻ��������");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	// ��ѯ����Ա��Ϣ
	private void managerQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String str = null;
		request.setAttribute("managerQuery", managerDAO.query(str));
		return mapping.findForward("managerQuery");
	}

	// ��ӹ���Ա��Ϣ
	private void managerAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		managerForm.setName(managerForm.getName()); // ��ȡ���ù���Ա����
		managerForm.setPwd(managerForm.getPwd()); // ��ȡ����������
		int ret = managerDAO.insert(managerForm); // ������ӹ���Ա��Ϣ
		if (ret == 1) {
			return mapping.findForward("managerAdd"); // ת������Ա��Ϣ��ӳɹ�ҳ��
		} else if (ret == 2) {
			request.setAttribute("error", "�ù���Ա��Ϣ�Ѿ���ӣ�"); // ��������Ϣ���浽error������
			request.getRequestDispatcher("error.jsp").forward(request, response); // ת��������ʾҳ��
		} else {
			request.setAttribute("error", "��ӹ���Ա��Ϣʧ�ܣ�"); // ��������Ϣ���浽error������
			request.getRequestDispatcher("error.jsp").forward(request, response); // ת��������ʾҳ��
		}
	}

	// ��ѯ�޸Ĺ���Ա��Ϣ
	private void managerModifyQuery(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		managerForm.setId(Integer.valueOf(request.getParameter("id")));//��ȡ�����ù���ID��
		System.out.print("��ѯ����id:" + request.getParameter("id"));
		request.setAttribute("managerQueryif", managerDAO
				.query_update(managerForm));
		return mapping.findForward("managerQueryModify");			//ת��Ȩ�����óɹ�ҳ��
	}

	// �޸�����ʱ��ѯ
	private void pwdQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		HttpSession session = request.getSession();
		String manager = (String) session.getAttribute("manager");
		managerForm.setName(manager);
		System.out.print("��ѯ����manager:" + manager);
		request.setAttribute("pwdQueryif", managerDAO.query_pwd(managerForm));
		return mapping.findForward("pwdQueryModify");
	}

	// �޸Ĺ���Ա��Ϣ
	private void managerModify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		managerForm.setId(managerForm.getId());				//��ȡ�����ù���ԱID��
		managerForm.setName(managerForm.getName());			//��ȡ�����ù���Ա����
		managerForm.setPwd(managerForm.getPwd());			//��ȡ�����ù���Ա����
		managerForm.setSysset(managerForm.getSysset());			//��ȡ������ϵͳ����Ȩ��
		managerForm.setReaderset(managerForm.getReaderset());		//��ȡ�����ö��߹���Ȩ��
		managerForm.setBookset(managerForm.getBookset());		//��ȡ������ͼ�����Ȩ��
		managerForm.setBorrowback(managerForm.getBorrowback());	//��ȡ������ͼ��軹Ȩ��
		managerForm.setSysquery(managerForm.getSysquery());		//��ȡ������ϵͳ��ѯȨ��
		int ret = managerDAO.update(managerForm);				//�������ù���ԱȨ�޵ķ���
		if (ret == 0) {
			request.setAttribute("error", "���ù���ԱȨ��ʧ�ܣ�");	//���������ʾ��Ϣ��error������
			request.getRequestDispatcher("error.jsp").forward(request, response);				//ת��������ʾҳ��
		} else {
			return mapping.findForward("managerModify");		//ת��Ȩ�����óɹ�ҳ��
		}
	}


	// ɾ������Ա��Ϣ
	private void managerDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		managerForm.setId(Integer.valueOf(request.getParameter("id")));	//��ȡ�����ù���ԱID��
		int ret = managerDAO.delete(managerForm);		//����ɾ����Ϣ�ķ���delete()
		if (ret == 0) {
			request.setAttribute("error", "ɾ������Ա��Ϣʧ�ܣ�");	//���������ʾ��Ϣ��error������
			request.getRequestDispatcher("error.jsp").forward(request, response);	//ת��������ʾҳ��
		} else {
			return mapping.findForward("managerDel");	//ת��ɾ������Ա��Ϣ�ɹ�ҳ��
		}
	}

	// �޸Ĺ���Ա����
	private void modifypwd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		managerForm.setName(managerForm.getName());
		managerForm.setPwd(managerForm.getPwd());
		int ret = managerDAO.updatePwd(managerForm);
		if (ret == 0) {
			request.setAttribute("error", "���Ŀ���ʧ�ܣ�");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		} else {
			return mapping.findForward("pwdModify");
		}
	}
}
