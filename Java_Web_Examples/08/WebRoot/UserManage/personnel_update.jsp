<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>�޸��û���Ϣҳ��</title>
<%
  String strid = (String)session.getAttribute("idd");
  List listU = HibernateUtil.findUserId(Integer.parseInt(strid));
  if(!listU.isEmpty()&& listU.size()>0){
	  for(int j=0 ;j<listU.size();j++){
		  User newUser = (User)listU.get(j);
		  newUser.setAddress(request.getParameter("address"));
		  newUser.setEmail(request.getParameter("email"));
		  newUser.setPwd(request.getParameter("PWD"));
		  newUser.setName(request.getParameter("name"));
		  newUser.setBranch(request.getParameter("branch"));
		  newUser.setPurview(request.getParameter("purview"));
		  newUser.setSex(request.getParameter("sex"));
		  newUser.setTel(request.getParameter("tel"));
		  newUser.setJob(request.getParameter("job"));
		  HibernateUtil.updateUser(newUser);%>
<%}}%>
      <script language="javascript">
	     alert("���������޸ĳɹ���");
	     opener.location.reload();
	     window.location.href='personnel_top.jsp';
	     window.close();
	    </script>
</head>