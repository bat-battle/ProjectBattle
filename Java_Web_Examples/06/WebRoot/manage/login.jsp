<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
<title>�������߿��ԡ�����̨��¼</title>
<link href="../CSS/style.css" rel="stylesheet">
<script language="javascript">
function check(form){
	if (form.name.value==""){
		alert("���������Ա����!");form.name.focus();return false;
	}
	if (form.pwd.value==""){
		alert("����������!");form.pwd.focus();return false;
	}	
}
</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#EEEEEE"><table width="464" height="294" border="0" align="center" cellpadding="0" cellspacing="0" background="../Images/m_login.jpg">
      <tr>
        <td width="157" height="153">&nbsp;</td>
        <td width="307">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">
<html:form action="manage/manager.do?action=login" method="post" focus="name" onsubmit="return check(managerForm)">
                      <table width="100%"  border="0" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6">
                        <tr>
                          <td width="26%" height="30">����Ա���ƣ�</td>
                      <td width="74%">
                        <html:text property="name" size="25"/></td>
                      </tr>
                        <tr>
                          <td height="30">����Ա���룺</td>
                      <td><html:password property="pwd" size="25"/></td>
                      </tr>
                        <tr>
                          <td height="33" colspan="2" align="center"><html:submit styleClass="btn_grey" value="ȷ��"/>
                        &nbsp;
                        <html:reset value="����" styleClass="btn_grey"/>&nbsp;
						<html:button property="button" styleClass="btn_grey" value="�ر�" onclick="window.close();"/>                        </td>
                      </tr>
              </table> 
		    </html:form>		
		</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
