<%@ page language="java" pageEncoding="gb2312"%>

<jsp:directive.page import="com.hiernate.persistence.Meeting"/>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<jsp:directive.page import="java.sql.Date"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<%
	  Meeting meeting = new Meeting();
	  meeting.setMTime(request.getParameter("mtime"));
	  meeting.setAddress(request.getParameter("address"));
	  meeting.setContent(request.getParameter("content"));
	  meeting.setCPerson(request.getParameter("CPerson"));
	  meeting.setZPerson(request.getParameter("ZPerson"));
	  meeting.setSubject(request.getParameter("subject"));
	  HibernateUtil.saveMeeting(meeting);
	%>
 
	<script language="javascript">
	 alert("���ݱ���ɹ���");
	 opener.location.reload();  
	 //ˢ�¸������е���ҳ
	 window.close();
	//�رյ�ǰ������
	</script>
</head>




