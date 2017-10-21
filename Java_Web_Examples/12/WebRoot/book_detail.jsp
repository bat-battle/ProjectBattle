<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.BookDAO" %>
<%@ page import="com.dao.BookTypeDAO" %>
<%@ page import="com.actionForm.BookForm" %>
<%@ page import="java.util.*"%>
<html>
<%
BookForm bookForm=(BookForm)request.getAttribute("bookDetail");
%>
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
        <td height="22" valign="top" class="word_orange">��ǰλ�ã�ͼ����� &gt; ͼ�鵵������ &gt; ͼ����ϸ��Ϣ &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><table width="100%" height="493"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top">
<%  
	int ID=bookForm.getId().intValue();
	String bookname=bookForm.getBookName();
	String barcode=bookForm.getBarcode();
	if(barcode==null) barcode="";
	String typename=bookForm.getTypeName();
	String author=bookForm.getAuthor();
	String translator=bookForm.getTranslator();	
	String publishing=bookForm.getPublishing();
	Float price=bookForm.getPrice();
	int pages=bookForm.getPage();
	String bookcase=bookForm.getBookcaseName();	

	String inTime=bookForm.getInTime();
	String operator=bookForm.getOperator();
  %>
	<table width="600" height="432"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td width="173" height="30" align="center">��&nbsp;��&nbsp;�룺</td>
        <td height="35"><input name="name" type="text" value="<%=barcode%>" size="40"></td>
      </tr>
      <tr>
        <td width="173" height="30" align="center">ͼ�����ƣ�</td>
        <td width="427" height="39">
          <input name="name" type="text" value="<%=bookname%>" size="60"> </td>
      </tr>
      <tr>
        <td height="30" align="center">ͼ�����ͣ�</td>
        <td><input name="vocation" type="text" id="vocation" value="<%=typename%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ߣ�</td>
        <td><input name="vocation" type="text" id="vocation" value="<%=author%>" size="50"></td>
      </tr>
      <tr>
        <td height="30" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ߣ�</td>
        <td><input name="birthday" type="text" id="birthday" value="<%=translator%>" size="50"></td>
      </tr>
      <tr>
        <td height="30" align="center">��&nbsp;��&nbsp;�磺</td>
        <td><input name="paperType" type="text" value="<%=publishing%>" size="40"></td>
      </tr>
      <tr>
        <td height="30" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
        <td><input name="paperNO" type="text" id="paperNO" value="<%=price%>">
          (Ԫ)</td>
      </tr>
      <tr>
        <td height="30" align="center">ҳ&nbsp;&nbsp;&nbsp;&nbsp;�룺</td>
        <td><input name="paperNO2" type="text" id="paperNO2" value="<%=pages%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ܣ�</td>
        <td><input name="tel" type="text" id="tel" value="<%=bookcase%>"></td>
      </tr>

      <tr>
        <td height="30" align="center">���ʱ�䣺</td>
        <td><input name="email" type="text" id="email" value="<%=inTime%>">        </td>
      </tr>
      <tr>
        <td height="30" align="center">��&nbsp;��&nbsp;Ա��</td>
        <td><input name="operator" type="text" id="operator" value="<%=operator%>">          </td>
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
