<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.mr.tools.ToChinese"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����Сֽ��</title>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<%@ taglib prefix="s" uri="/struts-tags" %>
</head>

<%
String account=(String)request.getParameter("account");
account = new String(account.getBytes("ISO8859_1"), "gbk");
%>
<body>
<center>

����Сֽ��
  <table width="476" height="93" border="0" cellpadding="0" cellspacing="0">
    <s:form action="info_f_addInfo?sign=1">
    <tr>
      <td width="73">�����ˣ�</td>
      <td width="403"><%=account %></td>
    </tr>
    <tr>
      <td>�������ݣ�</td>
      <td><s:textarea cols="40" rows="9" name="info_content"/></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><s:submit value=" ���� "/>
      
       <s:hidden name="info_account" value="%{#session.userInfo.account}"/>
        <s:hidden name="info_sign" value="%{'1'}"/>      
        <s:hidden name="info_fromAccount" value="%{#session.account}"/>      
      </td>
    </tr>
    </s:form>
  </table>


</center>
</body>
</html>
