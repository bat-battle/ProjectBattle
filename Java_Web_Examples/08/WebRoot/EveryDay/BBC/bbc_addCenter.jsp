<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="com.hiernate.persistence.Placard"/>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<jsp:directive.page import="com.hiernate.util.GetTime"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<title></title>
<%
   Placard placard = new Placard();						//�����������
   placard.setContent(request.getParameter("content")); //���ù�������
   placard.setSubject(request.getParameter("subject")); //���ù�������
   java.sql.Date dateDate = (java.sql.Date)GetTime.getDate(); //���ù������õ�ǰʱ��
   placard.setDDate(dateDate);							//���ù���ʱ��
   String person =(String)session.getAttribute("username");//��ù��淢����
   placard.setPerson(person); 								//���ù�����
   HibernateUtil.savePlacard(placard);						//���湫�����
%>
<script language="javascript">
	alert("������ӳɹ���");
	opener.location.reload();
	window.location.href='bbc_index.jsp';
	window.close();
	</script>
</head>


