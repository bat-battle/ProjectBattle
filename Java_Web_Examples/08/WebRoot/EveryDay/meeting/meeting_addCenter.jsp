<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="com.hiernate.persistence.Meeting"/>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<%
	  Meeting meeting = new Meeting();                    //����meeting����
	  meeting.setMTime(request.getParameter("mtime"));    //��meeting�������������ת���meeting_addҳ���б�����ֵ
	  meeting.setAddress(request.getParameter("address"));
	  meeting.setContent(request.getParameter("content"));
	  meeting.setCPerson(request.getParameter("CPerson"));
	  meeting.setZPerson(request.getParameter("ZPerson"));
	  meeting.setSubject(request.getParameter("subject"));
	  HibernateUtil.saveMeeting(meeting);                 //����HibernateUtil�������г־û�����
	%>
   <script language="javascript">
	 alert("���ݱ���ɹ���");
	 opener.location.reload();     //ˢ�¸������е���ҳ
     window.close();               //�رյ�ǰ������
	</script>
</head>




