<%@ page contentType="text/html; charset=gb2312" %>
<script language="javascript">
function check(form){
	if(form.name.value==""){
		alert("�������û�����!");form.name.focus();return false;
	}
	if(form.pwd.value==""){
		alert("�������û�����!");form.pwd.focus();return false;
	}
	if(form.pwd1.value==""){
		alert("��ȷ���û�����!");form.pwd1.focus();return false;
	}
	if(form.pwd.value!=form.pwd.value){
		alert("������������û����벻һ�£�����������!");form.pwd.focus();return false;
	}
	form.submit();
}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���ʹ���ϵͳ</title>
<link rel="stylesheet" href="Css/style.css">
</head>

<body>
<table width="757" height="174" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="133" align="center" valign="top"><%@ include file="top.jsp"%></td>
  </tr>
  <tr>
    <td>
      <table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" background="images/area_bg.jpg">
        <tr>
          <td width="26%" align="center" class='word_white'>��ǰ��¼�û���<%=session.getAttribute("username")%></td>
          <td width="4%">&nbsp;</td>
          <td width="70%" valign="bottom">��ǰλ�ã�ϵͳ���� &gt; �û����� &gt; ����û� &gt;&gt;&gt;</td>
        </tr>
      </table>
<table width="100%" height="385" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td width="5" valign="top" background="images/left.gif">&nbsp;</td>
        <td align="center" valign="top">&nbsp;
		<form name="form1" method="post" action="user.do?action=useradd" onSubmit="return check(form1)">
        <table width="96%" height="160" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#DDDDDA" bordercolordark="#FFFFFF">
          <tr>
            <td width="28%" align="right">�û����ƣ�</td>
            <td width="3%" align="center">&nbsp;</td>
            <td width="69%" align="left"><input name="name" type="text" id="name" size="30"></td>
            </tr>
         <tr>
            <td align="right">��&nbsp;&nbsp;&nbsp;&nbsp;�룺</td>
            <td align="center">&nbsp;</td>
            <td align="left"><input name="pwd" type="password" id="pwd" size="30"></td>
            </tr>
         <tr>
           <td align="right">ȷ�����룺</td>
           <td align="center">&nbsp;</td>
           <td align="left"><input name="pwd1" type="password" id="pwd1" size="30"></td>
         </tr>
         <tr>
           <td colspan="2">&nbsp;</td>
           <td>
             <input name="Submit" type="submit" class="btn_grey" value="����">
&nbsp;
<input name="Submit2" type="reset" class="btn_grey" value="����">
&nbsp;
<input name="Submit3" type="button" class="btn_grey" value="����" onClick="window.location.href='user.do?action=userQuery'"></td>
         </tr>
        </table>
		</form>
		</td>
        <td width="10" valign="top" background="images/right.jpg">&nbsp;</td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="55" valign="top" background="images/bottom.jpg"><%@ include file="copyright.jsp"%></td>
  </tr>
</table>
</body>
</html>

