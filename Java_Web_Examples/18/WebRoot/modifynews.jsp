<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.dbs.Dbnews"%>
<%
    int id=ParamUtils.getIntParameter(request,"id",0);
    Dbnews news=new Dbnews(id);
%>
<html>
<head>
<title>�޸Ĺ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>
<script language="javascript">
function Mycheck()
{
if (form1.subject.value=="")
{ alert("�����빫�����⣡");form1.subject.focus();return;}
if (form1.content.value=="")
{ alert("�����빫�����ݣ�");form1.content.focus();return;}
form1.submit();}
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
        <td height="68" colspan="2" background="Images/tiring-room/h_modifybbs.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">
		<form method="post" action="news_add2.jsp" name="form1">
		<table width="100%" height="236"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="13%" height="30"><div align="center">��&nbsp;&nbsp;�⣺</div></td>
            <td width="87%" height="30"><input name="Motif" type="text" class="" id="subject" size="63" value="<%=news.getMotif()%>">
              </td>
            </tr>
          <tr>
            <td height="30"><div align="center">�����ˣ�</div></td>
            <td height="30"><input name="Kithepeople" type="text" class="txt_grey" id="Person" value="<%=news.getKithepeople()%>"> </td>
            </tr>
          <tr>
        <input type="hidden" name="Id" value="<%=id%>">
        <input type="hidden" name="pageaction" value="MODIFY">
        <input type="hidden" name="responsepage" value="newsman.jsp">

            <td height="146"><div align="center">�� &nbsp;�ݣ�</div></td>          
            <td valign="top"><textarea name="Content" cols="63" rows="9" class="wenbenkuang" id="content"><%=news.getContent()%>
</textarea></td>
          </tr>
          <tr>
            <td height="30">
			  <div align="center">              </div></td>
            <td height="30"><input name="Submit" type="button" class="btn_grey" value="�޸�" onClick="Mycheck()">
              <input name="Submit2" type="reset" class="btn_grey" value="����">
              <input name="Submit3" type="button" class="btn_grey" value="����" onClick="history.back();"></td>
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
