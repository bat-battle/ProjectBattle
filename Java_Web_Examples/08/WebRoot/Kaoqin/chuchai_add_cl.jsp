<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="java.sql.Date"/>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title></title>
 <%
  Chuchai chuchai = new Chuchai();                       //�����������
  chuchai.setChuarea(request.getParameter("chuarea"));   
  chuchai.setDepartment(request.getParameter("department"));
  chuchai.setName1(request.getParameter("name1"));
  chuchai.setTime1(Date.valueOf(request.getParameter("time1")));
  chuchai.setTime2(Date.valueOf(request.getParameter("time2")));
  chuchai.setState("0");
  HibernateUtil.saveChuchai(chuchai);                    //���ñ��������Ϣ����
%>
<script language="javascript">
alert("������Ϣ��ӳɹ���");
opener.location.reload();
window.location.href='chuchai_index.jsp';
window.close();
</script>
</head>