<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.BorrowDAO" %>
<%@ page import="com.actionForm.BorrowForm" %>
<%@ page import="com.actionForm.ReaderForm" %>
<%@ page import="java.util.*"%>
<html>
<%
ReaderForm readerForm=(ReaderForm)request.getAttribute("readerinfo");
Collection coll=(Collection)request.getAttribute("borrowinfo");
int borrowNumber=0;
%>
<head>
<title>ͼ��ݹ���ϵͳ</title>
<link href="CSS/style.css" rel="stylesheet">
		<script language="javascript">
		function checkreader(form){
			if(form.barcode.value==""){
				alert("���������������!");form.barcode.focus();return;
			}
			form.submit();
		}
		function checkbook(form){
			if(form.barcode.value==""){
				alert("���������������!");form.barcode.focus();return;
			}		
			if(form.inputkey.value==""){
				alert("�������ѯ�ؼ���!");form.inputkey.focus();return;
			}

			if(form.number.value-form.borrowNumber.value<=0){
				alert("�������ٽ�������ͼ����!");return;
			}
			form.submit();
		}
		</script>
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="100%" height="509"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="27" valign="top" style="padding:5px;" class="word_orange">��ǰλ�ã�ͼ��軹 &gt; ͼ����� &gt;&gt;&gt;</td>
  </tr>
  <tr>
    <td align="center" valign="top" style="padding:5px;"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
	<form name="form1" method="post" action="borrow?action=bookborrow">
      <tr>
        <td height="47" background="Images/borrowBackRenew.gif">&nbsp;</td>
      </tr>
      <tr>
        <td height="72" align="center" valign="top" background="Images/main_booksort_1.gif" bgcolor="#F8BF73"><table width="96%" border="0" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#F8BF73">
          <tr>
            <td valign="top" bgcolor="#F8BF73"><%
int ID=0;
String name="";
String sex="";
String barcode="";
String birthday="";
String paperType="";
String paperNO="";
int number=0;
String typename="";
if(readerForm!=null){
	ID=readerForm.getId().intValue();
	name=readerForm.getName();
	sex=readerForm.getSex();
	barcode=readerForm.getBarcode();
	birthday=readerForm.getBirthday();
	paperType=readerForm.getPaperType();
	paperNO=readerForm.getPaperNO();
	number=readerForm.getNumber();
	typename=readerForm.getTypename();
}
%>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">

				
                  <tr>
                    <td><table width="90%" height="21" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="24%" height="18" style="padding-left:7px;padding-top:7px;"><img src="Images/reader_checkbg.jpg" width="142" height="18"></td>
                          <td width="76%" style="padding-top:7px;">���������룺
                            <input name="barcode" type="text" id="barcode" value="<%=barcode%>" size="24">
                            &nbsp;
                            <input name="Button" type="button" class="btn_grey" value="ȷ��" onClick="checkreader(form1)"></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="13" align="left" style="padding-left:7px;"><hr width="90%" size="1"></td>
                    </tr>
                  <tr>
                    <td align="center"><table width="96%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td height="27">��&nbsp;&nbsp;&nbsp;&nbsp;����
                            <input name="readername" type="text" id="readername" value="<%=name%>"></td>
                          <td>��&nbsp;&nbsp;&nbsp;&nbsp;��
                            <input name="sex" type="text" id="sex" value="<%=sex%>"></td>
                          <td>�������ͣ�
                            <input name="readerType" type="text" id="readerType" value="<%=typename%>"></td>
                        </tr>
                        <tr>
                          <td height="27">֤�����ͣ�
                            <input name="paperType" type="text" id="paperType" value="<%=paperType%>"></td>
                          <td>֤�����룺
                            <input name="paperNo" type="text" id="paperNo" value="<%=paperNO%>"></td>
                          <td>�ɽ�������
                            <input name="number" type="text" id="number" value="<%=number%>" size="17">
                            ��
                            &nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
				 
              </table></td>
          </tr>
               <tr>
                 <td height="32" background="Images/borrow_if.gif">&nbsp;��ӵ����ݣ�
                   <input name="f" type="radio" class="noborder" value="barcode" checked>
                   ͼ�������� &nbsp;&nbsp;
                   <input name="f" type="radio" class="noborder" value="bookname">
ͼ������&nbsp;&nbsp;
<input name="inputkey" type="text" id="inputkey" size="50">
                   <input name="Submit2" type="button" class="btn_grey" value="ȷ��" onClick="checkbook(form1)">
                   <input name="operator" type="hidden" id="operator" value="<%=manager%>">
  <input name="Button" type="button" class="btn_grey" value="��ɽ���" onClick="window.location.href='bookBorrow.jsp'">
                   </td>
               </tr> 
          <tr>
            <td valign="top" bgcolor="#FCEC9A" style="padding:5px"><table width="99%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#F6B83B" bgcolor="#FFFFFF">
                   <tr align="center" bgcolor="#F9D16B">
                     <td width="29%" height="25">ͼ������</td>
                     <td width="12%">����ʱ��</td>
                     <td width="14%">Ӧ��ʱ��</td>
                     <td width="17%">������</td>
                     <td width="14%">���</td>
                     <td colspan="2">����(Ԫ)</td>
                   </tr>
<%
String bookname="";
String borrowTime="";
String backTime="";
Float price=new Float(0);
String pubname="";
String bookcase="";
if(coll!=null && !coll.isEmpty()){
	borrowNumber=coll.size();
	Iterator it=coll.iterator();
	while(it.hasNext()){
	BorrowForm borrowForm=(BorrowForm)it.next();
	bookname=borrowForm.getBookName();
	borrowTime=borrowForm.getBorrowTime();
	backTime=borrowForm.getBackTime();
	price=borrowForm.getPrice();
	pubname=borrowForm.getPubName();
	bookcase=borrowForm.getBookcaseName();
%>
                   <tr>
                     <td height="25" style="padding:5px;">&nbsp;<%=bookname%></td>
                     <td style="padding:5px;">&nbsp;<%=borrowTime%></td>
                     <td style="padding:5px;">&nbsp;<%=backTime%></td>
                     <td align="center">&nbsp;<%=pubname%></td>
                     <td align="center">&nbsp;<%=bookcase%></td>
                     <td width="14%" align="center">&nbsp;<%=price%></td>
                   </tr>
<%	}
}%>
 <input name="borrowNumber" type="hidden" id="borrowNumber" value="<%=borrowNumber%>">
                 </table>
			</td>
          </tr>
		 
        </table></td>
		 
      </tr>
      <tr>
        <td height="19" background="Images/main_booksort_2.gif">&nbsp;</td>
      </tr>
	 </form>
    </table></td>
  </tr>
</table>
    <%@ include file="copyright.jsp"%></td>
  </tr>
</table>
</body>
</html>