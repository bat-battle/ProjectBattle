<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.dbs.Dbshop"%>
<%
    int id=ParamUtils.getIntParameter(request,"id",0);
    Dbshop shop=new Dbshop(id);
%>
<html>
<head>
<title>�޸�������</title>
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
        <td height="68" colspan="2" background="Images/tiring-room/h_modifychain.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">
	<form method="POST" action="shop_add.jsp">
      <table width="80%" border="0" align="center">
        <tr>
          <td width="23%" height="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �û�����</td>
          <td colspan="2"><input type="text" name="username" size="20" value=<%=shop.getUsername()%>></td>
        </tr>
        <tr>
          <td width="23%" height="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ���룺</td>
          <td colspan="2"><input type="text" name="password" size="20" value=<%=shop.getPassword()%>></td>
        </tr>
        <tr>
          <td width="23%" height="30">&nbsp;&nbsp;&nbsp;&nbsp; ���������ƣ�</td>
          <td colspan="2"><input type="text" name="shopname" size="20" value=<%=shop.getShopname()%>></td>
        </tr>
        <tr>
          <td width="23%" height="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ����������</td>
          <td colspan="2"><input type="text" name="area" size="20" value=<%=shop.getArea()%>></td>
        </tr>
        <tr>
          <td width="23%" height="30">&nbsp;&nbsp; �����긺����:</td>
          <td colspan="2">
            <input type="text" name="peopleman" size="20" value=<%=shop.getPeopleman()%>></td>
        </tr>
        <tr>
          <td width="23%" height="30">&nbsp;&nbsp;&nbsp;&nbsp; �����˵绰:</td>
          <td colspan="2">
            <input type="text" name="mantel" size="20" value=<%=shop.getMantel()%>></td>
          <input type="hidden" name="id" value="<%=id%>">
          <input type="hidden" name="usertype" value="1">
          <input type="hidden" name="pageaction" value="MODIFY">
          <input type="hidden" name="responsepage" value="shopman.jsp">
        </tr>
        <tr>
          <td width="23%" height="30">&nbsp;&nbsp;&nbsp;&nbsp; ������绰��</td>
          <td colspan="2"><input type="text" name="shoptel" size="20" value=<%=shop.getShoptel()%>></td>
        </tr>
        <tr>
          <td width="23%" height="30" align="right"><input name="B1" type="submit" class="btn_grey" value="�ύ"></td>
          <td width="15%" align="center"><input name="B2" type="reset" class="btn_grey" value="ȫ����д"></td>
          <td width="62%"><input name="button" type="button" class="btn_grey" onClick="history.back();" value="&nbsp;��&nbsp;��&nbsp;"></td>
        </tr>
      </table>
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