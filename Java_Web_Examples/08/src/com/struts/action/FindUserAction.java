package com.struts.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.hiernate.persistence.User;
import com.hiernate.util.HibernateUtil;
import com.struts.form.UserForm;
//�����û�action�����õ���DispatchAction���Լ���action������
public class FindUserAction extends DispatchAction {//����FindUserAction��̳�DispatchAction��
 public ActionForward finUser(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			                     HttpServletResponse rsponse) throws Exception {
		UserForm uf = (UserForm)form;                      //���UserForm����
	    String strUserName =request.getParameter("UserName");
	    String strPwd = request.getParameter("PWD");
      	List list = HibernateUtil.findUser(strUserName,strPwd);
		request.getSession().setAttribute("list", list);
		User user = new User();
		if(list!=null && !list.isEmpty()){                 	//�ж�list�Ƿ�Ϊ��
			for(int i=0;i<list.size();i++){					//ѭ����������
				user =(User) list.get(i);                  	//list.get()���������б���ָ��λ��Ԫ��
				String strUsername = user.getUserName();	//���User������û�����Ϣ
				String strUserPurview = user.getPurview();	//���User�����Ȩ����Ϣ
				String strUserbranch = user.getBranch();    //���User����Ĳ�����Ϣ
				uf.setUserName(strUsername);				
				uf.setUserPurview(strUserPurview);
				uf.setUserbranch(strUserbranch);
				request.getSession().setAttribute("uform", uf);   //��uf������session��
				request.getSession().setAttribute("username",strUsername);
				
			}
			return new ActionForward("/findMenuAction.do?method=findMenu"); //����û�������û��������붼��ȷ�Ļ�ת����findMenuAction
		}
		else{
			return new ActionForward("/unsuccess.jsp");            //���û������������������ת����unsuccess.jspҳ��
		}
		}
}
