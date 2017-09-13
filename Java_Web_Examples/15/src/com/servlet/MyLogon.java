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

public class MyLogon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		HttpSession session=request.getSession();
		String goWhere=request.getParameter("goWhere");
		UserSingle callMaster=(UserSingle)session.getAttribute("callBlogMaster");

		Object logoner=session.getAttribute("logoner");		
		if(logoner!=null&&(logoner instanceof UserSingle)){								//�û��Ѿ���¼
			String forward="";			
			if("adminTemp".equals(goWhere)){											//����������ǣ������ͣ�����
				if(((UserSingle)logoner).getId()==callMaster.getId()){					//�����ǰ��¼���û����Ǳ����ʲ��͵Ĳ���
					forward=this.getServletContext().getInitParameter("adminTemp");
				}
				else{																	//�����ǰ��¼���û����Ǳ����ʲ��͵Ĳ���
					message="<li>��û��Ȩ�޹���ò��ͣ�</li><a href='javascript:window.history.go(-1)'>�����ء�</a>";
					request.setAttribute("message",message);			
					forward=this.getServletContext().getInitParameter("messagePage");	
				}
			}
			else{																		//����������ǣ��ҵĲ��ͣ�����			
				forward="/my/goBlog?master="+((UserSingle)logoner).getId();
			}			
			RequestDispatcher rd=request.getRequestDispatcher(forward);
			rd.forward(request,response);	
		}
		else{																			//�û�û���Ѿ���¼
	
			String forward="";
			String name=request.getParameter("userName");
			String pswd=request.getParameter("userPswd");

			message=validateLogon(name,pswd);											//���б���֤			
			if(message.equals("")){														//����֤�ɹ�
				try {
					UserDao userDao=new UserDao();
					logoner=userDao.getLogoner(new Object[]{name,pswd});
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if(logoner==null){														//��¼ʧ��
					message="<li>����ġ�<b>�û���</b ��<b>����</b>������ȷ��";
					request.setAttribute("message",message);
					forward=getInitParameter("myLogonPage");
				}
				else{																	//��¼�ɹ�
					if("adminTemp".equals(goWhere)){											//����������ǣ������ͣ�����
						if(((UserSingle)logoner).getId()==callMaster.getId()){					//�����ǰ��¼���û����Ǳ����ʲ��͵Ĳ���
							forward=this.getServletContext().getInitParameter("adminTemp");
							session.setAttribute("logoner",logoner);
						}
						else{																	//�����ǰ��¼���û����Ǳ����ʲ��͵Ĳ���
							message="<li>��û��Ȩ�޵�¼���˲��ͣ�</li><a href='javascript:window.history.go(-1)'>�����ء�</a>";
							request.setAttribute("message",message);			
							forward=this.getServletContext().getInitParameter("messagePage");	
						}
					}
					else{																		//����������ǣ��ҵĲ��ͣ�����			
						forward="/my/goBlog?master="+((UserSingle)logoner).getId();
						session.setAttribute("logoner",logoner);
					}
				}
			}
			else{																				//����֤ʧ��
				request.setAttribute("message",message);
				forward=getInitParameter("myLogonPage");
			}
			
			RequestDispatcher rd=request.getRequestDispatcher(forward);
			rd.forward(request,response);
		}		
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
