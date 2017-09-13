package com.wgh.action;

import javax.servlet.http.*;

import org.apache.struts.action.*;

import com.wgh.actionForm.QuestionsForm;
import com.wgh.actionForm.TaoTiForm;
import com.wgh.core.ChStr;
import com.wgh.dao.LessonDAO;
import com.wgh.dao.QuestionsDAO;
import com.wgh.dao.TaoTiDAO;

public class Questions extends Action {
	private QuestionsDAO questionsDAO = null;
	private LessonDAO lessonDAO=null;
	private TaoTiDAO taoTiDAO=null;

	public Questions() {
		this.questionsDAO = new QuestionsDAO();
		this.lessonDAO=new LessonDAO();
		this.taoTiDAO=new TaoTiDAO();
	}
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		System.out.println("��ȡ�Ĳ�ѯ�ַ�����" + action);
		if ("questionsQuery".equals(action)) {
			return questionsQuery(mapping, form, request, response);
		}else if("questionsAddQuery".equals(action)){
			return questionsAddQuery(mapping,form,request,response);			
		} else if ("questionsAdd".equals(action)) {
			return questionsAdd(mapping, form, request, response);
		} else if ("questionsDel".equals(action)) {
			return questionsDel(mapping, form, request, response);
		}else if("questionsModifyQuery".equals(action)){
			return questionsModifyQuery(mapping,form,request,response);
		}else if("questionsModify".equals(action)){
			return questionsModify(mapping,form,request,response);
		}else if("queryTaoTi".equals(action)){
			return queryTaoTi(mapping,form,request,response);
		}else{
			request.setAttribute("error", "����ʧ�ܣ�");
			return mapping.findForward("error");
		}
	}

	// ��ѯ������Ŀ��Ϣ
	private ActionForward questionsQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("questionsQuery", questionsDAO.query(0));
		return mapping.findForward("questionsQuery");
	}

	// ��ӿ�����Ŀ
	private ActionForward questionsAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QuestionsForm questionsForm = (QuestionsForm) form;
		int ret = questionsDAO.insert(questionsForm);
		if (ret == 1) {
			return mapping.findForward("questionsAdd");
		} else if (ret == 2) {
			request.setAttribute("error", "�ÿ�����Ŀ�Ѿ���ӣ�");
			return mapping.findForward("error");
		} else {
			request.setAttribute("error", "��ӿ�����Ŀʧ�ܣ�");
			return mapping.findForward("error");
		}
	}
	// ��ӿ�����Ŀʱ��ѯ
	private ActionForward questionsAddQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("lessonList",lessonDAO.query(-1));	//ȫ����������Ŀγ��б�
		return mapping.findForward("questionsAddQuery");
	}
	
	//���ݿγ̲�ѯ����ajax
	private ActionForward queryTaoTi(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("taoTiList",taoTiDAO.queryTaoTi(Integer.parseInt(request.getParameter("id"))));	//��ѯָ���γ̵������б�
		return mapping.findForward("queryTaoTi");
	}	
	// �޸Ŀ�����Ŀʱ�Ĳ�ѯ
	private ActionForward questionsModifyQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QuestionsForm questionsForm=(QuestionsForm)((questionsDAO.query(Integer.parseInt(request.getParameter("id")))).get(0));
		request.setAttribute("questionsModifyQuery", questionsForm);
		return mapping.findForward("questionsModifyQuery");
	}
	//�޸Ŀ�����Ŀ
	private ActionForward questionsModify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QuestionsForm questionsForm = (QuestionsForm) form;
		int ret = questionsDAO.update(questionsForm);
		if (ret == 0) {
			request.setAttribute("error", "�޸Ŀ�����Ŀʧ�ܣ�");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("questionsModify");
		}
	}	
	// ɾ��������Ŀ
	private ActionForward questionsDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QuestionsForm questionsForm = (QuestionsForm) form;
		int ret = questionsDAO.delete(questionsForm);
		if (ret == 0) {
			request.setAttribute("error", "ɾ��������Ŀʧ�ܣ�");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("questionsDel");
		}
	}
}