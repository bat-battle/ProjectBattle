<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.ReaderDAO" %>
<%@ page import="com.actionForm.ReaderForm" %>
<%@ page import="java.util.*"%>
<%@ page import="com.core.ChStr"%>
<html>
<%
Collection coll=(Collection)request.getAttribute("reader");
ChStr chStr=new ChStr();
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
        <td height="22" valign="top" class="word_orange">��ǰλ�ã����߹��� &gt; ���ߵ������� &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><%
if(coll==null || coll.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">���޶�����Ϣ��</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <a href="reader_add.jsp">��Ӷ�����Ϣ</a> </td>
  </tr>
</table>
 <%
}else{
  //ͨ��������ʽ��ʾ����
  Iterator it=coll.iterator();
  int ID=0;
  String name="";
  String typename="";
  String barcode="";
  String paperType="";
  String paperNO="";
  String tel="";
  String email="";
  %>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="87%">&nbsp;      </td>
<td width="13%">
      <a href="reader_add.jsp">��Ӷ�����Ϣ</a></td>	  
  </tr>
</table>  
  <table width="95%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="13%" bgcolor="#F9D16B">������</td>  
    <td width="10%" bgcolor="#F9D16B">����</td>
    <td width="8%" bgcolor="#F9D16B">��������</td>
    <td width="12%" bgcolor="#F9D16B">֤������</td>
    <td width="20%" bgcolor="#F9D16B">֤������</td>
    <td width="12%" bgcolor="#F9D16B">�绰</td>
    <td width="15%" bgcolor="#F9D16B">Email</td>
    <td width="5%" bgcolor="#F9D16B">�޸�</td>
    <td width="5%" bgcolor="#F9D16B">ɾ��</td>
  </tr>
<%
  while(it.hasNext()){
    ReaderForm readerForm=(ReaderForm)it.next();
	ID=readerForm.getId().intValue();
	name=readerForm.getName();
	barcode=readerForm.getBarcode();
	typename=chStr.nullToString(readerForm.getTypename(),"&nbsp;");
	paperType=readerForm.getPaperType();
	paperNO=chStr.nullToString(readerForm.getPaperNO(),"&nbsp;");
	tel=chStr.nullToString(readerForm.getTel(),"&nbsp;");
	email=chStr.nullToString(readerForm.getEmail(),"&nbsp;");
	%> 
  <tr>
    <td style="padding:5px;"><%=barcode%></td>  
    <td style="padding:5px;"><a href="reader?action=readerDetail&ID=<%=ID%>"><%=name%></a></td>
    <td style="padding:5px;"><%=typename%></td>
    <td align="center"><%=paperType%></td>
    <td align="center"><%=paperNO%></td>
    <td align="center"><%=tel%></td>
    <td align="center"><%=email%></td>
    <td align="center"><a href="reader?action=readerModifyQuery&ID=<%=ID%>">�޸�</a></td>
    <td align="center"><a href="reader?action=readerDel&ID=<%=ID%>">ɾ��</a></td>
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
