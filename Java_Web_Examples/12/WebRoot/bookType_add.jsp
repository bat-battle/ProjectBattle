<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>���ͼ��������Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>
<script language="jscript">
function check(form){
	if(form.typeName.value==""){
		alert("��������������!");form.typeName.focus();return false;
	}
	if(form.days.value==""){
		alert("������ɽ�����!");form.days.focus();return false;
	}	
}
</script>
<body>
<table width="292" height="175" border="0" cellpadding="0" cellspacing="0" background="Images/subBG.jpg">
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="3%" height="31">&nbsp;</td>
        <td width="94%">&nbsp;</td>
        <td width="3%">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><table width="100%" height="131"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">	<form name="form1" method="post" action="bookType?action=bookTypeAdd">
	<table height="100"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td width="77" align="center">�������ƣ�</td>
        <td width="198" height="39">
          <input name="typeName" type="text" size="30">        </td>
      </tr>
      <tr>
        <td width="77" align="center">�ɽ�������</td>
        <td height="35"><input name="days" type="text" id="days" size="25">
          (��)</td>
      </tr>
      <tr>
        <td align="center">&nbsp;</td>
        <td><input name="Submit" type="submit" class="btn_grey" value="����" onClick="return check(form1)">
          &nbsp;
          <input name="Submit2" type="button" class="btn_grey" value="�ر�" onClick="window.close();"></td>
      </tr>
    </table>
	        </form></td>
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
