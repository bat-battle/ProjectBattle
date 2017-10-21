package com.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.actionForm.ReaderForm;
import org.apache.struts.action.*;
import com.dao.ReaderDAO;
import java.util.Date;

public class Reader extends Action {
    private ReaderDAO readerDAO = null;
    public Reader() {
        this.readerDAO = new ReaderDAO();
    }

    public void execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        String action =request.getParameter("action");
        System.out.println("\nreader*********************action="+action);
        if(action==null||"".equals(action)){
            request.setAttribute("error","���Ĳ�������");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }else if("readerAdd".equals(action)){
            return readerAdd(request,response);
        }else if("readerQuery".equals(action)){
            return readerQuery(request,response);
        }else if("readerModifyQuery".equals(action)){
            return readerModifyQuery(request,response);
        }else if("readerModify".equals(action)){
            return readerModify(request,response);
        }else if("readerDel".equals(action)){
            return readerDel(request,response);
        }else if("readerDetail".equals(action)){
            return readerDetail(request,response);
        }
        request.setAttribute("error","����ʧ�ܣ�");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    /***********************��Ӷ�����Ϣ**************************/
    private void readerAdd(ActionMapping mapping, ActionForm form,
                           HttpServletRequest request,
                           HttpServletResponse response){
           ReaderForm readerForm = (ReaderForm) form;
           readerForm.setName(readerForm.getName());
           readerForm.setSex(readerForm.getSex());
           readerForm.setBarcode(readerForm.getBarcode());
           readerForm.setVocation(readerForm.getVocation());
           readerForm.setBirthday(readerForm.getBirthday());
           readerForm.setPaperType(readerForm.getPaperType());
           readerForm.setPaperNO(readerForm.getPaperNO());
           readerForm.setTel(readerForm.getTel());
           readerForm.setEmail(readerForm.getEmail());
           //��ȡϵͳ����
           Date date1=new Date();
           java.sql.Date date=new java.sql.Date(date1.getTime());
           readerForm.setCreateDate(date.toString());
           readerForm.setOperator(readerForm.getOperator());
           readerForm.setRemark(readerForm.getRemark());
           readerForm.setTypeid(readerForm.getTypeid());
           int a=readerDAO.insert(readerForm);
           if(a==0){
               request.setAttribute("error","������Ϣ���ʧ�ܣ�");
               request.getRequestDispatcher("error.jsp").forward(request, response);
         }else if(a==2){
             request.setAttribute("error","�ö�����Ϣ�Ѿ���ӣ�");
             request.getRequestDispatcher("error.jsp").forward(request, response);
         }else{
             return mapping.findForward("readerAdd");
        }
       }
       /***********************��ѯȫ��������Ϣ**************************/
       private void readerQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
       String str=null;
       request.setAttribute("reader",readerDAO.query(str));
       return mapping.findForward("readerQuery");
       }
        /***********************��ѯ�޸Ķ�����Ϣ**************************/
        private void readerModifyQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            ReaderForm readerForm=(ReaderForm)form;
            System.out.println("��ѯ�޸Ķ�����Ϣ��"+request.getParameter("ID"));
            readerForm.setId(Integer.valueOf(request.getParameter("ID")));
            request.setAttribute("readerQueryif",readerDAO.queryM(readerForm));
            return mapping.findForward("readerQueryModify");
        }
        /***********************��ѯ������ϸ��Ϣ**************************/
        private void readerDetail(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            ReaderForm readerForm=(ReaderForm)form;
            readerForm.setId(Integer.valueOf(request.getParameter("ID")));
            request.setAttribute("readerDetail",readerDAO.queryM(readerForm));
            return mapping.findForward("readerDeatil");
        }
        /***********************�޸Ķ�����Ϣ**************************/
        private void readerModify(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            ReaderForm readerForm=(ReaderForm)form;
            readerForm.setName(readerForm.getName());
            readerForm.setSex(readerForm.getSex());
            readerForm.setBarcode(readerForm.getBarcode());
            readerForm.setVocation(readerForm.getVocation());
            readerForm.setBirthday(readerForm.getBirthday());
            readerForm.setPaperType(readerForm.getPaperType());
            readerForm.setPaperNO(readerForm.getPaperNO());
            readerForm.setTel(readerForm.getTel());
            readerForm.setEmail(readerForm.getEmail());
            readerForm.setOperator(readerForm.getOperator());
            readerForm.setRemark(readerForm.getRemark());
            readerForm.setTypeid(readerForm.getTypeid());
            int ret=readerDAO.update(readerForm);
            if(ret==0){
                request.setAttribute("error","�޸Ķ�����Ϣʧ�ܣ�");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }else{
                return mapping.findForward("readerModify");
            }
        }
        /***********************ɾ��������Ϣ**************************/
        private void readerDel(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
            ReaderForm readerForm=(ReaderForm)form;
            readerForm.setId(Integer.valueOf(request.getParameter("ID")));
            int ret=readerDAO.delete(readerForm);
            if(ret==0){
                request.setAttribute("error","ɾ��������Ϣʧ�ܣ�");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }else{
                return mapping.findForward("readerDel");
            }
        }
}
