<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.sql.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	
	<title>�����ϸ��Ϣҳ��</title>
	
<%
  Qingjia qingjia = new Qingjia();
  qingjia.setContent(request.getParameter("content"));
  qingjia.setTime1(Date.valueOf(request.getParameter("time1"))); //���ַ���ת����Date��
  qingjia.setTime2(Date.valueOf(request.getParameter("time2")));
  qingjia.setDepartment(request.getParameter("department"));
  qingjia.setState("0");
  qingjia.setName1(request.getParameter("name1"));
  HibernateUtil.saveQingjia(qingjia);
  
%>
<script language="javascript">
alert("�����Ϣ��ӳɹ���");
opener.location.reload();
window.location.href='qingjia_index.jsp';
window.close();
</script>
</head>



