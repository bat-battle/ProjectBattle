<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"  %>
<html>
<link href="../css/style.css" rel="stylesheet">
<style type="text/css">
<!--
.style1 {
	font-size: 14px;
	color: #0000FF;
}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����Ա��¼</title>
</head
><body>
<script language="javascript">
<!--
	function check(){
		if(form1.name.value==""){
			alert("�������������Ա����");
			form1.name.focus();
			return false;
		}
		if(form1.password.value==""){
			alert("�������������");
			form1.password.focus();
			return false;
		}
	}
-->

</script>

<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="300" height="121" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#ffffff" bordercolordark="#D1E2D6" bordercolorlight="#FFFFFF">
<form action="admin.jsp" method="post" name="form1">
  <tr align="center" valign="middle" bgcolor="#F7F3EF">
    <td height="30" colspan="2"><span class="style1">����Ա��¼</span></td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle">����Ա����:</td>
    <td width="172" align="left" valign="middle">
      <input name="name" type="text" style="width:120pt;">   </td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:</td>
    <td height="30" align="left" valign="middle">
      <input name="password" type="password" style="width:120pt;">   </td>
  </tr>
  <tr align="center" bgcolor="#F7F3EF">
    <td height="30" colspan="2" valign="middle"><input type="submit" name="Submit" value="�ύ" onClick="return check()">
    <input type="reset" name="Submit2" value="����"></td>
  </tr>
  </form>
</table>
</body>
</html>
