<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="s" uri="/struts-tags" %>
<table width="480" height="147" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFCC00">
  <tr>
    <td height="147">	
	<table width="424" border="0" align="center" cellpadding="0" cellspacing="0">
	 <s:form action="userInfo_checkUser">
      <tr>
        <td width="77" height="30">�û�����</td>
        <td width="173"><s:textfield name="account"/></td>
        <td width="174"><s:fielderror><s:param value="%{'account'}"/></s:fielderror></td>
      </tr>
      <tr>
        <td height="30">��&nbsp;&nbsp;�룺</td>
        <td><s:password name="password"/></td>
        <td><s:fielderror><s:param value="%{'password'}"/></s:fielderror></td>
      </tr>
      <tr>
        <td height="30">У���룺</td>
        <td><s:textfield name="code"/></td>
        <td><s:fielderror><s:param value="%{'code'}"/></s:fielderror></td>
      </tr>
      <tr>
        <td height="30">&nbsp;</td>
        <td colspan="2"><a href="javascript:refreshImg('validateCodeImg');"><img src="image.jsp" name="validateCodeImg" border=0 id="validateCodeImg" /></a></td>
        </tr>
	  <tr>
        <td height="30">&nbsp;</td>
        <td colspan="2"><s:submit  value=" ��¼ "/>&nbsp;&nbsp;<input type="button" name="close" value=" �رմ��� " onClick="window.close()"></td>
        </tr>
        </s:form>
    </table>
	
	</td>
  </tr>
</table>
    
    
  
