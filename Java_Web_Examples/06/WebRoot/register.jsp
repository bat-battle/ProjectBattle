<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<title>�������߿���</title>
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript" src="JS/ContentLoader.js">
</script>
</head>
<script language="javascript">
function checkForm(form){
	if(form.name.value==""){
		alert("�����뿼������!");form.name.focus();return false;
	}
	if(form.password1.value==""){
		alert("�������¼����!");form.password1.focus();return false;
	}
	if(form.password1.value.length<6 || form.password1.value.length>20){
		alert("����������벻�Ϸ�������������6λ������С�ڵ�20λ!");form.password1.focus();return false;
	}
	if(form.password2.value==""){
		alert("��ȷ�ϵ�¼����!");form.password2.focus();return false;
	}		
	if(form.password1.value!=form.password2.value){
		alert("����������ĵ�¼���벻һ�£�����������!");form.password1.focus();return false;
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
              <td class="word_grey">&nbsp;<img src="Images/f_ico.gif" width="8" height="8"> ��ǰλ�ã��� <span class="word_darkGrey">����ע�� &gt;&gt;&gt;</span></td>
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
<html:form action="/manage/student.do?action=studentAdd" method="post" onsubmit="return checkForm(studentForm)">
  <table width="57%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr>
    <td height="30" align="left" style="padding:5px;">����������</td>
    <td align="left">
	 <html:text property="name" size="20"/> *</td>
    </tr>
    <tr>
    <td height="30" align="left" style="padding:5px;">��&nbsp;&nbsp;&nbsp;&nbsp;�룺</td>
    <td align="left"><html:password styleId="password1" property="pwd" size="20"/>��������6��20λ�����ֻ���ĸ��ɣ� *     </td>
    </tr>
  <tr align="center">
    <td width="16%" height="30" align="left" style="padding:5px;">ȷ�����룺</td>
    <td width="84%" align="left">
      <html:password styleId="password2" property="pwd" size="20"/> *	  </td>
    <tr>
    <tr>
    <td height="30" align="left" style="padding:5px;">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
    <td align="left">
		<html:select property="sex">
	 	<html:option value="��">�� </html:option>
		<html:option value="Ů">Ů </html:option>
		</html:select>     </td>
    </tr>	
    <tr align="center">
    <td width="16%" height="30" align="left" style="padding:5px;">��ʾ���⣺</td>
    <td width="84%" align="left">
      <html:text property="question" size="40"/>�����ҵ����գ� *	  </td>
    </tr>
	  <tr align="center">
    <td width="16%" height="30" align="left" style="padding:5px;">����𰸣�</td>
    <td width="84%" align="left">
      <html:text property="answer" size="40"/> ����7��17�գ�*</td>
    </tr>
	  <tr align="center">
    <td width="16%" height="30" align="left" style="padding:5px;">ר&nbsp;&nbsp;&nbsp;&nbsp;ҵ��</td>
    <td width="84%" align="left">
      <html:text property="profession" size="40"/></td>
    </tr>
	<tr align="center">
    <td width="16%" height="30" align="left" style="padding:5px;">���֤�ţ�</td>
    <td width="84%" align="left">
      <html:text property="cardNo" size="40"/> *</td>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><html:submit property="submit" styleClass="btn_grey" value="����"/>
        &nbsp;
        <html:reset property="reset" styleClass="btn_grey" value="ȡ��"/>
		&nbsp;
		<html:button property="button" styleClass="btn_grey" value="����" onclick="window.location.href='index.jsp'"/>		</td>
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
