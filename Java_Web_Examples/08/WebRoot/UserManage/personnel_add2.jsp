<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>��ҵ�ƻ�����ҳ��</title>
<%
  User user = new User();
  user.setBestMan(0);
  user.setAddress(request.getParameter("address"));
  user.setEmail(request.getParameter("email"));
  user.setJob(request.getParameter("job"));
  user.setUserName(request.getParameter("username"));
  user.setName(request.getParameter("name"));
  user.setBranch(request.getParameter("branch"));
  user.setPwd(request.getParameter("PWD"));
  user.setPurview(request.getParameter("purview"));
  user.setTel(request.getParameter("tel"));
  user.setSex(request.getParameter("sex"));
  HibernateUtil.saveUser(user);
  %>
 <script language="javascript">
		alert("Ա����Ϣ��ӳɹ���");
	       window.location.href='personnel_add.jsp';
 </script>
</head>