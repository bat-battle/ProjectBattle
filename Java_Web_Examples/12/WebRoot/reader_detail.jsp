<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.ReaderDAO" %>
<%@ page import="com.dao.ReaderTypeDAO" %>
<%@ page import="com.actionForm.ReaderForm" %>
<%@ page import="java.util.*"%>
<html>
<%
ReaderForm readerForm=(ReaderForm)request.getAttribute("readerDetail");
%>
<script language="jscript">
function check(form){
	if(form.name.value==""){
		alert("�������������!");form.name.focus();return false;
	}
	if(form.paperNO.value==""){
		alert("������֤������!");form.paperNO.focus();return false;
	}
}
</script>
<head>
<title>ͼ��ݹ���ϵͳ</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">��ǰλ�ã����߹��� &gt; ���ߵ������� &gt; ������ϸ��Ϣ &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><table width="100%" height="493"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top">
<%  int ID=0;
  String name=readerForm.getName();
  String sex=readerForm.getSex();  
  String barcode=readerForm.getBarcode();
  String vocation=readerForm.getVocation();
  String birthday=readerForm.getBirthday();
  String paperType=readerForm.getPaperType();
  String paperNO=readerForm.getPaperNO();
  String tel=readerForm.getTel();
  String email=readerForm.getEmail();
  String createDate=readerForm.getCreateDate();
  String remark=readerForm.getRemark();
  String operator=readerForm.getOperator();
  int typeid=readerForm.getTypeid();
  String typename=readerForm.getTypename();
  %>
	<table width="600" height="432"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td width="173" height="30" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
        <td width="427" height="39">
          <input name="name" type="text" value="<%=name%>"> </td>
      </tr>
      <tr>
        <td width="173" height="30" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
        <td height="35"><input name="name" type="text" value="<%=sex%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">��&nbsp;��&nbsp;�룺</td>
        <td><input name="barcode" type="text" id="barcode" value="<%=barcode%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">�������ͣ�</td>
        <td><input name="vocation" type="text" id="vocation" value="<%=typename%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">ְ&nbsp;&nbsp;&nbsp;&nbsp;ҵ��</td>
        <td><input name="vocation" type="text" id="vocation" value="<%=vocation%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">�������ڣ�</td>
        <td><input name="birthday" type="text" id="birthday" value="<%=birthday%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">��Ч֤����</td>
        <td><input name="paperType" type="text" value="<%=paperType%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">֤�����룺</td>
        <td><input name="paperNO" type="text" id="paperNO" value="<%=paperNO%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">�Ǽ����ڣ�</td>
        <td><input name="paperNO2" type="text" id="paperNO2" value="<%=createDate%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
        <td><input name="tel" type="text" id="tel" value="<%=tel%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">Email��</td>
        <td><input name="email" type="text" id="email" value="<%=email%>" size="50">
          </td>
      </tr>
      <tr>
        <td height="30" align="center">��&nbsp;��&nbsp;Ա��</td>
        <td><input name="operator" type="text" id="operator" value="<%=operator%>">
          </td>
      </tr>	  
      <tr>
        <td align="center">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
        <td><textarea name="remark" cols="50" rows="5" class="wenbenkuang" id="remark"><%=remark%></textarea></td>
      </tr>
      <tr>
        <td align="center">&nbsp;</td>
        <td>
&nbsp;
<input name="Submit2" type="button" class="btn_grey" value="����" onClick="history.back()"></td>
      </tr>
    </table>
	</td>
  </tr>
</table></td>
      </tr>
    </table>
</td>
  </tr>
</table><%@ include file="copyright.jsp"%></td>
  </tr>
</table>
</body>
</html>
