<%@ page language="java" pageEncoding="gb2312"%>

<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*"/>
<jsp:directive.page import="java.sql.Date"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title></title>
<%
   Waichu waichu = new Waichu();                        //���������Ϣ����               
   waichu.setContent(request.getParameter("content"));  //���ö�������ԭ��
   waichu.setDepartment(request.getParameter("department"));
   waichu.setName1(request.getParameter("name1"));      //���ö�������
   waichu.setState(0);                                  //���ö���ĳ�ʼ״̬
   waichu.setTime1(Date.valueOf(request.getParameter("time1")));    //���ö�������ʱ��
   waichu.setTime2(Date.valueOf(request.getParameter("time2")));    //���ö���Ļع�ʱ��
   HibernateUtil.saveWaichu(waichu);                    //���ñ��ֶ��󷽷�
%>
<script language="javascript">
alert("�����Ϣ��ӳɹ���");
opener.location.reload();
window.location.href='waichu.jsp';
window.close();
</script>
</head>