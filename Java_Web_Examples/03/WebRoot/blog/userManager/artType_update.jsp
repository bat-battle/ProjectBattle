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
<title>�޸��������</title>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<%@ taglib prefix="s" uri="/struts-tags" %>
</head>
<%
String type=request.getParameter("type");
type=ToChinese.toChinese(type);
request.setAttribute("type",type); %>
<body>
<center>

�޸��������
  <table width="266" height="93" border="0" cellpadding="0" cellspacing="0">
    <s:form action="userInfo_artType_update">
    <tr>
      <td width="80">ԭ������ƣ�</td>
      <td width="186"><%=type%></td>
    </tr>
    <tr>
      <td>��������ƣ�</td>
      <td><s:textfield name="newsType"/><s:hidden name="oldType" value="%{#request.type}"/></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><s:submit value=" �޸� "/></td>
    </tr>
    </s:form>
  </table>


</center>
</body>
</html>
