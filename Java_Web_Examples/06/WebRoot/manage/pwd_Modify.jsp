<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<title>�������߿��ԡ�����̨����</title>
<link href="../CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
function checkForm(form){
	if(form.oldpwd1.value==""){
		alert("�������ԭ����!");form.oldpwd1.focus();return false;
	}
	if(form.oldpwd1.value!=form.holdpwd.value){
		alert("�������ԭ���벻��ȷ������������!");form.oldpwd1.value="";
		form.oldpwd1.focus();return false;
	}
	if(form.newpwd.value==""){
		alert("�������������!");form.newpwd.focus();return false;
	}	
	if(form.newpwd1.value==""){
		alert("��ȷ��������!");form.newpwd1.focus();return false;
	}	
	if(form.newpwd.value!=form.newpwd1.value){
		alert("����������������벻һ�£�����������!");
		form.newpwd.value="";form.newpwd1.value="";
		form.newpwd.focus();return false;
	}
}
</script>
<body>
<%@ include file="top.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="left.jsp"%></td>
    <td width="602" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="78%" class="word_grey">&nbsp;��ǰλ�ã�<span class="word_darkGrey">����Ա��Ϣ���� &gt; �޸Ĺ���Ա���� &gt;&gt;&gt;</span></td>
              <td align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<%=session.getAttribute("manager")%>&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
</tr>
</table> 
<logic:iterate id="manager" name="pwdQueryif" type="com.wgh.actionForm.ManagerForm" scope="request">
<bean:define id="managerName" name="manager" property="name" type="String"/>
<bean:define id="managerPwd" name="manager" property="pwd" type="String"/>
<html:form action="/manage/manager.do?action=modifypwd" method="post" focus="oldpwd1" onsubmit="return checkForm(managerForm)">
  <table width="63%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center">
    <td width="27%" align="left" style="padding:5px;">����Ա���ƣ�</td>
    <td width="73%" align="left">
      <html:text property="name" value="<%=managerName%>" readonly="true" size="30"/>    </td>
	  </tr>
    <tr>
    <td align="left" style="padding:5px;">ԭ���룺</td>
    <td align="left"><html:password styleId="oldpwd1" property="oldpwd" size="30"/>
      <html:hidden styleId="holdpwd" property="oldpwd" value="<%=managerPwd%>"/></td>
    </tr>
    <tr>
      <td align="left" style="padding:5px;">�����룺</td>
      <td align="left"><html:password styleId="newpwd"  property="pwd"/></td>
    </tr>
    <tr>
      <td align="left" style="padding:5px;">ȷ�������룺</td>
      <td align="left"><html:password styleId="newpwd1" property="pwd"/></td>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><html:submit property="submit" styleClass="btn_grey" value="����"/>
        &nbsp;
        <html:reset property="reset" styleClass="btn_grey" value="ȡ��"/>
		&nbsp;
		<html:button property="button" styleClass="btn_grey" value="����" onclick="window.location.href='manager.do?action=managerQuery'"/>
		</td>
    </tr>
</table>
</html:form>
</logic:iterate>
</td>
      </tr>
    </table>
</td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
