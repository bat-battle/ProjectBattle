package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.toolsBean.Change;
import com.valueBean.UserSingle;

public class UserLogon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		String forward=getInitParameter("visitorLogonPage");
		HttpSession session=request.getSession();
		
		Object logoner=session.getAttribute("logoner");	
		if(logoner!=null&&(logoner instanceof UserSingle))					//�û��Ѿ���¼
			message="<li>���Ѿ���¼��</li>";
		else{																//�û�û�е�¼
			String name=Change.toChinese(request.getParameter("userName"));
			String pswd=Change.toChinese(request.getParameter("userPswd"));

			message=validateLogon(name,pswd);								//���б���֤
			if(message.equals("")){											//����֤�ɹ�
				try {
					UserDao userDao=new UserDao();
					logoner=userDao.getLogoner(new Object[]{name,pswd});
					if(logoner==null)
						message="<li>����ġ�<b>�û���</b> ��<b>����</b>������ȷ��</li>";
					else{
						message="<li>��¼�ɹ���</li>";
						session.setAttribute("logoner",logoner);
					}
				} catch (SQLException e) {
					message="<li>��¼ʧ�ܣ�</li>";
					e.printStackTrace();
				}
			}			
		}		
		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);		
	}
	private String validateLogon(String name,String pswd){
		String message="";
		if(name==null||name.equals(""))
			message="<li>�����롡<b>�û�����</b></li>";
		if(pswd==null||pswd.equals(""))
			message+="<li>�����롡<b>��&nbsp;&nbsp;�룡</b></li>";
		return message;
	}
}
