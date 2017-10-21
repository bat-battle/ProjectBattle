package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.void;
import com.actionForm.ReaderTypeForm;
import org.apache.struts.action.Action;
import com.dao.ReaderTypeDAO;

public class ReaderType extends Action {
    private ReaderTypeDAO readerTypeDAO = null;
    public ReaderType() {
        this.readerTypeDAO = new ReaderTypeDAO();
    }

    public void execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        String action =request.getParameter("action");
        System.out.println("\nreaderType*********************action="+action);
        if(action==null||"".equals(action)){
            request.setAttribute("error","���Ĳ�������");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }else if("readerTypeAdd".equals(action)){
            return readerTypeAdd(request,response);
        }else if("readerTypeQuery".equals(action)){
            return readerTypeQuery(request,response);
        }else if("readerTypeModifyQuery".equals(action)){
            return readerTypeModifyQuery(request,response);
        }else if("readerTypeModify".equals(action)){
            return readerTypeModify(request,response);
        }else if("readerTypeDel".equals(action)){
            return readerTypeDel(request,response);
        }
        request.setAttribute("error","����ʧ�ܣ�");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    /***********************��Ӷ���������Ϣ**************************/
    private void readerTypeAdd(ActionMapping mapping, ActionForm form,
                           HttpServletRequest request,
                           HttpServletResponse response){
           ReaderTypeForm readerTypeForm = (ReaderTypeForm) form;
           System.out.println("servlet:"+request.getParameter("name"));
           readerTypeForm.setName(readerTypeForm.getName());
           int a=readerTypeDAO.insert(readerTypeForm);
           if(a==0){
               request.setAttribute("error","����������Ϣ���ʧ�ܣ�");
               request.getRequestDispatcher("error.jsp").forward(request, response);
         }else if(a==2){
             request.setAttribute("error","�ö���������Ϣ�Ѿ���ӣ�");
             request.getRequestDispatcher("error.jsp").forward(request, response);
         }else{
             return mapping.findForward("readerTypeAdd");
        }
       }
       /***********************��ѯȫ������������Ϣ**************************/
       private void readerTypeQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
       String str=null;
       request.setAttribute("readerType",readerTypeDAO.query(str));
       return mapping.findForward("readerTypeQuery");
       }
        /***********************��ѯ�޸Ķ���������Ϣ**************************/
        private void readerTypeModifyQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            ReaderTypeForm readerTypeForm=(ReaderTypeForm)form;
            readerTypeForm.setId(Integer.valueOf(request.getParameter("ID")));
            request.setAttribute("readerTypeQueryif",readerTypeDAO.queryM(readerTypeForm));
            return mapping.findForward("readerTypeQueryModify");
        }
        /***********************�޸Ķ���������Ϣ**************************/
        private void readerTypeModify(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            ReaderTypeForm readerTypeForm=(ReaderTypeForm)form;
            readerTypeForm.setName(readerTypeForm.getName());
            readerTypeForm.setNumber(readerTypeForm.getNumber());
            int ret=readerTypeDAO.update(readerTypeForm);
            if(ret==0){
                request.setAttribute("error","�޸Ķ���������Ϣʧ�ܣ�");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }else{
                return mapping.findForward("readerTypeModify");
            }
        }
        /***********************ɾ������������Ϣ**************************/
        private void readerTypeDel(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            ReaderTypeForm readerTypeForm=(ReaderTypeForm)form;
            readerTypeForm.setId(Integer.valueOf(request.getParameter("ID")));
            int ret=readerTypeDAO.delete(readerTypeForm);
            if(ret==0){
                request.setAttribute("error","ɾ������������Ϣʧ�ܣ�");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }else{
                return mapping.findForward("readerTypeDel");
            }
        }
}
