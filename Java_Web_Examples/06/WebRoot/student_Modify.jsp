<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<title>�������߿���</title>
<html:base />
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript" src="JS/ContentLoader.js">
</script>
</head>
<script language="javascript">
function checkForm(form){
	if(form.name.value==""){
		alert("�����뿼������!");form.name.focus();return false;
	}
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
	if(form.question.value==""){
		alert("��������ʾ����!");form.question.focus();return false;
	}
	if(form.answer.value==""){
		alert("�����������!");form.answer.focus();return false;
	}
}
</script>
<body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="131" background="Images/top_bg.jpg">&nbsp;</td>
  </tr>
</table>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="774" height="487"  border="0" cellpadding="0" cellspacing="0" align="center">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td class="word_grey">&nbsp;<img src="Images/f_ico.gif" width="8" height="8"> ��ǰλ�ã��� <span class="word_darkGrey">�޸ĸ������� &gt;&gt;&gt;</span></td>
			  <td align="right"><img src="Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/index.jsp" >������ҳ</html:link>&nbsp;</td>
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
<html:form action="/manage/student.do?action=studentModify" method="post" onsubmit="return checkForm(studentForm)">
<bean:define id="studentID" name="modifyQuery" property="ID" type="String"/>
<bean:define id="studentPwd" name="modifyQuery" property="pwd" type="String"/>
  <table width="57%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr>
    <td height="30" align="left" style="padding:5px;">����������</td>
    <td align="left">
	<html:hidden property="ID" value="<%=studentID%>"/>
	 <html:text property="name" size="20" name="modifyQuery" readonly="true"/> *</td>
    </tr>
	    <tr>
    <td align="left" style="padding:5px;">ԭ&nbsp;��&nbsp;�룺</td>
    <td align="left"><html:password styleId="oldpwd1" property="oldpwd" size="30"/> *
      <html:hidden styleId="holdpwd" property="oldpwd" value="<%=studentPwd%>"/></td>
    </tr>
    <tr>
    <td height="30" align="left" style="padding:5px;">��&nbsp;��&nbsp;�룺</td>
    <td align="left"><html:password styleId="newpwd" property="pwd" size="20"/>��������6��20λ�����ֻ���ĸ��ɣ� *     </td>
    </tr>
  <tr align="center">
    <td width="20%" height="30" align="left" style="padding:5px;">ȷ�������룺</td>
    <td width="80%" align="left">
      <html:password styleId="newpwd1" property="pwd" size="20"/> *	  </td>
    <tr>
    <tr>
    <td height="30" align="left" style="padding:5px;">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
    <td align="left">
		<html:select property="sex" name="modifyQuery">
	 	<html:option value="��">�� </html:option>
		<html:option value="Ů">Ů </html:option>
		</html:select>     </td>
    </tr>	
    <tr align="center">
    <td width="20%" height="30" align="left" style="padding:5px;">��ʾ���⣺</td>
    <td width="80%" align="left">
      <html:text property="question" size="40" name="modifyQuery"/>�����ҵ����գ� *	  </td>
    </tr>
	  <tr align="center">
    <td width="20%" height="30" align="left" style="padding:5px;">����𰸣�</td>
    <td width="80%" align="left">
      <html:text property="answer" size="40" name="modifyQuery"/> ����7��17�գ�*</td>
    </tr>
	  <tr align="center">
    <td width="20%" height="30" align="left" style="padding:5px;">ר&nbsp;&nbsp;&nbsp;&nbsp;ҵ��</td>
    <td width="80%" align="left">
      <html:text property="profession" size="40" name="modifyQuery"/></td>
    </tr>
	<tr align="center">
    <td width="20%" height="30" align="left" style="padding:5px;">���֤�ţ�</td>
    <td width="80%" align="left">
      <html:text property="cardNo" size="40" readonly="true" name="modifyQuery"/> *</td>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><html:submit property="submit" styleClass="btn_grey" value="����"/>
        &nbsp;
        <html:reset property="reset" styleClass="btn_grey" value="ȡ��"/>
&nbsp;
		<html:button property="button" styleClass="btn_grey" value="����" onclick="window.location.href='../default.jsp'"/>
		</td>
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
