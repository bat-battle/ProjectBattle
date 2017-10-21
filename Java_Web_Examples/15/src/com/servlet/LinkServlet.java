package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.LinkDao;
import com.toolsBean.Change;
import com.valueBean.UserSingle;

public class LinkServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String action=request.getParameter("action");
		if("adminList".equals(action))
			doAdminList(request,response);
		else if("insert".equals(action))
			doInsert(request,response);
		else if("delete".equals(action))
			doDelete(request,response);
		else
			doOther(request,response);
	}
	
	protected void doAdminList(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("adminListPage"));
		HttpSession session=request.getSession();
		UserSingle logoner=(UserSingle)session.getAttribute("logoner");

		int whoid=logoner.getId();
		List linklist=null;
		LinkDao linkDao=new LinkDao();		
		try {
			linklist=linkDao.getListLink(whoid);
		} catch (SQLException e) {
			System.out.println("��̨����ȡ��������ʧ�ܣ�");
			e.printStackTrace();			
		}
		request.setAttribute("linklist",linklist);

		String forward=getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doInsert(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("insertPage"));
		String message="";
		String forward=getServletContext().getInitParameter("adminTemp");
		HttpSession session=request.getSession();
		String type=request.getParameter("type");

		if("add".equals(type)){										//ͨ����������ӡ��ύ��ť����������
			message=validateLink(request);							//���б���֤
			if("".equals(message)){									//����֤�ɹ�
				int whoId=((UserSingle)session.getAttribute("logoner")).getId();
				String title=request.getParameter("title");
				String src=request.getParameter("src");
				String time=Change.dateTimeChange(new Date());
				Object[] params={whoId,title,src,time};

				int i=0;
				try {
					LinkDao linkDao=new LinkDao();
					i=linkDao.insert(params);
				} catch (SQLException e) {
					i=-1;
					e.printStackTrace();
				}
				if(i<=0)
					message="<li>�����������ʧ�ܣ�</li>";
				else{
					message="<li>����������ӳɹ���</li>";
					forward="/my/admin/link?action=adminList";
				}
			}
		}
		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		String forward="";
		int id=Change.strToInt(request.getParameter("id"));
		
		int i=0;
		try {
			LinkDao linkDao=new LinkDao();
			i=linkDao.delete(id);
		} catch (SQLException e) {
			i=-1;
			e.printStackTrace();
		}
		if(i<=0){
			message="<li>ɾ��ʧ�ܣ�<a href='javascript:window.history.go(-1)'>�����ء�</a></li>";
			forward=getServletContext().getInitParameter("messagePage");
		}
		else{
			message="<li>ɾ���ɹ���</li>";
			forward="/my/admin/link?action=adminList";
		}
		request.setAttribute("message",message);

		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doOther(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	}
	private String validateLink(HttpServletRequest request){
		String message="";
		String title=request.getParameter("title");
		String src=request.getParameter("src");
		if(title==null||title.equals(""))
			message="<li>������ <b>�������ӱ��⣡</b>��";
		if(src==null||src.equals(""))
			message+="<li>������ <b>���ӵ�ַ</b>��";
		return message;
	}
}
