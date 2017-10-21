package com.wgh.action;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import com.wgh.actionForm.ManagerForm;
import com.wgh.dao.ManagerDAO;

public class Manager extends Action {
	private ManagerDAO managerDAO = null;

	public Manager() {
		this.managerDAO = new ManagerDAO();
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		System.out.println("��ȡ�Ĳ�ѯ�ַ�����" + action);
		if (action == null || "".equals(action)) {
			return mapping.findForward("error");
		} else if ("login".equals(action)) {
			return managerLogin(mapping, form, request, response);

		} else if ("managerQuery".equals(action)) {
			return managerQuery(mapping, form, request, response);

		} else if ("managerAdd".equals(action)) {
			return managerAdd(mapping, form, request, response);
		} else if ("managerDel".equals(action)) {
			return managerDel(mapping, form, request, response);
		} else if ("queryPWD".equals(action)) {
			return pwdQuery(mapping, form, request, response);
		} else if ("modifypwd".equals(action)) {
			return modifypwd(mapping, form, request, response);
		}
		request.setAttribute("error", "����ʧ�ܣ�");
		return mapping.findForward("error");
	}

	// ����Ա�����֤
	public ActionForward managerLogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		int ret = managerDAO.checkManager(managerForm);
		System.out.print("��֤���ret��ֵ:" + ret);
		if (ret == 2) {
			request.setAttribute("error", "������Ĺ���Ա���ƻ��������");
			return mapping.findForward("error");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("manager", managerForm.getName());
			return mapping.findForward("managerLoginok");
		}
	}

	// ��ѯ����Ա��Ϣ
	private ActionForward managerQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("managerQuery", managerDAO.query(0));
		return mapping.findForward("managerQuery");
	}

	// ��ӹ���Ա��Ϣ
	private ActionForward managerAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		managerForm.setPwd(managerForm.getPwd());
		int ret = managerDAO.insert(managerForm);
		System.out.println("����ֵret��" + ret);
		if (ret == 1) {
			return mapping.findForward("managerAdd");
		} else if (ret == 2) {
			request.setAttribute("error", "�ù���Ա��Ϣ�Ѿ���ӣ�");
			return mapping.findForward("error");
		} else {
			request.setAttribute("error", "��ӹ���Ա��Ϣʧ�ܣ�");
			return mapping.findForward("error");
		}
	}

	// �޸�����ʱ��ѯ
	private ActionForward pwdQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("pwdQueryif", managerDAO.query(Integer.parseInt(request.getParameter("id"))));
		return mapping.findForward("pwdQueryModify");
	}

	// �޸Ĺ���Ա����
	private ActionForward modifypwd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		int ret = managerDAO.updatePwd(managerForm);
		if (ret == 0) {
			request.setAttribute("error", "�޸Ĺ���Ա����ʧ�ܣ�");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("pwdModify");
		}
	}

	// ɾ������Ա��Ϣ
	private ActionForward managerDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		managerForm.setID(Integer.parseInt(request.getParameter("id")));
		int ret = managerDAO.delete(managerForm);
		if (ret == 0) {
			request.setAttribute("error", "ɾ������Ա��Ϣʧ�ܣ�");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("managerDel");
		}
	}
}