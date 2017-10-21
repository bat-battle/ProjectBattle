package com.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.actionForm.ManagerForm;
import com.dao.ManagerDAO;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class Manager extends HttpServlet {
	private ManagerDAO managerDAO = null; // ����ManagerDAO�Ķ���

	public Manager() {
		this.managerDAO = new ManagerDAO(); // ʵ����ManagerDAO��
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("��ȡ�Ĳ�ѯ�ַ�����" + action);
		if (action == null || "".equals(action)) {
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else if ("login".equals(action)) {// ��actionֵΪloginʱ������managerLogin()������֤����Ա���
			managerLogin(request, response);
		} else if ("managerAdd".equals(action)) {
			managerAdd(request, response);// ��ӹ���Ա��Ϣ
		} else if ("managerQuery".equals(action)) {
			managerQuery(request, response);// ��ѯ����Ա��Ȩ����Ϣ
		} else if ("managerModifyQuery".equals(action)) {
			managerModifyQuery(request, response);// ���ù���ԱȨ��ʱ��ѯ����Ա��Ϣ
		} else if ("managerModify".equals(action)) {
			managerModify(request, response);// ���ù���ԱȨ��
		} else if ("managerDel".equals(action)) {
			managerDel(request, response);// ɾ������Ա
		} else if ("querypwd".equals(action)) {
			pwdQuery(request, response);// ���Ŀ���ʱӦ�õĲ�ѯ
		} else if ("modifypwd".equals(action)) {
			modifypwd(request, response); // ���Ŀ���
		}
	}

	// ����Ա�����֤

	public void managerLogin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ManagerForm managerForm = new ManagerForm();//ʵ����managerForm��
		managerForm.setName(request.getParameter("name"));//��ȡ����Ա���Ʋ�����name����
		managerForm.setPwd(request.getParameter("pwd"));//��ȡ����Ա���벢����pwd����
		int ret = managerDAO.checkManager(managerForm);//����ManagerDAO���checkManager()����
		if (ret == 1) {
			/**********����¼��ϵͳ�Ĺ���Ա���Ʊ��浽session��***********************************/
            HttpSession session=request.getSession();
            session.setAttribute("manager",managerForm.getName());
		/***********************************************************************************/
			request.getRequestDispatcher("main.jsp").forward(request, response);//ת��ϵͳ������
		} else {
			request.setAttribute("error", "������Ĺ���Ա���ƻ��������");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);//ת��������ʾҳ
		}
	}

	// ��ѯ����Ա��Ϣ
	private void managerQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String str = null;
		request.setAttribute("managerQuery", managerDAO.query(str));
		request.getRequestDispatcher("manager.jsp").forward(request, response);
	}

	// ��ӹ���Ա��Ϣ
	private void managerAdd(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ManagerForm managerForm = new ManagerForm();
		managerForm.setName(request.getParameter("name")); // ��ȡ���ù���Ա����
		managerForm.setPwd(request.getParameter("pwd")); // ��ȡ����������
		int ret = managerDAO.insert(managerForm); // ������ӹ���Ա��Ϣ
		if (ret == 1) {
			request.getRequestDispatcher("manager_ok.jsp?para=1").forward(
					request, response); // ת������Ա��Ϣ��ӳɹ�ҳ��

		} else if (ret == 2) {
			request.setAttribute("error", "�ù���Ա��Ϣ�Ѿ���ӣ�"); // ��������Ϣ���浽error������
			request.getRequestDispatcher("error.jsp")
					.forward(request, response); // ת��������ʾҳ��
		} else {
			request.setAttribute("error", "��ӹ���Ա��Ϣʧ�ܣ�"); // ��������Ϣ���浽error������
			request.getRequestDispatcher("error.jsp")
					.forward(request, response); // ת��������ʾҳ��
		}
	}

	// ��ѯ�޸Ĺ���Ա��Ϣ
	private void managerModifyQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ManagerForm managerForm = new ManagerForm();
		managerForm.setId(Integer.valueOf(request.getParameter("id")));// ��ȡ�����ù���ID��
		System.out.print("��ѯ����id:" + request.getParameter("id"));
		request.setAttribute("managerQueryif", managerDAO
				.query_update(managerForm));
		request.getRequestDispatcher("manager_Modify.jsp").forward(request,
				response); // ת��Ȩ�����óɹ�ҳ��
	}

	// �޸�����ʱ��ѯ
	private void pwdQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ManagerForm managerForm = new ManagerForm();
		HttpSession session = request.getSession();
		String manager = (String) session.getAttribute("manager");
		managerForm.setName(manager);
		System.out.print("��ѯ����manager:" + manager);
		request.setAttribute("pwdQueryif", managerDAO.query_pwd(managerForm));
		request.getRequestDispatcher("pwd_Modify.jsp").forward(request,
				response);
	}

	// ����ԱȨ������
	private void managerModify(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ManagerForm managerForm = new ManagerForm();
		managerForm.setId(Integer.parseInt(request.getParameter("id"))); // ��ȡ�����ù���ԱID��
		managerForm.setName(request.getParameter("name")); // ��ȡ�����ù���Ա����
		managerForm.setPwd(request.getParameter("pwd")); // ��ȡ�����ù���Ա����
		managerForm.setSysset(request.getParameter("sysset") == null ? 0
				: Integer.parseInt(request.getParameter("sysset"))); // ��ȡ������ϵͳ����Ȩ��
		managerForm.setReaderset(request.getParameter("readerset") == null ? 0
				: Integer.parseInt(request.getParameter("readerset"))); // ��ȡ�����ö��߹���Ȩ��
		managerForm.setBookset(request.getParameter("bookset") == null ? 0
				: Integer.parseInt(request.getParameter("bookset"))); // ��ȡ������ͼ�����Ȩ��
		managerForm
				.setBorrowback(request.getParameter("borrowback") == null ? 0
						: Integer.parseInt(request.getParameter("borrowback"))); // ��ȡ������ͼ��軹Ȩ��
		managerForm.setSysquery(request.getParameter("sysquery") == null ? 0
				: Integer.parseInt(request.getParameter("sysquery"))); // ��ȡ������ϵͳ��ѯȨ��
		int ret = managerDAO.update(managerForm); // �������ù���ԱȨ�޵ķ���
		if (ret == 0) {
			request.setAttribute("error", "���ù���ԱȨ��ʧ�ܣ�"); // ���������ʾ��Ϣ��error������
			request.getRequestDispatcher("error.jsp")
					.forward(request, response); // ת��������ʾҳ��
		} else {
			request.getRequestDispatcher("manager_ok.jsp?para=2").forward(
					request, response);// ת��Ȩ�����óɹ�ҳ��
		}
	}

	// ɾ������Ա��Ϣ
	private void managerDel(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ManagerForm managerForm = new ManagerForm();
		managerForm.setId(Integer.valueOf(request.getParameter("id"))); // ��ȡ�����ù���ԱID��
		int ret = managerDAO.delete(managerForm); // ����ɾ����Ϣ�ķ���delete()
		if (ret == 0) {
			request.setAttribute("error", "ɾ������Ա��Ϣʧ�ܣ�"); // ���������ʾ��Ϣ��error������
			request.getRequestDispatcher("error.jsp")
					.forward(request, response); // ת��������ʾҳ��
		} else {
			request.getRequestDispatcher("manager_ok.jsp?para=3").forward(
					request, response); // ת��ɾ������Ա��Ϣ�ɹ�ҳ��
		}
	}

	// �޸Ĺ���Ա����
	private void modifypwd(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ManagerForm managerForm = new ManagerForm();
		managerForm.setName(request.getParameter("name"));
		managerForm.setPwd(request.getParameter("pwd"));
		int ret = managerDAO.updatePwd(managerForm);
		if (ret == 0) {
			request.setAttribute("error", "���Ŀ���ʧ�ܣ�");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else {
			request.getRequestDispatcher("pwd_ok.jsp").forward(request,
					response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
