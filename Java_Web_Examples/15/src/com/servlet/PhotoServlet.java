package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PhotoDao;
import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.toolsBean.Change;
import com.valueBean.PhotoSingle;
import com.valueBean.UserSingle;

public class PhotoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String action=request.getParameter("action");
		if("listShow".equals(action))
			doListShow(request,response);
		else if("singleShow".equals(action))
			doSingleShow(request,response);
		else if("adminList".equals(action))
			doAdminList(request,response);
		else if("adminSingle".equals(action))
			doAdminSingle(request,response);
		else if("insert".equals(action))
			doInsert(request,response);
		else if("delete".equals(action))
			doDelete(request,response);
		else
			doOther(request,response);
	}
	
	protected void doListShow(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("listShowPage"));

		HttpSession session=request.getSession();
		UserSingle callMaster=(UserSingle)session.getAttribute("callBlogMaster");

		int userid=callMaster.getId();
		String showPage=request.getParameter("showPage");
		String goWhich="my/guest/photo?action=listShow";
		
		List photoList=null;
		PhotoDao photoDao=new PhotoDao();		
		try {
			photoList=photoDao.getListPhoto(userid,showPage, goWhich);
		} catch (SQLException e) {
			System.out.println("��ȡͼƬ�б�ʧ�ܣ�");
			e.printStackTrace();			
		}
		request.setAttribute("photolist",photoList);
		request.setAttribute("createPage",photoDao.getPage());
		
		String forward=this.getServletContext().getInitParameter("indexTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}

	protected void doSingleShow(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("singleShowPage"));
		try {
			int id=Change.strToInt(request.getParameter("id"));
			PhotoDao photoDao=new PhotoDao();
			PhotoSingle single=photoDao.getSinglePhoto(id);		// ��ȡͼƬ����ϸ��Ϣ			
			request.setAttribute("photosingle",single);
		} catch (Exception e) {
			System.out.println("��ȡͼƬ��ϸ��Ϣʧ�ܣ�");
			e.printStackTrace();
		}		
		String forward=this.getServletContext().getInitParameter("indexTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doAdminList(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("adminListPage"));
		HttpSession session=request.getSession();
		UserSingle logoner=(UserSingle)session.getAttribute("logoner");

		int whoid=logoner.getId();
		String showPage=request.getParameter("showPage");
		String goWhich="my/admin/photo?action=adminList";
		
		List photoList=null;
		PhotoDao photoDao=new PhotoDao();		
		try {
			photoList=photoDao.getListPhoto(whoid,showPage, goWhich);
		} catch (SQLException e) {
			System.out.println("��̨����ȡͼƬ�б�ʧ�ܣ�");
			e.printStackTrace();			
		}
		request.setAttribute("photolist",photoList);
		request.setAttribute("createPage",photoDao.getPage());
		
		String forward=this.getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doAdminSingle(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("adminSinglePage"));
		try {
			int id=Change.strToInt(request.getParameter("id"));
			PhotoDao photoDao=new PhotoDao();
			PhotoSingle single=photoDao.getSinglePhoto(id);		// ��ȡͼƬ����ϸ��Ϣ			
			request.setAttribute("photosingle",single);
		} catch (Exception e) {
			System.out.println("��̨����ȡͼƬ��ϸ��Ϣʧ�ܣ�");
			e.printStackTrace();
		}		
		String forward=this.getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doInsert(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("upLoadPage"));
		
		String message="";
		HttpSession session=request.getSession();
		int whoid=((UserSingle)session.getAttribute("logoner")).getId();
		String type=request.getParameter("type");
		
		if("upload".equals(type)){												//�������ϴ�ͼƬ���ύ��ť����������
			try {
				SmartUpload myup=new SmartUpload();
				myup.initialize(this, request, response);
				myup.setAllowedFilesList("jpg,jpeg,gif");						//���������ϴ����ļ�����
				myup.upload();													//�ϴ��ļ�
				File upfile=myup.getFiles().getFile(0);							//��ȡ�ϴ����ļ�����Ϊֻ�ϴ���һ���ļ�������ֻ��һ��Ԫ��
				
				message=validateUpLoad(upfile);									//��֤�ϴ����ļ��Ĵ�С
				if(message.equals("")){											//ͨ����֤
					Date now=new Date();										//��ȡ��ǰʱ��
					String src=Change.getSerial(now)+"."+upfile.getFileExt();
					String info=myup.getRequest().getParameter("info");
					if(info==null||info.equals(""))
						info="�ҵ�ͼƬ";
					String time=Change.dateTimeChange(now);
					
					Object[] params={whoid,src,info,time};
					PhotoDao photoDao=new PhotoDao();
					int i=photoDao.upLoad(params);
					if(i<=0)
						message="<li>ͼƬ�ϴ�ʧ�ܣ�</li>";
					else{
						upfile.saveAs("images/photo/"+src,File.SAVEAS_VIRTUAL);					//�����ļ���������
						message="<li>�ļ��ϴ��ɹ���</li>";
					}					
				}				
			}catch(SecurityException e1){										//����Υ���������ϴ����ļ����ͺ��׳����쳣
				message="<li>ֻ�����ϴ� <b>jpg��jpeg��gif</b> ��ʽͼƬ��</li>";
				e1.printStackTrace();				
			}catch (SmartUploadException e2) {
				message="<li>ͼƬ�ϴ�ʧ�ܣ�</li>";		
				e2.printStackTrace();
			}catch(Exception e3){
				message="<li>ͼƬ�ϴ�ʧ�ܣ�</li>";	
				e3.printStackTrace();
			}			
		}
		else																	//�������ϴ�ͼƬ�������Ӵ���������
			message="<li>��ѡ��Ҫ�ϴ���ͼƬ��</li>";
		
		request.setAttribute("message",message);		
		String forward=getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);		
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		String forward="";
		int id=Change.strToInt(request.getParameter("id"));

		PhotoDao photoDao=new PhotoDao();
		try{
			PhotoSingle single=new PhotoSingle();
			single=photoDao.getSinglePhoto(id);
			
			String photoName=single.getPhotoSrc();
			String photoPath=getServletContext().getRealPath("\\")+"images\\photo\\"+photoName;
			java.io.File delPhoto=new java.io.File(photoPath);
			boolean delete=delPhoto.delete();
			if(delete){															//�Ӵ�����ɾ��ͼƬ�ɹ�
				int i=photoDao.delete(id);
				if(i<=0){
					message="<li>ͼƬ�Ѿ��Ӵ�����ɾ�������ڴ����ݱ���ɾ��ͼƬ��Ϣʱʧ�ܣ�</li><br><a href='javascript:window.history.go(-1)'>�����ء�</a>";
					forward=getServletContext().getInitParameter("messagePage");
				}
				else{
					message="<li>ɾ���ɹ���</li>";
					forward="/my/admin/photo?action=adminList";
				}				
			}
			else{
				message="<li>�޷��Ӵ�����ɾ��ͼƬ��</li><a href='javascript:window.history.go(-1)'>�����ء�</a>";
				forward=getServletContext().getInitParameter("messagePage");
			}
		}catch(Exception e){
			e.printStackTrace();
			forward=getServletContext().getInitParameter("messagePage");
		}
		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);	
	}
	protected void doOther(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	}
	private String validateUpLoad(File upfile){
		String message="";
		long maxLen=2*1024*1024;						//���������ϴ����ļ�����󳤶�Ϊ��MB
		if(upfile.isMissing()){							//û��ѡ���ļ�
			message+="<li>��ѡ��Ҫ�ϴ���ͼƬ��</li>";
		}
		else{
			int len=upfile.getSize();
			if(len==0)
				message="<li>�������ϴ���СΪ0�Ŀ��ļ���</li>";
			else if(len>maxLen)
				message="<li>�ϴ���ͼƬ���ӦΪ��MB��</li>";
		}
		return message;
	}
}
