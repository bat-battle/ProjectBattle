<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.BorrowDAO" %>
<%@ page import="com.actionForm.BorrowForm" %>
<%@ page import="java.util.*"%>
<html>
<%
Collection coll=(Collection)request.getAttribute("borrowQuery");
%>
<head>
<title>ͼ��ݹ���ϵͳ</title>
<link href="CSS/style.css" rel="stylesheet">
<script src="JS/function.js"></script>
<script language="javascript">
function check(myform){
	if(myform.flag[0].checked==false && myform.flag[1].checked==false){
		alert("��ѡ���ѯ��ʽ!");return false;
	}
	if (myform.flag[1].checked){
		if(myform.sdate.value==""){
			alert("�����뿪ʼ����");myform.sdate.focus();return false;
		}		
		if(CheckDate(myform.sdate.value)){
			alert("������Ŀ�ʼ���ڲ���ȷ���磺2011-02-14��\n ��ע������!");myform.sDate.focus();return false;
		}
		if(myform.edate.value==""){
			alert("�������������");myform.edate.focus();return false;
		}		
		if(CheckDate(myform.edate.value)){
			alert("������Ľ������ڲ���ȷ���磺2011-02-14��\n ��ע������!");myform.edate.focus();return false;
		}
	}
}
</script>
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
        <td height="22" valign="top" class="word_orange">��ǰλ�ã�ϵͳ��ѯ &gt; ͼ����Ĳ�ѯ &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
		<form name="myform" method="post" action="borrow?action=borrowQuery">
          <table width="98%" height="67"  border="0" cellpadding="0" cellspacing="0" bgcolor="#E3F4F7" class="tableBorder_gray">
            <tr>
              <td rowspan="2" align="center" bgcolor="#F9D16B">&nbsp;<img src="Images/search.gif" width="45" height="28"></td>
              <td height="29" bgcolor="#F9D16B"><input name="flag" type="checkbox" class="noborder" value="a" checked>
                ��ѡ���ѯ���ݣ�
                <select name="f" class="wenbenkuang" id="f">
                  <option value="barcode">ͼ��������</option>
                  <option value="bookname">ͼ������</option>
                  <option value="readerbarcode">����������</option>
                  <option value="readername">��������</option>
                  </select>
                  <input name="key" type="text" id="key" size="50">
                  <input name="Submit" type="submit" class="btn_grey" value="��ѯ" onClick="return check(myform)"></td>
            </tr>
            <tr>
              <td height="26" bgcolor="#F9D16B">
                <input name="flag" type="checkbox" class="noborder" value="b">
                ����ʱ�䣺                ��
                <input name="sdate" type="text" id="sdate">
                ��
                <input name="edate" type="text" id="edate">
                (���ڸ�ʽΪ��2011-02-14)</td>
            </tr>
          </table>		
		</form>
		<%
if(coll==null || coll.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">����ͼ�������Ϣ��</td>
            </tr>
          </table>
          <%
}else{
  //ͨ��������ʽ��ʾ����
  Iterator it=coll.iterator();
  String bookname="";
  String bookbarcode="";
  String readerbar="";
  String readername="";
  String borrowTime="";
  String backTime="";
  int ifback=0;
  String ifbackstr="";
  %>
          <table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="11%" bgcolor="#F9D16B">ͼ��������</td>
    <td width="29%" bgcolor="#F9D16B">ͼ������</td>
    <td width="15%" bgcolor="#F9D16B">����������</td>
    <td width="13%" bgcolor="#F9D16B">��������</td>
    <td width="12%" bgcolor="#F9D16B">����ʱ��</td>
    <td width="12%" bgcolor="#F9D16B">Ӧ��ʱ��</td>
    <td width="8%" bgcolor="#F9D16B">�Ƿ�黹</td>
  </tr>
<%
  while(it.hasNext()){
    BorrowForm borrowForm=(BorrowForm)it.next();
	bookname=borrowForm.getBookName();
	bookbarcode=borrowForm.getBookBarcode();
	readerbar=borrowForm.getReaderBarcode();
	readername=borrowForm.getReaderName();
	borrowTime=borrowForm.getBorrowTime();
	backTime=borrowForm.getBackTime();
	ifback=borrowForm.getIfBack();
	if(ifback==0){
		ifbackstr="δ�黹";
	}else{
		ifbackstr="�ѹ黹";
	}
	%>
  <tr>
    <td style="padding:5px;">&nbsp;<%=bookbarcode%></td>
    <td style="padding:5px;"><%=bookname%></td>
    <td style="padding:5px;">&nbsp;<%=readerbar%></td>
    <td style="padding:5px;">&nbsp;<%=readername%></td>
    <td style="padding:5px;">&nbsp;<%=borrowTime%></td>
    <td style="padding:5px;">&nbsp;<%=backTime%></td>
    <td align="center" style="padding:5px;">&nbsp;<%=ifbackstr%></td>
  </tr>
<%
  }
}
%>
</table>
          </td>
      </tr>
    </table>
</td>
  </tr>
</table><%@ include file="copyright.jsp"%></td>
  </tr>
</table>
</body>
</html>
