<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<title>��ӹ���Ա��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
function check(form){
	if(form.name.value==""){
		alert("���������Ա����!");form.name.focus();return;
	}
	if(form.password1.value==""){
		alert("���������Ա����!");form.password1.focus();return;
	}
	if(form.password2.value==""){
		alert("��ȷ�Ϲ���Ա����!");form.password2.focus();return;
	}		
	if(form.password1.value!=form.password2.value){
		alert("����������Ĺ���Ա���벻һ�£�����������!");form.password1.focus();return;
	}
	form.submit();
}
</script>
<body>
<table width="292" height="175" border="0" cellpadding="0" cellspacing="0" background="../Images/subBG.jpg">
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="12%" height="47">&nbsp;</td>
        <td width="85%" valign="bottom"><table width="86%" height="31" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td class="word_white">��ӹ���Ա</td>
          </tr>
        </table></td>
        <td width="3%">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><table width="100%" height="116"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="116" align="center" valign="top">
	<html:form action="/manage/manager.do?action=managerAdd" method="post" focus="name">
	<table height="116"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="81" height="30" align="center">����Ա���ƣ�</td>
        <td width="167">
          <html:text property="name"/></td>
      </tr>
      <tr>
        <td height="28" align="center">����Ա���룺</td>
        <td><html:password styleId="password1" property="pwd"/></td>
      </tr>
      <tr>
        <td height="28" align="center">ȷ�� &nbsp;���룺</td>
        <td><html:password styleId="password2" property="pwd"/></td>
      </tr>
      <tr>
        <td height="30" align="center">&nbsp;</td>
        <td><html:button property="button" styleClass="btn_grey" value="����" onclick="check(managerForm)"/>
&nbsp;
<html:button property="button" styleClass="btn_grey" value="�ر�" onclick="window.close();"/></td>
      </tr>
    </table>
	</html:form></td>
          </tr>
        </table></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
