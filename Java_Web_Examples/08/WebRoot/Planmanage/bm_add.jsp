<%@ page language="java" pageEncoding="gb2312"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>���żƻ�����ҳ��</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
}
.STYLE2 {
	font-size: 10pt;
	color: #000000;
}
.STYLE4 {font-size: 10pt; color: #FFFFFF; }
-->
</style>
<script language="javascript">
function Mycheck()
{
if(form1.name1.value=="")
{alert("�����벿������!");form1.name1.focus();return;}
if(form1.title.value=="")
{alert("������ƻ�����!");form1.title.focus();return;}
if(form1.content.value=="")
{alert("�����벿�żƻ�����!");form1.content.focus();return;}
if(form1.time1.value=="")
{alert("���żƻ����ڲ���Ϊ��!");form1.riqi.focus();return;}
form1.submit();
}
</script>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<script language="javascript">
	function loadCalendar(field)
	{
    var rtn = window.showModalDialog("calender.jsp","","dialogWidth:280px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
    return;
}
</script>
 <table width="628" height="361" border="0" cellpadding="0" cellspacing="0" background="../Images/noword.jpg">
  <tr>
    <td width="628" height="361" valign="top">
      <table width="595" border="0" cellpadding="0" cellspacing="0">
       <tr><br>
         <td width="49" height="20">&nbsp;</td>
         <td width="546" valign="bottom"><br><span class="STYLE2">���żƻ�����</span></td>
       </tr>
     </table>
     <form action="bm_add_cl.jsp" method="post" name="form1">
	<table width="87%" height="59%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="20">&nbsp;&nbsp;</td>
      </tr>
      <tr>
        <td valign="top"><table width="582" height="280" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="62" height="20"><div align="center" class="STYLE2">��������</div></td>
            <td width="172"><input name="name1" type="text" id="name1" onKeyDown="if(event.keyCode==13){form1.title.focus();}"></td>
            <td width="68"><div align="center" class="STYLE2">�ƻ�����</div></td>
            <td width="280"><input name="title" type="text" id="title" size="28" onKeyDown="if(event.keyCode==13){form1.content.focus();}"></td>
          </tr>
          <tr>
            <td height="181" colspan="4"><table width="92%" height="0" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="61" height="151"><div align="center" class="STYLE2">�ƻ�����</div></td>
                <td width="456"><textarea name="content" cols="60" rows="10" id="content"></textarea></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="31" colspan="4"><table width="459" height="31" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="62" height="31"><div align="center" class="STYLE2">��������</div></td>
                <td width="140"><input name="time1" type="text" id="riqi" size="20" readonly="yes"></td>
                <td width="257"><img src="../Images/date.gif" width="20" height="20" onClick="loadCalendar(form1.riqi)"></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="48" colspan="4" valign="bottom"><table width="399" height="28" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="144" valign="bottom">
														<div align="right">
															<input name="Submit" type="button" class="btn_grey"onclick="Mycheck();" value="����">
														</div>
													</td>
													<td width="62" height="28" valign="bottom">
														&nbsp;&nbsp;<input name="Submit2" type="button" class="btn_grey" onClick="JScript:window.close();" value="�ر�">
													</td>
													<td width="89" valign="bottom">
													    &nbsp;&nbsp;<input name="Submit3" type="button" class="btn_grey" onClick="JScript:form1.reset();" value="����">
														
													</td>
													<td width="161" valign="bottom">&nbsp;
														
													</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table>
	</form>	</td>
  </tr>
</table>
</body>




