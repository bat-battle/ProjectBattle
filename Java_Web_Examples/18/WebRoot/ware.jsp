<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<title>�������Ʒ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>
<script language=javascript>
function CheckForm()
{
	if(document.form1.pname.value=="")
	{
		alert("��������Ʒ����");
		document.form1.pname.focus();
		return false;
	}
	if(document.form1.pmodel.value == "")
	{
		alert("�������ͺţ�");
		document.form1.pmodel.focus();
		return false;
	}
	if(document.form1.pcost.value == "")
	{
		alert("�����뵥�ۣ�");
		document.form1.pcost.focus();
		return false;
	}
	if(document.form1.pheft.value == "")
	{
		alert("������������");
		document.form1.pheft.focus();
		return false;
	}


		return true;
}
</script>

<body>
<table width="777" height="172"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="Images/tiring-room/tiring-room_01.gif" width="777" height="125"></td>
      </tr>
      <tr>
        <td height="47" valign="top" background="Images/tiring-room/tiring-room_02.gif"><jsp:include page="H_navigation.jsp"/></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="44" height="380" valign="top"><img src="Images/tiring-room/tiring-room_03.gif" width="44" height="248"></td>
    <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="68" colspan="2" background="Images/tiring-room/h_addgoods.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">
      		<form METHOD="POST" ACTION="ware_add.jsp" name="form1" onSubmit="return CheckForm();">
			      <input type="hidden" name="pageaction" value="create">
                  <input type="hidden" name="responsepage" value="wareman.jsp">
            <div align="left">
              <table width="467" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="87" height="30" align="right">��Ʒ���ƣ� </td>
                  <td width="371"><input type="text" name="pname" size="20" maxlength="50"></td>
                </tr>
                <tr>
                  <td width="87" height="30" align="right"> ��Ʒ�ͺţ�</td>
                  <td width="371"><input type="text" name="pmodel" size="20" maxlength="50"></td>
                </tr>
                <tr>
                  <td width="87" height="30" align="right"> ��Ʒ���ۣ�</td>
                  <td width="371"><input type="text" name="pcost" size="20" maxlength="50"></td>
                </tr>
                <tr>
                  <td width="87" height="30" align="right"> ��Ʒ������</td>
                  <td width="371"><input type="text" name="pheft" size="20" maxlength="5">
                  </td>
                </tr>
                <tr>
                  <td width="87" height="30" align="right"> �������ң�</td>
                  <td width="371"><input type="text" name="pfacturer" size="20" maxlength="20"></td>
                </tr>
                <tr>
                  <td width="87" height="30" valign="top" align="right"> ��Ʒ˵����</td>
                  <td width="371"><textarea name="pnote" cols="40" rows="4" wrap="hard" class="wenbenkuang"></textarea></td>
                </tr>
                <tr>
                  <td width="87" height="30" align="right"></td>
                  <td width="371"><input name="B1" type="submit" class="btn_grey" value="�ύ">
          &nbsp;
                    <input name="B2" type="reset" class="btn_grey" value="ȫ����д">
                    &nbsp;&nbsp;
                    <input name="button" type="button" class="btn_grey" onClick="history.back();" value="&nbsp;��&nbsp;��&nbsp;"></td>
                </tr>
              </table>
            </div>
	      </form>
		  </td>
      </tr>
    </table></td>
    <td width="35" valign="top"><img src="Images/tiring-room/tiring-room_05.gif" width="35" height="248"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
</body>
</html>