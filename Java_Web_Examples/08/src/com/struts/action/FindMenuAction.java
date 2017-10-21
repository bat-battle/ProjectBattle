package com.struts.action;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import com.hiernate.persistence.Menu;
import com.hiernate.util.HibernateUtil;
//���Ҳ˵�action
public class FindMenuAction extends DispatchAction {
   public ActionForward findMenu(ActionMapping arg0, ActionForm arg1, HttpServletRequest arg2, HttpServletResponse arg3) throws Exception {
		List list = HibernateUtil.findMenu(0);         //�������˵���menuidΪ�����󶨲������������˵�
		List menuIdlist = null;
		if(!list.isEmpty() && list.size()>0){          
			for(int i= 0;i<list.size();i++){
				Menu menu =(Menu) list.get(i);
				menuIdlist = HibernateUtil.findMenu((menu.getId()).intValue()); //�����Ӳ˵�
			    arg2.getSession().setAttribute("menuNameid"+i+"", menuIdlist);  //���ֲ˵����ϱ�����session��
			 }
		}
		arg2.getSession().setAttribute("menulist", list);                       //�����˵����ϱ�����session��
		return new ActionForward("/default.jsp");                               //ת����default.jspҳ��
	}
 }
