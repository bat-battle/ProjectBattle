package com.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.actionForm.ReaderTypeForm;
import com.dao.ReaderTypeDAO;

public class ReaderType extends HttpServlet {
	private ReaderTypeDAO readerTypeDAO = null;

	public ReaderType() {
		this.readerTypeDAO = new ReaderTypeDAO();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("\nreaderType*********************action=" + action);
		if (action == null || "".equals(action)) {
			request.setAttribute("error", "���Ĳ�������");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else if ("readerTypeAdd".equals(action)) {
			readerTypeAdd(request, response);
		} else if ("readerTypeQuery".equals(action)) {
			readerTypeQuery(request, response);
		} else if ("readerTypeModifyQuery".equals(action)) {
			readerTypeModifyQuery(request, response);
		} else if ("readerTypeModify".equals(action)) {
			readerTypeModify(request, response);
		} else if ("readerTypeDel".equals(action)) {
			readerTypeDel(request, response);
		}
	}

	/***********************
	 * ��Ӷ���������Ϣ
	 * 
	 * @throws IOException
	 * @throws ServletException
	 *             *
	 *************************/
	private void readerTypeAdd(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ReaderTypeForm readerTypeForm = new ReaderTypeForm();
		System.out.println("servlet:" + request.getParameter("name"));
		readerTypeForm.setName(request.getParameter("name"));
		readerTypeForm.setNumber(Integer.parseInt(request
				.getParameter("number")));
		int a = readerTypeDAO.insert(readerTypeForm);
		if (a == 0) {
			request.setAttribute("error", "����������Ϣ���ʧ�ܣ�");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else if (a == 2) {
			request.setAttribute("error", "�ö���������Ϣ�Ѿ���ӣ�");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else {
			request.getRequestDispatcher("readerType_ok.jsp?para=1").forward(
					request, response);
		}
	}

	/***********************
	 * ��ѯȫ������������Ϣ
	 * 
	 * @throws IOException
	 * @throws ServletException
	 *             *
	 *************************/
	private void readerTypeQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String str = null;
		request.setAttribute("readerType", readerTypeDAO.query(str));
		request.getRequestDispatcher("readerType.jsp").forward(request,
				response);
	}

	/***********************
	 * ��ѯ�޸Ķ���������Ϣ
	 * 
	 * @throws IOException
	 * @throws ServletException
	 *             *
	 *************************/
	private void readerTypeModifyQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ReaderTypeForm readerTypeForm = new ReaderTypeForm();
		readerTypeForm.setId(Integer.valueOf(request.getParameter("ID")));
		request.setAttribute("readerTypeQueryif", readerTypeDAO
				.queryM(readerTypeForm));
		request.getRequestDispatcher("readerType_Modify.jsp").forward(request,
				response);
	}

	/***********************
	 * �޸Ķ���������Ϣ
	 * 
	 * @throws IOException
	 * @throws ServletException
	 *             *
	 *************************/
	private void readerTypeModify(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ReaderTypeForm readerTypeForm = new ReaderTypeForm();
		readerTypeForm.setId(Integer.parseInt(request.getParameter("id")));
		readerTypeForm.setName(request.getParameter("name"));
		readerTypeForm.setNumber(Integer.parseInt(request
				.getParameter("number")));
		int ret = readerTypeDAO.update(readerTypeForm);
		if (ret == 0) {
			request.setAttribute("error", "�޸Ķ���������Ϣʧ�ܣ�");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else {
			request.getRequestDispatcher("readerType_ok.jsp?para=2").forward(
					request, response);
		}
	}

	/***********************
	 * ɾ������������Ϣ
	 * 
	 * @throws IOException
	 * @throws ServletException
	 *             *
	 *************************/
	private void readerTypeDel(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ReaderTypeForm readerTypeForm = new ReaderTypeForm();
		readerTypeForm.setId(Integer.valueOf(request.getParameter("ID")));
		int ret = readerTypeDAO.delete(readerTypeForm);
		if (ret == 0) {
			request.setAttribute("error", "ɾ������������Ϣʧ�ܣ�");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else {
			request.getRequestDispatcher("readerType_ok.jsp?para=3").forward(
					request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
