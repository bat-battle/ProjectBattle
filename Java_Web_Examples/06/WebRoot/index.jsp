<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
<title>�������߿���</title>
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript">
function check(form){
	if (form.name.value==""){
		alert("������׼��֤��!");form.name.focus();return false;
	}
	if (form.pwd.value==""){
		alert("����������!");form.pwd.focus();return false;
	}
}
</script>
</head>
<body>
<table width="778" height="266" border="0" align="center" cellpadding="0" cellspacing="0" background="Images/login_top.jpg">
  <tr>
    <td width="118" colspan="2">&nbsp;</td>
  </tr>
</table>
<table width="778" height="158"  border="0" align="center" cellpadding="0" cellspacing="0" background="Images/login_mid.jpg">
<html:form action="manage/student.do?action=login" method="post" focus="ID" onsubmit="return check(studentForm)">
          <tr>
            <td>
				  
                    <table width="100%"  border="0" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6">
                        <tr>
						<td>&nbsp;</td>
						<td></td>
						<td></td>
						</tr>
						<tr>
                          <td width="35%" height="30">&nbsp;</td>
                      <td width="9%" height="30">׼��֤�ţ�</td>
                      <td width="27%">
					   <html:text property="ID" styleClass="logininput" size="25"/>                       </td>
                      <td width="29%">&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="30">&nbsp;</td>
                      <td height="30">��&nbsp;&nbsp;&nbsp;&nbsp;�룺</td>
                      <td><html:password property="pwd" styleClass="logininput" size="25"/></td>
                      <td>&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="31">&nbsp;</td>
                      <td height="31" colspan="2" align="left"><html:submit styleClass="btn_grey" value="��¼"/>
                        &nbsp;
						<html:reset value="����" styleClass="btn_grey"/>
                        <html:button property="button" styleClass="btn_grey" value="ע��" onclick="window.location.href='register.jsp'"/>
                        &nbsp;
                       <html:button property="button" styleClass="btn_grey" value="�һ�����" onclick="window.location.href='seekPwd.jsp'"/></td>
                      <td>&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="40">&nbsp;</td>
                          <td height="31" colspan="2" align="right" valign="bottom"><html:link page="/manage/login.jsp" styleClass="word_orange">�����̨</html:link></td>
                          <td>&nbsp;</td>
                        </tr>
						</html:form>
                    </table> 
		    </td>
  </tr>
</table>
<table width="778" height="196" border="0" align="center" cellpadding="0" cellspacing="0" background="Images/login_top.gif">
  <tr>
    <td height="182" background="Images/login_bottom.jpg">&nbsp;</td>
  </tr>
</table>
</body>
</html>
