package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.void;
import com.actionForm.PublishingForm;
import org.apache.struts.action.Action;
import com.dao.PublishingDAO;

public class Publishing extends Action {
    private PublishingDAO pubDAO = null;
    public Publishing() {
        this.pubDAO = new PublishingDAO();
    }
    public void execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        PublishingForm publishingForm = (PublishingForm) form;
        String action =request.getParameter("action");
        System.out.println("\npublishing**************action="+action);
        if(action==null||"".equals(action)){
            request.setAttribute("error","���Ĳ�������");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }else if("pubQuery".equals(action)){
            return pubQuery(request,response);
        }
        request.setAttribute("error","����ʧ�ܣ�");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    /***********************��ѯȫ����������Ϣ**************************/
    private void pubQuery(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
    String str=null;
    request.setAttribute("book",pubDAO.query(str));
    return mapping.findForward("pubQuery");
       }
}
