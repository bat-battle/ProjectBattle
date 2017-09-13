package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MediaDao;
import com.dao.MediaRevDao;
import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.toolsBean.Change;
import com.valueBean.MediaSingle;
import com.valueBean.UserSingle;

public class MediaServlet extends HttpServlet {
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
		String goWhich="my/guest/media?action=listShow";
		
		List mediaList=null;
		MediaDao mediaDao=new MediaDao();		
		try {
			mediaList=mediaDao.getListMedia(userid,showPage, goWhich);
		} catch (SQLException e) {
			System.out.println("��ȡ��Ƶ�б�ʧ�ܣ�");
			e.printStackTrace();			
		}
		request.setAttribute("medialist",mediaList);
		request.setAttribute("createPage",mediaDao.getPage());
		
		String forward=this.getServletContext().getInitParameter("indexTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doSingleShow(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("playPage"));
		try {
			MediaDao mediaDao=new MediaDao();
			int id=Change.strToInt(request.getParameter("id"));

			mediaDao.setLookCount(id);									// ����Ƶ�Ĺۿ������ӣ�
			MediaSingle single=mediaDao.getSingleMedia(id);				// ��ȡ��Ƶ����ϸ��Ϣ			
			
			/* ��ȡ����Ƶ�����µ�ǰn������ */
			MediaRevDao mediaRDao=new MediaRevDao();
			List mediaRlist=mediaRDao.getNewReviewList(id);
			
			/* ����Ҫ���ŵ���Ƶ����Ƶ������ */
			request.setAttribute("mediasingle",single);
			request.setAttribute("mediaRlist",mediaRlist);
		} catch (Exception e) {
			System.out.println("��ȡ��Ƶ��ϸ��Ϣʧ�ܣ�");
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
		String goWhich="my/admin/media?action=adminList";
		
		List mediaList=null;
		MediaDao mediaoDao=new MediaDao();		
		try {
			mediaList=mediaoDao.getListMedia(whoid,showPage, goWhich);
		} catch (SQLException e) {
			System.out.println("��̨����ȡӰ���б�ʧ�ܣ�");
			e.printStackTrace();			
		}
		request.setAttribute("medialist",mediaList);
		request.setAttribute("createPage",mediaoDao.getPage());
		
		String forward=this.getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doAdminSingle(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("adminPlayPage"));
		try {
			int id=Change.strToInt(request.getParameter("id"));
			MediaDao mediaDao=new MediaDao();
			MediaSingle single=mediaDao.getSingleMedia(id);				// ��ȡӰ������ϸ��Ϣ			
			
			/* ��ȡ����Ƶ�����µ�ǰn������ */
			MediaRevDao mediaRDao=new MediaRevDao();
			List mediaRlist=mediaRDao.getNewReviewList(id);
			
			/* ����Ҫ���ŵ���Ƶ����Ƶ������ */
			request.setAttribute("mediasingle",single);
			request.setAttribute("mediaRlist",mediaRlist);			
		} catch (Exception e) {
			System.out.println("��̨����ȡӰ����ϸ��Ϣʧ�ܣ�");
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
		
		if("upload".equals(type)){																//����ǵ������ϴ���Ƶ���ύ��ť����������
			try {				
				SmartUpload myup=new SmartUpload();
				myup.initialize(this, request, response);
				myup.setAllowedFilesList("avi,asf,asx,3gp,mpg,mov,mp4,wmv,flv");				//���������ϴ����ļ�����
				myup.upload();																	//�ϴ��ļ�
				
				File upfile=myup.getFiles().getFile(0);											//��ȡ�ϴ����ļ�����Ϊֻ�ϴ���һ���ļ�������ֻ��һ��Ԫ��
				message=validateUpLoad(upfile);

				if(message.equals("")){															//���ͨ����֤
					Date now=new Date();																//��ȡ��ǰʱ��
					String serialName=Change.getSerial(now);											//���ù���Bean���ݵ�ǰʱ���ȡһ��Ωһ����
					
					String basePath=getServletContext().getRealPath("\\");								//��ȡWebӦ�õ�ʵ�ʴ��·��
					String upFilePath=basePath+"pages\\admin\\media\\temp\\"+serialName+"."+upfile.getFileExt();			//����һ��������ʱ�ļ���·����WebӦ�ø�Ŀ¼\pages\admin\media\temp\�ϴ����ļ������磬F:\Tomcat 6.0\webapps\MediaBlog\pages\admin\media\temp\04302008143755.mpg��
					String flvFilePath=basePath+"pages\\media\\videos\\"+serialName+".flv";								//����ת��Ϊflv��ʽ���ļ��ı���·��
					String cutPicPath=basePath+"images\\media\\"+serialName+".jpg";										//���ô��ϴ�����Ƶ�н�ȡ��ͼƬ�ı���·��
					
					upfile.saveAs(upFilePath,File.SAVEAS_PHYSICAL);										//�����ļ��������У���Ϊ��ʱ�ļ�
					boolean mark=convertVideo(upFilePath,flvFilePath,cutPicPath);						//ת����Ƶ��ʽ
				    
					if(mark){																			//ת����Ƶ��ʽ�ɹ��������ݱ�����Ӹ���Ƶ��Ϣ
				    	String src=serialName+".flv";															//��ȡ��Ƶ�ɹ�ת��Ϊflv��ʽ����ļ���
						String time=Change.dateTimeChange(now);	
						String pic=serialName+".jpg";															//��ȡ��Ƶ�Ľ�ͼ����
						int count=0;																			//������Ƶ�ķ��ʴ���
						String info=myup.getRequest().getParameter("info");										//��ȡ�������Ƶ������Ϣ
						String title=myup.getRequest().getParameter("title");									//��ȡ�������Ƶ����
						if(title==null||title.equals(""))title="�ޱ���";
						if(info==null||info.equals(""))info="�ҵ���Ƶ";
						
						Object[] params={whoid,title,src,pic,info,time,count};
						MediaDao mediaDao=new MediaDao();
						
						int i=mediaDao.upLoad(params);															//����DAO�������ݱ��������Ƶ��Ϣ
						if(i<=0)																				//�����Ƶ��Ϣʧ��
							message="<li>������Ƶ��Ϣʱʧ�ܣ�</li>";
						else																					//�����Ƶ��Ϣ�ɹ�
							message="<li>��Ƶ�ϴ��ɹ���</li>";
				    }
				    else																				//ת����Ƶ��ʽʧ��
				    	message="<li>ת����Ƶʱʧ�ܣ�</li>";
				}				
			}catch(SecurityException e1){				//����Υ���������ϴ����ļ����ͺ��׳����쳣
				message="<li>ֻ�����ϴ� <b>avi��asf��asx��3gp��mpg��mov��mp4��wmv��flv</b> ��ʽͼƬ��</li>";
				e1.printStackTrace();				
			}catch (SmartUploadException e2) {
				message="<li>��Ƶ�ϴ�ʧ�ܣ�</li>";		
				e2.printStackTrace();
			}catch(Exception e3){
				message="<li>����ʧ�ܣ�</li>";	
				e3.printStackTrace();
			}catch(OutOfMemoryError e4){
				message="<li>�ϴ�ʧ�ܣ����ϴ����ļ�̫��</li>";
				e4.printStackTrace();
			}			
		}
		else																					//����������ϴ�Ӱ���������Ӵ���������
			message="<li>��ѡ��Ҫ�ϴ�����Ƶ��</li>";
		
		request.setAttribute("message",message);		
		String forward=getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);	
	}
	/**
	 * @���ܣ���֤�Ƿ�ѡ����Ҫ�ϴ����ļ����Լ��ļ���С
	 * @���أ�String��ֵ
	 */
	private String validateUpLoad(File upfile){
		String message="";
		long maxLen=30*1024*1024;						//���������ϴ����ļ�����󳤶�Ϊ30MB
		if(upfile.isMissing()){							//û��ѡ���ļ�
			message+="<li>��ѡ��Ҫ�ϴ�����Ƶ��</li>";
		}
		else{
			int len=upfile.getSize();
			if(len==0)
				message="<li>�������ϴ���СΪ0�Ŀ��ļ���</li>";
			else if(len>maxLen)
				message="<li>�ϴ�����Ƶ���ӦΪ30MB��</li>";
		}
		return message;
	}
	/**
	 * @���ܣ���ת���ϴ�����ƵΪFLV��ʽ���ڴ��ϴ�����Ƶ�н�ͼ��
	 * @��������upFilePath��	 ����ָ��Ҫת����ʽ���ļ�·�����Լ�����ָ��Ҫ��ͼ����Ƶ��<br>
	 * @��������flvFilePath������ָ��ת��ΪFLV��ʽ����ļ��ı���·����<br>
	 * @��������cutPicPath��	 ����ָ����ȡ��ͼƬ�ı���·��
	 * @���أ�boolean��ֵ
	 */
	private boolean convertVideo(String upFilePath,String flvFilePath,String cutPicPath){
		String ffmpegPath=getInitParameter("ffmpegPath");							//��ȡ��web.xml�����õ�ת�����ߣ�ffmpeg.exe���Ĵ��·��
		
		//����һ��List����������ת����Ƶ�ļ�Ϊflv��ʽ������
		List<String> convert=new ArrayList<String>();
		convert.add(ffmpegPath);													//���ת������·��
		convert.add("-i");															//��Ӳ�����-i�����ò���ָ��Ҫת�����ļ�
		convert.add(upFilePath);													//���Ҫת����ʽ����Ƶ�ļ���·��
		convert.add("-qscale");
		convert.add("6");
		convert.add("-ab");
		convert.add("64");
		convert.add("-acodec");
		convert.add("mp3");
		convert.add("-ac");
		convert.add("2");
		convert.add("-ar");
		convert.add("22050");
		convert.add("-r");
		convert.add("24"); 
		convert.add("-y");															//��Ӳ�����-y�����ò���ָ���������Ѵ��ڵ��ļ�
		convert.add(flvFilePath);
		
		//����һ��List�������������Ƶ�н�ȡͼƬ������
		List<String> cutpic=new ArrayList<String>();
		cutpic.add(ffmpegPath);
		cutpic.add("-i");
		cutpic.add(upFilePath);														//ͬ�ϣ�ָ�����ļ���������ת��Ϊflv��ʽ֮ǰ���ļ���Ҳ������ת����flv�ļ���
		cutpic.add("-y");
		cutpic.add("-f");
		cutpic.add("image2");
		cutpic.add("-ss");															//��Ӳ�����-ss�����ò���ָ����ȡ����ʼʱ��
		cutpic.add("9");															//�����ʼʱ��Ϊ��9��
		cutpic.add("-t");															//��Ӳ�����-t�����ò���ָ������ʱ��
		cutpic.add("0.001");														//��ӳ���ʱ��Ϊ1����
		cutpic.add("-s");															//��Ӳ�����-s�����ò���ָ����ȡ��ͼƬ��С
		cutpic.add("350*240");														//��ӽ�ȡ��ͼƬ��СΪ350*240
		cutpic.add(cutPicPath);														//��ӽ�ȡ��ͼƬ�ı���·��
		
		boolean mark=true;
		ProcessBuilder builder = new ProcessBuilder();
	    try {				        
	    	builder.command(convert);
	        builder.start();
	        
	        builder.command(cutpic);
	        builder.start();
	    } catch (Exception e) {
	    	mark=false;
	        e.printStackTrace();
	    }
	    return mark;
	}	
	/**
	 * @���ܣ�ɾ����Ƶ
	 * @���裺���ȸ������󴫵ݵ�IDֵ����ѯ����Ƶ��Ϣ�����л�ȡ����Ƶ���ļ�����Ȼ��Ӵ�����ɾ������Ƶ�ļ����ٴӴ�����ɾ������Ƶ��ͼ���������ݱ���ɾ������Ƶ����Ϣ��
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		String forward="";
		int id=Change.strToInt(request.getParameter("id"));
		MediaDao mediaDao=new MediaDao();
		
		try {
			MediaSingle single=new MediaSingle();
			single=mediaDao.getSingleMedia(id);
			
			String flvName=single.getMediaSrc();			
			String picName=flvName.substring(0,flvName.lastIndexOf("."))+".jpg";
			
			System.out.println("flvName:"+flvName);
			System.out.println("picName:"+picName);
			
			boolean delflv=deleteFlv(flvName);									//�Ӵ�����ɾ����Ƶ�ļ�
			if(delflv){															//���ɾ����Ƶ�ļ��ɹ�
				boolean delpic=deletePic(picName);									//�Ӵ�����ɾ����Ƶ��ͼ
				if(delpic){															//���ɾ����Ƶ��ͼ�ɹ�
					int i=mediaDao.delete(id);											//�����ݱ���ɾ����Ƶ��Ϣ
					if(i>0){															//���ɾ����Ƶ��Ϣ�ɹ�
						message="<li>��Ƶɾ���ɹ���</li>";
						forward="/my/admin/media?action=adminList";
					}
					else{
						message="<li>��Ƶ�ļ��Լ���Ƶ��ͼ�Ѿ��Ӵ�����ɾ�������ڴ����ݱ���ɾ������Ƶ����Ϣʱʧ�ܣ�</li><br><a href='javascript:window.history.go(-1)'>�����ء�</a>";
						forward=getServletContext().getInitParameter("messagePage");
					}
				}
				else{
					message="<li>��Ƶ�ļ����Ѿ��Ӵ�����ɾ��������ɾ������Ƶ�Ľ�ͼʱʧ�ܣ�</li><br><a href='javascript:window.history.go(-1)'>�����ء�</a>";
					forward=getServletContext().getInitParameter("messagePage");
				}
			}
			else{																//����Ӵ�����ɾ����Ƶ�ļ�ʧ��
				message="<li>�޷��Ӵ�����ɾ������Ƶ�ļ���</li><a href='javascript:window.history.go(-1)'>�����ء�</a>";
				forward=getServletContext().getInitParameter("messagePage");
			}			
			
		} catch (SQLException e1) {	
			message="<li>ɾ����Ƶʧ�ܣ�</li>";
			forward=getServletContext().getInitParameter("messagePage");
			e1.printStackTrace();
		}
		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);	
	}
	/**
	 * @���ܣ��Ӵ�����ɾ����Ƶ�ļ�
	 */
	private boolean deleteFlv(String flvName){
		String path=getServletContext().getRealPath("\\")+"pages\\media\\videos\\"+flvName;
		java.io.File flvFile=new java.io.File(path);
		boolean delflv=flvFile.delete();			
		return delflv;
	}
	/**
	 * @���ܣ��Ӵ�����ɾ����Ƶ��ͼ
	 */
	private boolean deletePic(String picName){
		String path=getServletContext().getRealPath("\\")+"images\\media\\"+picName;
		java.io.File picFile=new java.io.File(path);
		boolean picflv=picFile.delete();			
		return picflv;
	}	
	protected void doOther(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	}
}
