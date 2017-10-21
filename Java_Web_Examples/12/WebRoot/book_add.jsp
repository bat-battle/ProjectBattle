<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.BookDAO" %>
<%@ page import="com.dao.BookTypeDAO" %>
<%@ page import="com.actionForm.BookForm" %>
<%@ page import="com.actionForm.BookTypeForm"%>
<%@ page import="com.dao.BookCaseDAO" %>
<%@ page import="com.actionForm.BookCaseForm" %>
<%@ page import="com.dao.PublishingDAO" %>
<%@ page import="com.actionForm.PublishingForm" %>
<%@ page import="java.util.*"%>
<html>
<%
String str=null;
BookTypeDAO bookTypeDAO=new BookTypeDAO();
Collection coll_type=(Collection)bookTypeDAO.query(str);
if(coll_type==null || coll_type.isEmpty()){
	out.println("<script>alert('����¼��ͼ��������Ϣ!');history.back(-1);</script>");
}else{
	  Iterator it_type=coll_type.iterator();
	  int typeID=0;
	  String typename="";
	  BookCaseDAO bookcaseDAO=new BookCaseDAO();
	  String str1=null;
	  Collection coll_bookcase=(Collection)bookcaseDAO.query(str1);
	  if(coll_bookcase==null || coll_bookcase.isEmpty()){
	  	out.println("<script>alert('����¼�������Ϣ!');history.back(-1);</script>");
	  }else{
	  	Iterator it_bookcase=coll_bookcase.iterator();
	  	int bookcaseID=0;
	  	String bookcasename="";
	  PublishingDAO pubDAO=new PublishingDAO();
	  String str2=null;
	  Collection coll_pub=(Collection)pubDAO.query(str2);
	  if(coll_pub==null || coll_pub.isEmpty()){
	  	out.println("<script>alert('����¼���������Ϣ!');history.back(-1);</script>");
	  }else{	
	  	Iterator it_pub=coll_pub.iterator();
	  	String isbn="";
	  	String pubname="";	  	
%>
<script language="jscript">
function check(form){
	if(form.barcode.value==""){
		alert("������������!");form.barcode.focus();return false;
	}
	if(form.bookName.value==""){
		alert("������ͼ������!");form.bookName.focus();return false;
	}
	if(form.price.value==""){
		alert("������ͼ�鶨��!");form.price.focus();return false;
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
        <td height="22" valign="top" class="word_orange">��ǰλ�ã�ͼ����� &gt; ͼ�鵵������ &gt; ���ͼ����Ϣ &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><table width="100%" height="493"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top">
	<form name="form1" method="post" action="book?action=bookAdd">
	<table width="600" height="432"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td width="173" align="center">��&nbsp;��&nbsp;�룺</td>
        <td width="427" height="39">
          <input name="barcode" type="text" id="barcode">
          *</td>
      </tr>
      <tr>
        <td align="center">ͼ�����ƣ�</td>
        <td height="39"><input name="bookName" type="text" id="bookName" size="50">
          * </td>
      </tr>
      <tr>
        <td align="center">ͼ�����ͣ�</td>
        <td>
		<select name="typeId" class="wenbenkuang" id="typeId">
<%
  while(it_type.hasNext()){
    BookTypeForm bookTypeForm=(BookTypeForm)it_type.next();
	typeID=bookTypeForm.getId().intValue();
	typename=bookTypeForm.getTypeName();
	%> 		
				
          <option value="<%=typeID%>"><%=typename%></option>
<%}%> 
        </select>        </td>
      </tr>
      <tr>
        <td align="center">���ߣ�</td>
        <td><input name="author" type="text" id="author" size="40"></td>
      </tr>
      <tr>
        <td align="center">���ߣ�</td>
        <td><input name="translator" type="text" id="translator" size="40"></td>
      </tr>
      <tr>
        <td align="center">�����磺</td>
        <td><select name="isbn" class="wenbenkuang">
<%
  while(it_pub.hasNext()){
    PublishingForm pubForm=(PublishingForm)it_pub.next();
	isbn=pubForm.getIsbn();
	pubname=pubForm.getPubname();
	%> 		
				
          <option value="<%=isbn%>"><%=pubname%></option>
<%}%> 
        </select> </td>
      </tr>
      <tr>
        <td align="center">�۸�</td>
        <td><input name="price" type="text" id="price"> 
          (Ԫ) * </td>
      </tr>
      <tr>
        <td align="center">ҳ�룺</td>
        <td><input name="page" type="text" id="page"></td>
      </tr>
      <tr>
        <td align="center">��ܣ�</td>
        <td><select name="bookcaseid" class="wenbenkuang" id="bookcaseid">
<%
  while(it_bookcase.hasNext()){
    BookCaseForm bookCaseForm=(BookCaseForm)it_bookcase.next();
	bookcaseID=bookCaseForm.getId().intValue();
	bookcasename=bookCaseForm.getName();
	%> 		
				
          <option value="<%=bookcaseID%>"><%=bookcasename%></option>
<%}%> 
        </select>
          <input name="operator" type="hidden" id="operator" value="<%=manager%>"></td>
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
<%}
}
}%>
</body>
</html>
