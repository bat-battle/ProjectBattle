package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.valueBean.UserSingle;

public class NeedLogonFilter implements Filter {
	private FilterConfig fc;
	
	public void destroy() {
		this.fc=null;
	}

	public void doFilter(ServletRequest sRequest, ServletResponse sResponse,FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)sRequest;
		HttpSession session=request.getSession();
		
		Object logoner=session.getAttribute("logoner");	
		if(logoner!=null&&(logoner instanceof UserSingle))					//�û��Ѿ���¼
			chain.doFilter(sRequest,sResponse);
		else{																//û�е�¼
			String message="";
			if("review".equals(request.getParameter("action"))){			//������е���"��������"��"��������"�Ĳ���
				String noname=request.getParameter("noname");
				if(!"true".equals(noname)){									//��������������
					message="<li>��û�е�¼��</li><a href='javascript:window.history.go(-1)'>�����ء�</a>";
					request.setAttribute("message",message);
					
					String forward=fc.getServletContext().getInitParameter("messagePage"); 
					RequestDispatcher rd=request.getRequestDispatcher(forward);
					rd.forward(sRequest,sResponse);
				}
				else														//������������
					chain.doFilter(sRequest,sResponse);
			}
			else{															//������е��������������磢��Ϊ���ѣ�
				message="<li>��û�е�¼��</li><a href='javascript:window.history.go(-1)'>�����ء�</a>";
				request.setAttribute("message",message);
				
				String forward=fc.getServletContext().getInitParameter("messagePage"); 
				RequestDispatcher rd=request.getRequestDispatcher(forward);
				rd.forward(sRequest,sResponse);
			}
		}
	}

	public void init(FilterConfig fc) throws ServletException {
		this.fc=fc;
	}
}
