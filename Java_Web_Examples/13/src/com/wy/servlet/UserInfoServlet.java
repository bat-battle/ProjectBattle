package com.wy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wy.dao.OperationData;
import com.wy.form.UserInfo;

public class UserInfoServlet extends HttpServlet {
	private String info = null; // ����String���Ͷ���info���ö��������ִ�в�ͬ�ķ���

	private OperationData data = null; // ����OperationData�����

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		info = request.getParameter("info");
		// ���ݲ�ͬ�Ĳ������ƣ�ִ�в�ͬ�ķ���
		if (info.equals("saveUser")) {
			this.user_save(request, response);
		}
		if (info.equals("checkUser")) {
			this.user_check(request, response);
		}
		if (info.equals("cannleUser")) {
			this.user_cannle(request, response);
		}
		if (info.equals("userLand")) {
			this.user_land(request, response);
		}
	}

	// ���û�ע��ɹ���ִ�и÷������Զ���¼�Ĺ���
	private void user_land(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData(); // data�������ʵ����
		String username = com.wy.tools.Encrypt.toChinese(request
				.getParameter("username")); // ��ҳ���л�ȡ�û���
		UserInfo userInfo = data.user_query(username); // ���û���Ϊ��������ѯ�û���Ϣ��һ������
		request.getSession().setAttribute("userInfo", userInfo); // ���û���Ϣ������session��
		request.getRequestDispatcher("index.jsp").forward(request, response); // ���ص���ҳ
	}

	// ���û���ɲ�����ִ�и÷�����ʵ���û�ע���Ĺ���
	private void user_cannle(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if (null != request.getSession().getAttribute("userInfo")) {
			request.getSession().invalidate(); // ʵ��session���ٵĲ���
		}
		request.getRequestDispatcher("index.jsp").forward(request, response); // ������ҳ��
	}

	// ʵ���û���¼����
	private void user_check(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		String username = com.wy.tools.Encrypt.toChinese(request
				.getParameter("username")); // ��ȡҳ�����û���������
		String password = com.wy.tools.Encrypt.encode(request
				.getParameter("password")); // ��ȡҳ���е����������
		UserInfo userInfo = data.user_query(username); // ���û���Ϊ�������в�ѯ�û���Ϣ��һ������
		String code = request.getParameter("code"); // ��ȡҳ���е�У����
		String codeSession = (String) request.getSession().getAttribute("rand"); // ��ȡ�ͻ���session�е�У��������
		if (code.equals(codeSession)) {
			if (null != userInfo) {				
				if (userInfo.getPassword().equals(password)) {
					request.getSession().setAttribute("userInfo", userInfo);
				}
			}
		}

		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	// ʵ���û�ע�Ṧ��
	private void user_save(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		data = new OperationData();
		UserInfo userInfo = new UserInfo();
		userInfo.setUsername(com.wy.tools.Encrypt.toChinese(request
				.getParameter("username"))); // ��ȡ�ͻ����û�����Ϣ�ı�
		userInfo.setPassword(com.wy.tools.Encrypt.encode(request
				.getParameter("password"))); // ��ȡ�ͻ���������Ϣ�ı�
		userInfo.setRealname(com.wy.tools.Encrypt.toChinese(request
				.getParameter("realname"))); // ��ȡ�ͻ�����ʵ�����ı�
		userInfo.setEmail(request.getParameter("email")); // ��ȡ�ͻ���email��ַ�ı�
		userInfo.setQuestion(com.wy.tools.Encrypt.toChinese(request
				.getParameter("question"))); // ��ȡ�ͻ�������ı�
		userInfo.setResult(com.wy.tools.Encrypt.toChinese(request
				.getParameter("result"))); // ��ȡ�ͻ��˴𰸵ı�
		String information = "";
		String code = request.getParameter("code"); // ��ȡ�ͻ�����֤��
		String codeSession = (String) request.getSession().getAttribute("rand"); // ��ȡ�ͻ���session�е�У����
		if (code.equals(codeSession)) { // �ж���֤���Ƿ���ȷ
			if (!data.user_save(userInfo)) { // �ж��û���������Ƿ�ɹ�
				information = "��������û����ظ���ע��ʧ�ܣ�";
			}
		} else {
			information = "������У���벻��ȷ��ע��ʧ�ܣ���";
		}
		if (information.equals("")) { // ����information�����ж��û��ĵ�¼���
			information = "�û�ע��ɹ���";
			String username = com.wy.tools.Encrypt.toChinese(request
					.getParameter("username"));
			request.setAttribute("information", information); // ���û�ע����������request��Χ��
			request.setAttribute("username", username); // ���û���������request��Χ��
			request.getRequestDispatcher("user_save.jsp").forward(request,
					response);
		}
		out.print("<script language=javascript>alert('" + information
				+ "');history.go(-1);</script>"); // ����û�ע��ʧ�ܣ�ҳ�潫��ת����һ��ҳ��
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);

	}

}
