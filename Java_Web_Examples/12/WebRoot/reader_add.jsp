<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.ReaderDAO" %>
<%@ page import="com.dao.ReaderTypeDAO" %>
<%@ page import="com.actionForm.ReaderForm" %>
<%@ page import="com.actionForm.ReaderTypeForm"%>
<%@ page import="java.util.*"%>
<html>
<%
String str=null;
ReaderTypeDAO readerTypeDAO=new ReaderTypeDAO();
Collection coll=(Collection)readerTypeDAO.query(str);
if(coll==null || coll.isEmpty()){
	out.println("<script>alert('����¼�����������Ϣ!');history.back(-1);</script>");
}else{
	  Iterator it=coll.iterator();
	  int ID=0;
	  String name="";
%>
<script language="jscript">
function check(form){
	if(form.name.value==""){
		alert("�������������!");form.name.focus();return false;
	}
	if(form.barcode.value==""){
		alert("������������!");form.barcode.focus();return false;
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
        <td height="22" valign="top" class="word_orange">��ǰλ�ã����߹��� &gt; ���ߵ������� &gt; ��Ӷ�����Ϣ &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><table width="100%" height="493"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top">
	<form name="form1" method="post" action="reader?action=readerAdd">
	<table width="600" height="432"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td width="173" align="center">������</td>
        <td width="427" height="39">
          <input name="name" type="text"> 
          *         </td>
      </tr>
      <tr>
        <td width="173" align="center">�Ա�</td>
        <td height="35"><input name="sex" type="radio" class="noborder" id="radiobutton" value="��" checked>
          <label for="radiobutton">�� </label>
          <label>
          <input name="sex" type="radio" class="noborder" value="Ů">
          Ů</label></td>
      </tr>
      <tr>
        <td align="center">�����룺</td>
        <td><input name="barcode" type="text" id="barcode">
* </td>
      </tr>
      <tr>
        <td align="center">�������ͣ�</td>
        <td>
		<select name="typeid" class="wenbenkuang" id="typeid">
<%
  while(it.hasNext()){
    ReaderTypeForm readerTypeForm=(ReaderTypeForm)it.next();
	ID=readerTypeForm.getId().intValue();
	name=readerTypeForm.getName();
	%> 		
				
          <option value="<%=ID%>"><%=name%></option>
<%}%> 
        </select>        </td>
      </tr>
      <tr>
        <td align="center">ְҵ��</td>
        <td><input name="vocation" type="text" id="vocation"></td>
      </tr>
      <tr>
        <td align="center">�������ڣ�</td>
        <td><input name="birthday" type="text" id="birthday"></td>
      </tr>
      <tr>
        <td align="center">��Ч֤����</td>
        <td><select name="paperType" class="wenbenkuang" id="paperType">
          <option value="���֤" selected>���֤</option>
          <option value="ѧ��֤">ѧ��֤</option>
          <option value="����֤">����֤</option>
          <option value="����֤">����֤</option>
                        </select></td>
      </tr>
      <tr>
        <td align="center">֤�����룺</td>
        <td><input name="paperNO" type="text" id="paperNO"> 
          * </td>
      </tr>
      <tr>
        <td align="center">�绰��</td>
        <td><input name="tel" type="text" id="tel"></td>
      </tr>
      <tr>
        <td align="center">Email��</td>
        <td><input name="email" type="text" id="email" size="50">
          <input name="operator" type="hidden" id="operator" value="<%=manager%>"></td>
      </tr>
      <tr>
        <td align="center">��ע��</td>
        <td><textarea name="remark" cols="50" rows="5" class="wenbenkuang" id="remark"></textarea></td>
      </tr>
      <tr>
        <td align="center">&nbsp;</td>
        <td><input name="Submit" type="submit" class="btn_grey" value="����" onClick="return check(form1)">
&nbsp;
<input name="Submit2" type="button" class="btn_grey" value="����" onClick="history.back()"></td>
      </tr>
    </table>
	</form>
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
<%}%>
</body>
</html>
