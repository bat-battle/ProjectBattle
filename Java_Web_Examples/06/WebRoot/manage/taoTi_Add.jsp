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
	if(form.name.value==""){
		alert("��������������!");form.name.focus();return false;
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
              <td width="78%" class="word_grey">&nbsp;��ǰλ�ã�<span class="word_darkGrey">������Ϣ���� &gt; ���������Ϣ &gt;&gt;&gt;</span></td>
              <td align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;��ǰ����Ա��<%=session.getAttribute("manager")%>&nbsp;</td>
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
<html:form action="/manage/taoTi.do?action=taoTiAdd" method="post" onsubmit="return checkForm(taoTiForm)">
  <table width="63%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center">
    <td width="27%" height="30" align="left" style="padding:5px;">�������ƣ�</td>
    <td width="73%" align="left">
      <html:text property="name" size="30"/>
	  </td>
    <tr>
    <td height="30" align="left" style="padding:5px;">�����γ̣�</td>
    <td align="left">
	 <html:select property="lessonId">
		<html:options collection="lessonList" property="ID" labelProperty="name"/>
	 </html:select>
     </td>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><html:submit property="submit" styleClass="btn_grey" value="����"/>
        &nbsp;
        <html:reset property="reset" styleClass="btn_grey" value="ȡ��"/>
		&nbsp;
		<html:button property="button" styleClass="btn_grey" value="����" onclick="window.location.href='taoTi.do?action=taoTiQuery'"/>		</td>
    </tr>
</table>
</html:form>
</td>
      </tr>
    </table>
</td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
