<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>���ղ��͵ش�-����Ա��¼</title>
    <style type="text/css">
    	body{
    		font-size:12px;
    		background-color:#AEC076;
    	}
    </style>
 </head>
 <script language="javascript" type="text/javascript" src="js/validate.JS"></script>
  <body><center>
  <s:form action="adminInfo_admin_check">    
    <table width="352" height="231" border="0" cellpadding="0" cellspacing="0" background="images/a_land.gif">
      <tr>
        <td>
		
		<table width="261" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="83" height="25" align="right">��&nbsp;&nbsp;�ţ�</td>
        <td colspan="2"><s:textfield name="account"/><s:fielderror><s:param value="%{'account'}"/></s:fielderror></td>
      </tr>
      <tr>
        <td height="25" align="right">��&nbsp;&nbsp;�룺</td>
        <td colspan="2"><s:password name="password"/><s:fielderror><s:param value="%{'password'}"/></s:fielderror></td>
      </tr>
      <tr>
        <td height="25" align="right">У���룺</td>
        <td colspan="2"><s:textfield name="code"/><s:fielderror><s:param value="%{'code'}"/></s:fielderror></td>
      </tr>
      <tr>
        <td height="25">&nbsp;</td>
        <td width="82"><img src="image.jsp" name="validateCodeImg" border=0 id="validateCodeImg" />&nbsp;&nbsp;&nbsp;</td>
        <td width="96"><a href="javascript:refreshImg('validateCodeImg');">������</a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td colspan="2"><s:submit value=" ��¼ "/></td>
      </tr>
  </table>		
			
		</td>
      </tr>
    </table>
  </s:form>
  </center>
  </body>
</html>
