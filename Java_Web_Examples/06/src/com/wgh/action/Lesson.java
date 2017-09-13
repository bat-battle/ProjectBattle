package com.wgh.action;

import java.util.List;

import javax.servlet.http.*;

import org.apache.struts.action.*;
import com.wgh.actionForm.LessonForm;
import com.wgh.dao.LessonDAO;

public class Lesson extends Action {
	private LessonDAO lessonDAO = null;

	public Lesson() {
		this.lessonDAO = new LessonDAO();
	}
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		System.out.println("��ȡ�Ĳ�ѯ�ַ�����" + action);
		if (action == null || "".equals(action)) {
			return mapping.findForward("error");
		} else if ("lessonQuery".equals(action)) {
			return lessonQuery(mapping, form, request, response);

		} else if ("lessonAdd".equals(action)) {
			return lessonAdd(mapping, form, request, response);
		} else if ("lessonDel".equals(action)) {
			return lessonDel(mapping, form, request, response);
		}else if("selectLesson".equals(action)){
			return selectLesson(mapping, form, request, response);
		}else if("ready".equals(action)){
			return ready(mapping, form, request, response);
		}
		request.setAttribute("error", "����ʧ�ܣ�");
		return mapping.findForward("error");
	}

	// ��ѯ�γ���Ϣ
	private ActionForward lessonQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("lessonQuery", lessonDAO.query(0));
		return mapping.findForward("lessonQuery");
	}

	// ��ӿγ�
	private ActionForward lessonAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		LessonForm lessonForm = (LessonForm) form;
		int ret = lessonDAO.insert(lessonForm);
		System.out.println("����ֵret��" + ret);
		if (ret == 1) {
			return mapping.findForward("lessonAdd");
		} else if (ret == 2) {
			request.setAttribute("error", "�ÿγ��Ѿ���ӣ�");
			return mapping.findForward("error");
		} else {
			request.setAttribute("error", "��ӿγ�ʧ�ܣ�");
			return mapping.findForward("error");
		}
	}
	// ɾ���γ�
	private ActionForward lessonDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		LessonForm lessonForm = (LessonForm) form;
		int ret = lessonDAO.delete(lessonForm);
		if (ret == 0) {
			request.setAttribute("error", "ɾ���γ�ʧ�ܣ�");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("lessonDel");
		}
	}
	//���߿���ʱѡ��γ�
	private ActionForward selectLesson(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) { 
		HttpSession session = request.getSession();
		String stu=session.getAttribute("student").toString();	//��ȡ׼��֤��
		List list=lessonDAO.query(stu);	//��ѯ����������Ŀ�Ŀγ��б����������Ѿ������Ŀ�Ŀ
		if(list.size()<1){
			return mapping.findForward("noenLesson");
		}else{
			request.setAttribute("lessonList",list);
			return mapping.findForward("selectLesson");
		}
	}
	//׼������
	private ActionForward ready(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) { 
		LessonForm lessonForm = (LessonForm) form;
		System.out.println("�γ�ID��"+lessonForm.getID()+lessonForm.getName());
		HttpSession session = request.getSession();
		session.setAttribute("lessonID",String.valueOf(lessonForm.getID()));	//��ѯѡ��Ŀγ�ID
		return mapping.findForward("ready");
	}	
}