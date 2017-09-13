package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.actionForm.BookTypeForm;
import com.dao.BookTypeDAO;

public class BookType extends HttpServlet {
	private BookTypeDAO bookTypeDAO = null;

	public BookType() {
		this.bookTypeDAO = new BookTypeDAO();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		System.out.println("\nbookType*********************action=" + action);
		if (action == null || "".equals(action)) {
			request.setAttribute("error", "���Ĳ�������");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else if ("bookTypeAdd".equals(action)) {
			bookTypeAdd(request, response);
		} else if ("bookTypeQuery".equals(action)) {
			bookTypeQuery(request, response);
		} else if ("bookTypeModifyQuery".equals(action)) {
			bookTypeModifyQuery(request, response);
		} else if ("bookTypeModify".equals(action)) {
			bookTypeModify(request, response);
		} else if ("bookTypeDel".equals(action)) {
			bookTypeDel(request, response);
		}
	}

	/*********************** ���ͼ��������Ϣ **************************/
	private void bookTypeAdd(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		BookTypeForm bookTypeForm = new BookTypeForm();
		bookTypeForm.setTypeName(request.getParameter("typeName"));
		bookTypeForm.setDays(Integer.parseInt(request.getParameter("days")));
		int a = bookTypeDAO.insert(bookTypeForm);
		if (a == 0) {
			request.setAttribute("error", "ͼ��������Ϣ���ʧ�ܣ�");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else if (a == 2) {
			request.setAttribute("error", "��ͼ��������Ϣ�Ѿ���ӣ�");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else {
			request.getRequestDispatcher("bookType_ok.jsp?para=1").forward(request,
					response);
		}
	}

	/*********************** ��ѯȫ��ͼ��������Ϣ **************************/
	private void bookTypeQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String str = null;
		request.setAttribute("bookType", bookTypeDAO.query(str));
		request.getRequestDispatcher("bookType.jsp")
				.forward(request, response);
	}

	/*********************** ��ѯ�޸�ͼ��������Ϣ **************************/
	private void bookTypeModifyQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		BookTypeForm bookTypeForm = new BookTypeForm();
		bookTypeForm.setId(Integer.valueOf(request.getParameter("ID")));
		request.setAttribute("bookTypeQueryif", bookTypeDAO
				.queryM(bookTypeForm));
		request.getRequestDispatcher("bookType_Modify.jsp").forward(request,
				response);
	}

	/*********************** �޸�ͼ��������Ϣ **************************/
	private void bookTypeModify(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		BookTypeForm bookTypeForm = new BookTypeForm();
		bookTypeForm.setId(Integer.parseInt(request.getParameter("id")));
		bookTypeForm.setTypeName(request.getParameter("typeName"));
		bookTypeForm.setDays(Integer.parseInt(request.getParameter("days")));
		int ret = bookTypeDAO.update(bookTypeForm);
		if (ret == 0) {
			request.setAttribute("error", "�޸�ͼ��������Ϣʧ�ܣ�");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else {
			request.getRequestDispatcher("bookType_ok.jsp?para=2").forward(request,
					response);
		}
	}

	/*********************** ɾ��ͼ��������Ϣ **************************/
	private void bookTypeDel(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		BookTypeForm bookTypeForm = new BookTypeForm();
		bookTypeForm.setId(Integer.valueOf(request.getParameter("ID")));
		int ret = bookTypeDAO.delete(bookTypeForm);
		if (ret == 0) {
			request.setAttribute("error", "ɾ��ͼ��������Ϣʧ�ܣ�");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else {
			request.getRequestDispatcher("bookType_ok.jsp?para=3").forward(request,
					response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
