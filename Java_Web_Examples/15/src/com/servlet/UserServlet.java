package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PhotoDao;
import com.dao.UserDao;
import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.toolsBean.Change;
import com.valueBean.UserSingle;

public class UserServlet extends HttpServlet {
	private String userIco="myNull.jpg";
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String action=request.getParameter("action");
		if("upIco".equals(action))
			doUpLoadIco(request,response);
		else if("userReg".equals(action))
			doUserReg(request,response);
		else
			doOther(request,response);
	}
	
	protected void doUserReg(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String forward="";
		String message="";
		
		UserSingle single=(UserSingle)request.getAttribute("regUser");
		message=validateReg(single);
		
		if(!message.equals(""))											//����֤ʧ��
			forward=getInitParameter("input");
		else{															//����֤�ɹ�
			try {
				UserDao userDao=new UserDao();

				String ctTime=Change.dateTimeChange(new Date());
				single.setUserCTTime(ctTime);
				single.setUserIco(userIco);
				
				userDao.insert(single);
				forward="/goIndex";
			} catch (SQLException e) {				
				e.printStackTrace();
				message="<li>ע�Ჩ��ʧ�ܣ�</li>";
				forward=getInitParameter("input");
			}
		}
		userIco+="1";
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	public void doUpLoadIco(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String message="";
		try {
			SmartUpload myup=new SmartUpload();
			myup.initialize(this, request, response);
			
			myup.setAllowedFilesList("jpg,gif");						//���������ϴ����ļ�����
			myup.upload();
			File upfile=myup.getFiles().getFile(0);							//��ȡ�ϴ����ļ�����Ϊֻ�ϴ���һ���ļ�������ֻ��һ��Ԫ��
			if(!upfile.isMissing()){										//����û�ѡ����Ҫ�ϴ���ͼƬ
				message=validateUpLoad(upfile);									//��֤�ϴ����ļ��Ĵ�С
				if(message.equals("")){											//ͨ����֤
					Date now=new Date();
					String src="userIco_"+Change.getSerial(now)+"."+upfile.getFileExt();
					userIco=src;
					upfile.saveAs("images/ico/"+src,File.SAVEAS_VIRTUAL);		//�����ļ���������
					message="<li>ͷ���ϴ��ɹ���</li>";
				}					
			}
			else
				message="<li>��ѡ��ͼƬ��</li>";
		}catch(SecurityException e){
			e.printStackTrace();
			message="<li>�ϴ���ͼƬֻ����Ϊ jpg��gif ��ʽ��</li>";
		} catch (Exception e1) {
			e1.printStackTrace();
			message="<li>ͷ���ϴ�ʧ�ܣ������Բ������ϴ�����ʹ��Ĭ��ͷ��</li>";
			e1.printStackTrace();
		}
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(getInitParameter("input"));
		rd.forward(request,response);		
	}
	private String validateReg(UserSingle single){
		String message="";
		String userName=single.getUserName();
		String userPswd=single.getUserPswd();
		String aginPswd=single.getAginPswd();
		String blogName=single.getUserBlogName();
		String userMotto=single.getUserMotto();		
		String userOicq=single.getUserOicq();
		String userEmail=single.getUserEmail();
		
		boolean mark=true;
		if(userName==null||userName.equals("")){
			message="<li>������ <b>����</b>��</li>";
			mark=false;
		}
		if(userPswd==null||userPswd.equals("")){
			message+="<li>������ <b>����</b>��</li>";
			mark=false;
		}
		if(aginPswd==null||aginPswd.equals("")){
			message+="<li>������ <b>ȷ������</b>��</li>";
			mark=false;
		}
		if(blogName==null||blogName.equals("")){
			message+="<li>������ <b>��������</b>��</li>";
			mark=false;
		}
		if(userMotto==null||userMotto.equals("")){
			message+="<li>������ <b>����ǩ��</b>��</li>";
			mark=false;
		}
		
		if(mark){													//�����ж���������������Ƿ�һ��
			if(!userPswd.equals(aginPswd)){
				message="<li>������������벻һ�£�</li>";
				mark=false;
			}
		}
		if(mark){													//�����жϣ���������OICQ��E-mail�����ж�������Ƿ�Ϊ���ָ�ʽ
			if(userOicq!=null&&!userOicq.equals("")){
				try{
					Long.parseLong(userOicq);
				}catch(NumberFormatException e){
					message="<li>����� <b>OICQ</b> �������֣�</li>";
					e.printStackTrace();
				}
			}
			if(userEmail!=null&&!userEmail.equals("")){
				String emailRegex="\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
				if(!userEmail.matches(emailRegex))
					message+="<li>����� <b>E-mail</b> ��ַ������ȷ��</li>";
			}
		}
		return message;
	}
	private String validateUpLoad(File upfile){
		String message="";
		long maxLen=1*1024*1024;						//���������ϴ����ļ�����󳤶�Ϊ��MB
		int len=upfile.getSize();
		if(len==0)
			message="<li>�������ϴ���СΪ0�Ŀ��ļ���</li>";
		else if(len>maxLen)
			message="<li>�ϴ���ͼƬ���ӦΪ1MB��</li>";
		return message;
	}
	protected void doOther(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	}
}
