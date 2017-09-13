package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.DamageForm;
import org.apache.struts.action.Action;
import com.dao.OutStorageDAO;
import com.dao.QueryDAO;

public class Damage extends Action {
    private OutStorageDAO outStorageDAO = null;
    public Damage() {
        outStorageDAO = new OutStorageDAO();
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action.equals("") || action == null) {
            request.setAttribute("error", "���Ĳ�������");
            return mapping.findForward("error");
        } else if (action.equals("damageaddquery")) {
            return damageadd_request(mapping, form, request, response);
        } else if (action.equals("damageadd")) {
            return damageadd(mapping, form, request, response);
        }else{
            request.setAttribute("error", "���Ĳ�������");
            return mapping.findForward("error");
        }
    }
//��ѯ����������������Ϣ
    public ActionForward damageadd_request(ActionMapping mapping,
                                           ActionForm form,
                                           HttpServletRequest request,
                                           HttpServletResponse response) {
        int goodsid = 0;
        if (request.getParameter("id") != null) {
            goodsid = Integer.parseInt(request.getParameter("id"));
        }
        request.setAttribute("id", goodsid);
        request.setAttribute("getuse", outStorageDAO.getuseGoods_query()); //��ȡ����������������Ϣ
        return mapping.findForward("selGetuseGoods");
    }
    //��Ӳ��ű�����Ϣ
    public ActionForward damageadd(ActionMapping mapping,
                                           ActionForm form,
                                           HttpServletRequest request,
                                           HttpServletResponse response) {
        DamageForm getUseForm = (DamageForm) form;
        int rtn = outStorageDAO.damageAdd(getUseForm);
        if (rtn == 1) {
            return mapping.findForward("damageAddok");
        } else {
            request.setAttribute("error", "���ű�����Ϣ���ʧ�ܣ�");
            return mapping.findForward("error");
        }
    }
}
