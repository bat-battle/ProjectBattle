package com.wgh.action;

import javax.servlet.http.*;

import org.apache.struts.action.*;

import com.wgh.actionForm.TaoTiForm;
import com.wgh.dao.LessonDAO;
import com.wgh.dao.TaoTiDAO;

public class TaoTi extends Action {
	private TaoTiDAO taoTiDAO = null;
	private LessonDAO lessonDAO=null;

	public TaoTi() {
		this.taoTiDAO = new TaoTiDAO();
		this.lessonDAO=new LessonDAO();
	}
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		System.out.println("��ȡ�Ĳ�ѯ�ַ�����" + action);
		if (action == null || "".equals(action)) {
			return mapping.findForward("error");
		} else if ("taoTiQuery".equals(action)) {
			return taoTiQuery(mapping, form, request, response);
		}else if("taoTiAddQuery".equals(action)){
			return taoTiAddQuery(mapping,form,request,response);			
		} else if ("taoTiAdd".equals(action)) {
			return taoTiAdd(mapping, form, request, response);
		} else if ("taoTiDel".equals(action)) {
			return taoTiDel(mapping, form, request, response);
		}else if("taoTiModifyQuery".equals(action)){
			return taoTiModifyQuery(mapping,form,request,response);
		}else if("taoTiModify".equals(action)){
			return taoTiModify(mapping,form,request,response);
		}
		request.setAttribute("error", "����ʧ�ܣ�");
		return mapping.findForward("error");
	}

	// ��ѯ������Ϣ
	private ActionForward taoTiQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("taoTiQuery", taoTiDAO.query(0));
		return mapping.findForward("taoTiQuery");
	}

	// �������
	private ActionForward taoTiAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TaoTiForm taoTiForm = (TaoTiForm) form;
		int ret = taoTiDAO.insert(taoTiForm);
		System.out.println("����ֵret��" + ret);
		if (ret == 1) {
			return mapping.findForward("taoTiAdd");
		} else if (ret == 2) {
			request.setAttribute("error", "�������Ѿ���ӣ�");
			return mapping.findForward("error");
		} else {
			request.setAttribute("error", "�������ʧ�ܣ�");
			return mapping.findForward("error");
		}
	}
	// �������ʱ��ѯ
	private ActionForward taoTiAddQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("lessonList",lessonDAO.query(0));	//ȫ���γ��б�
		return mapping.findForward("taoTiAddQuery");
	}
	// �޸�����ʱ��ѯ
	private ActionForward taoTiModifyQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TaoTiForm taoTiForm=(TaoTiForm)((taoTiDAO.query(Integer.parseInt(request.getParameter("id")))).get(0));
		request.setAttribute("taoTiModifyQuery", taoTiForm);
		request.setAttribute("lessonList",lessonDAO.query(0));	//ȫ���γ��б�
		return mapping.findForward("taoTiModifyQuery");
	}
	//�޸�����
	private ActionForward taoTiModify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TaoTiForm taoTiForm = (TaoTiForm) form;
		int ret = taoTiDAO.update(taoTiForm);
		if (ret == 0) {
			request.setAttribute("error", "�޸�����ʧ�ܣ�");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("taoTiModify");
		}
	}	
	// ɾ������
	private ActionForward taoTiDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TaoTiForm taoTiForm = (TaoTiForm) form;
		int ret = taoTiDAO.delete(taoTiForm);
		if (ret == 0) {
			request.setAttribute("error", "ɾ������ʧ�ܣ�");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("taoTiDel");
		}
	}
}