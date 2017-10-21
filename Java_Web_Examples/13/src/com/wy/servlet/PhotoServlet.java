package com.wy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.wy.dao.OperationData;
import com.wy.form.Photo;
import com.wy.form.UserInfo;

public class PhotoServlet extends HttpServlet {
	private String info = "";

	private OperationData data = null;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		info = request.getParameter("info");
		// ����ҳ����info����Ĳ�ֵͬ����ִ�в�ͬ�Ĳ���
		if (info.equals("userQueryPhoto")) {
			this.user_queryPhoto(request, response);
		}
		if (info.equals("userUploadPhoto")) {
			this.user_uploadPhoto(request, response);
		}
		if (info.equals("queryOnePhoto")) {

			this.queryOnePhoto(request, response);
		}
		if (info.equals("queryPhotoList")) {

			this.user_queryPhotoList(request, response);
		}
		if (info.equals("queryOnePhoto")) {

			this.queryOnePhoto(request, response);
		}
		if (info.equals("queryPhotoSlide")) {

			this.queryPhotoSlide(request, response);
		}
		if (info.equals("userDeletePhoto")) {

			this.user_deletePhoto(request, response);
		}
		if (info.equals("userprintPhoto")) {

			this.user_printPhoto(request, response);
		}
		if (info.equals("forward_index")) {

			this.forward_index(request, response);
		}

	}

	// ת����ҳ����
	public void forward_index(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List list = new OperationData().queryPhotoList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("photoIndex.jsp").forward(request,
				response);
	}

	// ����ˮӡ��ͼƬ
	public void user_printPhoto(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		Integer id = Integer.valueOf(request.getParameter("id"));
		String condition = "id = '" + id + "'";
		List list = data.photo_queryList(condition);
		Photo photo1 = (Photo) list.get(0);
		String filePath = request.getRealPath(photo1.getPhotoAddress()); // ����ͼƬ��Դ�ļ�
		String print = "savePrint/" + System.currentTimeMillis() + ".JPG";
		String printPath = request.getRealPath(print); // ����ˮӡͼƬ��λ��
		/** ******************************************************************************* */
		if (!photo1.getPrintAddress().equals("0")) {
			String path = request.getRealPath(photo1.getPrintAddress());
			java.io.File file1 = new java.io.File(path);
			if (file1.exists()) {
				file1.delete();
			}
		}
		/** ******************************************************************************* */
		String printInforamtion = com.wy.tools.Encrypt.toChinese(request
				.getParameter("information"));
		String information = "���ˮӡЧ��ʧ�ܣ�";
		if (com.wy.tools.ImageUtils.createMark(filePath, printPath,
				printInforamtion)) {
			Photo photo2 = new Photo();
			photo2.setId(photo1.getId());
			photo2.setPrintAddress(print);
			if (data.updatePhoto(photo2)) {
				information = "���ˮӡЧ���ɹ���";
			}
		}

		request.setAttribute("information", information);
		List list1 = data.photo_queryList(condition);
		Photo photo3 = (Photo) list1.get(0);
		request.setAttribute("photo", photo3);
		request.getRequestDispatcher("photoShow.jsp")
				.forward(request, response);
	}

	// ɾ��ͼƬ
	public void user_deletePhoto(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		data = new OperationData();
		Integer id = Integer.valueOf(request.getParameter("id")); // ��ҳ���л�ȡҪɾ����Ƭ��id��
		String condition = "id=" + id; // ������idΪ���������ò�ѯ����
		List list = data.photo_queryList(condition); // ����idֵ���в�ѯ��Ƭ��һ����Ϣ
		String address = null; // ���ô�ŷ������˵�ַ����
		String print = null;
		String type = null; // ������Ƭ����������
		if (list.size() == 1) { // �жϲ�ѯ�ļ��������Ƿ�ʹ���һ������
			Photo photo = (Photo) list.get(0);
			address = photo.getPhotoAddress(); // ��ȡ���ݿ�����Ƭ��ŷ������˵ĵ�ַ
			print = photo.getPrintAddress();
			type = photo.getPhotoType(); // ��ȡ��Ƭ������������
		}
		String path = request.getRealPath("/" + address); // ��ȡ�ļ���ʵ�ʵ�ַ
		data.photo_delete(id); // ɾ����Ƭ����Ӧ��SQL���
		// ����Ĳ����Ǹ����ļ�������λ�ý���ɾ������
		java.io.File file1 = new java.io.File(path);
		if (file1.exists()) {
			file1.delete();
		}
		String printPath = request.getRealPath("/" + print);
		java.io.File file2 = new java.io.File(printPath);
		if (file2.exists()) {
			file2.delete();
		}
		// ���ļ������ͱ�����request��Χ����
		request.setAttribute("type", type);
		request.getRequestDispatcher("dealwith.jsp").forward(request, response);
	}

	// ʵ���û��ϴ��Լ���ͼƬ
	public void user_uploadPhoto(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		com.jspsmart.upload.SmartUpload su = new com.jspsmart.upload.SmartUpload();
		String information = "��������������������Ƭʧ�ܣ�";
		try {
			su.initialize(this.getServletConfig(), request, response); // ���ó��������ĳ�ʼ��
			su.setMaxFileSize(2 * 1024 * 1024); // �����ϴ��ļ��Ĵ�С
			su.upload();
			Files files = su.getFiles(); // ��ȡ�ϴ����ļ�����

			for (int i = 0; i < files.getCount(); i++) {
				File singleFile = files.getFile(i); // ��ȡ�ϴ��ļ��ĵ����ļ�

				String fileType = singleFile.getFileExt(); // ��ȡ�ϴ��ļ�����չ��
				String[] type = { "JPG", "jpg", "gif", "bmp", "BMP" }; // �����ϴ��ļ�����չ��
				int place = java.util.Arrays.binarySearch(type, fileType); // �ж��ϴ��ļ��������Ƿ���ȷ

				String code = su.getRequest().getParameter("code"); // ��ȡ������֤������
				String codeSession = (String) request.getSession()
						.getAttribute("rand"); // ��ȡ�ͻ���session����֤���ֵ
				if (code.equals(codeSession)) { // �ж���֤���Ƿ���ȷ

					if (place != -1) { // �ж��ļ���չ���Ƿ���ȷ
						if (!singleFile.isMissing()) { // �жϸ��ļ��Ƿ�ѡ��
							String photoName = su.getRequest().getParameter(
									"photoName")
									+ i; // ��ȡ��Ƭ������
							String photoType = su.getRequest().getParameter(
									"photoType"); // ��ȡ�������
							String photoTime = su.getRequest().getParameter(
									"photoTime"); // ��ȡ����ϴ�ʱ��
							String username = su.getRequest().getParameter(
									"username"); // ��ȡ�ϴ��û���
							String photoSize = String.valueOf(singleFile
									.getSize()); // ��ȡ�ϴ��ļ��Ĵ�С
							String filedir = "savefile/"
									+ System.currentTimeMillis() + "."
									+ singleFile.getFileExt(); // ��ϵͳʱ����Ϊ�ϴ��ļ����ƣ������ϴ��ļ�������·��

							String smalldir = "saveSmall/"
									+ System.currentTimeMillis() + "."
									+ singleFile.getFileExt();

							Photo photo = new Photo();
							/** ********��photo�����е����Խ���һһ��ֵ*** */
							photo.setPhotoName(photoName);
							photo.setPhotoType(photoType);
							photo.setPhotoSize(photoSize);
							photo.setPhotoTime(photoTime);
							photo.setUsername(username);
							photo.setPhotoAddress(filedir);
							photo.setSmallPhoto(smalldir);
							/** ************************************ */
							if (data.photo_save(photo)) { // ʵ���ϴ�������SQL���
								singleFile.saveAs(filedir, File.SAVEAS_VIRTUAL); // ִ���ϴ�����
								com.wy.tools.ImageUtils.createSmallPhoto(
										request.getRealPath("/" + filedir),
										request.getRealPath("/" + smalldir));
								information = "�������Ƭ�ɹ�!";

							}

						}

					}

				}
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		request.setAttribute("information", information);
		request.getRequestDispatcher("user_upLoadPhoto.jsp").forward(request,
				response);

	}

	// ���û��ɹ���¼��ʵ�ֵ�¼�û���ѯ���Ĺ���
	public void user_queryPhoto(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
				"userInfo"); // ��ȡ�ͻ��˴��session�����е�����
		String username = userInfo.getUsername(); // ��ȡ�û���
		String[] type = data.queryPhotoType(username); // �����û�����ѯ���û��ϴ���������
		request.setAttribute("type", type); // ��������ʹ����request��Χ����
		String condition = "username = '" + username + "'";
		List list = data.photo_queryList(condition); // �����û�������ѯ�������
		request.setAttribute("list", list); // ����ѯ�Ľ��������request����Χ��
		request.getRequestDispatcher("user_queryPhoto.jsp").forward(request,
				response);
	}

	// ���û���¼�󣬶�ÿ�������е���Ƭ���в�ѯ
	public void user_queryPhotoList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		data = new OperationData();
		String type = com.wy.tools.Encrypt.toChinese(request
				.getParameter("type")); // ��ȡҳ���е��������
		String condition = "photoType = '" + type + "'";
		if (null != request.getSession().getAttribute("userInfo")) {
			UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
					"userInfo"); // ��ȡ�ͻ���session�еĶ���
			String username = userInfo.getUsername(); // ���ݿͻ���session�еĶ��󣬻�ȡ�û�������
			condition = "username ='" + username + "' and photoType = '" + type
					+ "'"; // ���ò�ѯ�������ֱ������û�����������ͽ��в�ѯ
		}
		List list = data.photo_queryList(condition); // ִ�в�ѯ����
		if (list.size() == 0) {
			request.setCharacterEncoding("gb2312");
			PrintWriter out = response.getWriter();
			out.print("<script language=javascript>history.go(-1);</script>");
		} else {
			request.setAttribute("list", list); // ����ѯ�Ľ��������request��Χ��
			request.setAttribute("type", type); // ��������Ʊ�����request��Χ��
			request.getRequestDispatcher("user_queryPhotoList.jsp").forward(
					request, response);
		}
	}

	// ����Ƭ����ϸ��ѯ
	public void queryOnePhoto(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		Integer id = Integer.valueOf(request.getParameter("id")); // ��ȡҳ��������ID��
		String condition = "id = '" + id + "'"; // ���ò�ѯ��������id��Ϊ��ѯ����
		List list = data.photo_queryList(condition); // ִ�в�ѯ�ķ���
		Photo photo = null;
		if (list.size() == 1) { // ����id�ŵ�ֵ�����ݿ�����Ψһ�ģ����ֻ����һ������
			photo = (Photo) list.get(0);
		}
		request.setAttribute("photo", photo); // ����ѯ�Ľ��������request��Χ��
		try {
			request.getRequestDispatcher("photoShow.jsp").forward(request,
					response);
			return;
		} catch (Exception e) {

		}

	}

	// �õ�Ƭ���
	public void queryPhotoSlide(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
				"userInfo"); // ��ȡ�ͻ���session�е�ָ������
		String username = userInfo.getUsername(); // ��ȡ�û�������
		String type = com.wy.tools.Encrypt.toChinese(request
				.getParameter("type")); // ��ȡ��վ��������
		String condition = "username ='" + username + "' and photoType = '"
				+ type + "'"; // ���ò�ѯ�����������û������������Ϊ����
		List list = data.photo_queryList(condition); // ִ�в�ѯ����
		String address[] = new String[list.size()]; // ������Ƭ����λ�õ���������
		for (int i = 0; i < list.size(); i++) {
			Photo photo = (Photo) list.get(i);
			address[i] = photo.getPhotoAddress(); // ����ѯ�Ľ���У���Ƭ���λ�ý���һһ��ֵ
		}
		request.setAttribute("address", address); // ����Ƭ��ַ��������request��Χ����
		request.getRequestDispatcher("photoShowSlide.jsp").forward(request,
				response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
