<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.BookTypeDAO" %>
<%@ page import="com.actionForm.BookTypeForm" %>
<%@ page import="java.util.*"%>
<html>
<%
Collection coll=(Collection)request.getAttribute("bookType");
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
        <td height="22" valign="top" class="word_orange">��ǰλ�ã�ͼ����� &gt; ͼ���������� &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><%
if(coll==null || coll.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">����ͼ��������Ϣ��</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <a href="#" onClick="window.open('bookType_add.jsp','','width=292,height=175')">���ͼ��������Ϣ</a> </td>
  </tr>
</table>
 <%
}else{
  //ͨ��������ʽ��ʾ����
  Iterator it=coll.iterator();
  int ID=0;
  String typename="";
  int days=0;
  %>
 <table width="91%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="82%">&nbsp;      </td>
<td width="18%" align="right">
      <a href="#" onClick="window.open('bookType_add.jsp','','width=292,height=175')">���ͼ��������Ϣ</a> </td>	  
  </tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="35%" bgcolor="#F9D16B">ͼ����������</td>
    <td width="35%" bgcolor="#F9D16B">�ɽ�����</td>
    <td width="16%" bgcolor="#F9D16B">�޸�</td>
    <td width="14%" bgcolor="#F9D16B">ɾ��</td>
  </tr>
<%
  while(it.hasNext()){
    BookTypeForm bookTypeForm=(BookTypeForm)it.next();
	ID=bookTypeForm.getId().intValue();
	typename=bookTypeForm.getTypeName();
	days=bookTypeForm.getDays();
	%> 
  <tr>
    <td style="padding:5px;"><%=typename%></td>
    <td style="padding:5px;"><%=days%></td>
    <td align="center"><a href="#" onClick="window.open('bookType?action=bookTypeModifyQuery&ID=<%=ID%>','','width=292,height=175')">�޸�</a></td>
    <td align="center"><a href="bookType?action=bookTypeDel&ID=<%=ID%>">ɾ��</a></td>
  </tr>
<%
  }
}
%>  
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
