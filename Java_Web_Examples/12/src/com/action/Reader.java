package com.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.actionForm.ReaderForm;
import com.dao.ReaderDAO;

import java.io.IOException;
import java.util.Date;

public class Reader extends HttpServlet {
	private ReaderDAO readerDAO = null;

	public Reader() {
		this.readerDAO = new ReaderDAO();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("\nreader*********************action=" + action);
		if (action == null || "".equals(action)) {
			request.setAttribute("error", "���Ĳ�������");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else if ("readerAdd".equals(action)) {
			readerAdd(request, response);
		} else if ("readerQuery".equals(action)) {
			readerQuery(request, response);
		} else if ("readerModifyQuery".equals(action)) {
			readerModifyQuery(request, response);
		} else if ("readerModify".equals(action)) {
			readerModify(request, response);
		} else if ("readerDel".equals(action)) {
			readerDel(request, response);
		} else if ("readerDetail".equals(action)) {
			readerDetail(request, response);
		}
	}

	/*********************** ��Ӷ�����Ϣ **************************/
	private void readerAdd(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ReaderForm readerForm = new ReaderForm();
		readerForm.setName(request.getParameter("name"));
		readerForm.setSex(request.getParameter("sex"));
		readerForm.setBarcode(request.getParameter("barcode"));
		readerForm.setVocation(request.getParameter("vocation"));
		readerForm.setBirthday(request.getParameter("birthday"));
		readerForm.setPaperType(request.getParameter("paperType"));
		readerForm.setPaperNO(request.getParameter("paperNO"));
		readerForm.setTel(request.getParameter("tel"));
		readerForm.setEmail(request.getParameter("email"));
		// ��ȡϵͳ����
		Date date1 = new Date();
		java.sql.Date date = new java.sql.Date(date1.getTime());
		readerForm.setCreateDate(date.toString());
		readerForm.setOperator(request.getParameter("operator"));
		readerForm.setRemark(request.getParameter("remark"));
		readerForm.setTypeid(Integer.parseInt(request.getParameter("typeid")));
		int a = readerDAO.insert(readerForm);
		if (a == 0) {
			request.setAttribute("error", "������Ϣ���ʧ�ܣ�");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else if (a == 2) {
			request.setAttribute("error", "�ö�����Ϣ�Ѿ���ӣ�");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else {
			request.getRequestDispatcher("reader_ok.jsp?para=1").forward(
					request, response);
		}
	}

	/*********************** ��ѯȫ��������Ϣ **************************/
	private void readerQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String str = null;
		request.setAttribute("reader", readerDAO.query(str));
		request.getRequestDispatcher("reader.jsp").forward(request, response);
	}

	/*********************** ��ѯ�޸Ķ�����Ϣ **************************/
	private void readerModifyQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ReaderForm readerForm = new ReaderForm();
		System.out.println("��ѯ�޸Ķ�����Ϣ��" + request.getParameter("ID"));
		readerForm.setId(Integer.valueOf(request.getParameter("ID")));
		request.setAttribute("readerQueryif", readerDAO.queryM(readerForm));
		request.getRequestDispatcher("reader_Modify.jsp").forward(request,
				response);
	}

	/*********************** ��ѯ������ϸ��Ϣ **************************/
	private void readerDetail(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ReaderForm readerForm = new ReaderForm();
		readerForm.setId(Integer.valueOf(request.getParameter("ID")));
		request.setAttribute("readerDetail", readerDAO.queryM(readerForm));
		request.getRequestDispatcher("reader_detail.jsp").forward(request,
				response);
	}

	/*********************** �޸Ķ�����Ϣ **************************/
	private void readerModify(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ReaderForm readerForm = new ReaderForm();
		readerForm.setId(Integer.parseInt(request.getParameter("id")));
		readerForm.setName(request.getParameter("name"));
		readerForm.setSex(request.getParameter("sex"));
		readerForm.setBarcode(request.getParameter("barcode"));
		readerForm.setVocation(request.getParameter("vocation"));
		readerForm.setBirthday(request.getParameter("birthday"));
		readerForm.setPaperType(request.getParameter("paperType"));
		readerForm.setPaperNO(request.getParameter("paperNO"));
		readerForm.setTel(request.getParameter("tel"));
		readerForm.setEmail(request.getParameter("email"));
		readerForm.setOperator(request.getParameter("operator"));
		readerForm.setRemark(request.getParameter("remark"));
		readerForm.setTypeid(Integer.parseInt(request.getParameter("typeid")));
		int ret = readerDAO.update(readerForm);
		if (ret == 0) {
			request.setAttribute("error", "�޸Ķ�����Ϣʧ�ܣ�");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else {
			request.getRequestDispatcher("reader_ok.jsp?para=2").forward(
					request, response);
		}
	}

	/*********************** ɾ��������Ϣ **************************/
	private void readerDel(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ReaderForm readerForm = new ReaderForm();
		readerForm.setId(Integer.valueOf(request.getParameter("ID")));
		int ret = readerDAO.delete(readerForm);
		if (ret == 0) {
			request.setAttribute("error", "ɾ��������Ϣʧ�ܣ�");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else {
			request.getRequestDispatcher("reader_ok.jsp?para=3").forward(
					request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
