<%@page contentType="text/html; charset=gb2312" language="java"%>
<%@page import="com.actionForm.GetUseForm"%>
<%@page import="com.actionForm.BranchForm"%>
<%@page import="com.actionForm.GoodsForm"%>
<%@page import="com.core.GetTime"%>
<%@page import="java.util.*"%>
<script language="javascript">
function check(myform){
		if(myform.sdate.value==""){
			alert("�����뿪ʼ����");myform.sdate.focus();return false;
		}
		if(CheckDate(myform.sdate.value)){
			alert("������Ŀ�ʼ���ڲ���ȷ��\n ��ע�����ڸ�ʽ�����꣡");myform.sdate.focus();return false;
		}
		if(myform.edate.value==""){
			alert("�������������");myform.edate.focus();return false;
		}
		if(CheckDate(myform.edate.value)){
			alert("������Ľ������ڲ���ȷ��\n ��ע�����ڸ�ʽ�����꣡");myform.edate.focus();return false;
		}
}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title>���ʹ���ϵͳ</title>
<link rel="stylesheet" href="Css/style.css">
<script src="JS/function.js"></script>
</head>
<body>
<table width="757" height="174" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="133" align="center" valign="top"><%@include file="top.jsp"%>
    </td>
  </tr>
  <tr>
    <td><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" background="images/area_bg.jpg">
        <tr>
          <td width="26%" align="center" class='word_white'>��ǰ��¼�û���<%=session.getAttribute("username")%></td>
          <td width="4%">&nbsp;</td>
          <td width="70%" valign="bottom"> ��ǰλ�ã���ѯͳ��
            &gt;
            ���Ż���
            &gt;&gt;&gt; </td>
        </tr>
      </table>
      <table width="100%" height="385" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td width="5" valign="top" background="images/left.gif">&nbsp;</td>
          <td align="center" valign="top">&nbsp;
<table width="96%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center" valign="top">
		<form name="myform" method="post" action="ifDeal.do?action=branchTotal">
          <table width="98%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#E3F4F7" class="tableBorder">
            <tr>
              <td align="center">&nbsp;<img src="images/search.gif" width="45" height="28"></td>
              <td><input name="flag" type="checkbox" id="flag" value="b" checked style="display:none">
ͳ��ʱ�䣺                ��
  <input name="sdate" type="text" id="sdate">
��
<input name="edate" type="text" id="edate">
(���ڸ�ʽΪ��2011-07-05)
<input name="Submit" type="submit" class="btn_grey" value="ͳ��" onClick="return check(myform)"></td>
            </tr>
          </table>
		</form>
<%
List list=(List)request.getAttribute("branchTotal");
System.out.println("LIST SIZE:"+list.size());
if(list.size()==0){
%>
          <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
            <tr>
              <td height="36" align="center">û�з��������Ĳ���������Ϣ��</td>
            </tr>
          </table>
          <%
}else{
	String sDate=(String)request.getAttribute("sDate");
	String eDate=(String)request.getAttribute("eDate");
	String message="";
	if(sDate==null || sDate.equals("")){
		message="ȫ�����Ż�����Ϣ";
	}else{
		message="��"+sDate+"��"+eDate+"֮��Ĳ��Ż�����Ϣ";
	}
	String goodsname="";
	String spec="";
        String unit="";
        float price=0.0f;
	String branchname="";
	int lyamount=0;
	int bsamount=0;
	int zyamount=0;
  %>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center"><%=message%></td>
            </tr>
          </table>
          <table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="12%">����</td>
    <td width="27%">��������[���]</td>
    <td width="4%">��λ</td>
    <td width="7%">����</td>
    <td width="8%">��������</td>
    <td width="9%">���ý��</td>
    <td width="9%">��������</td>
    <td width="8%">������</td>
    <td width="8%">��������</td>
    <td width="8%">���ý��</td>
  </tr>
<%
for(int i=0;i<list.size();i++){
	Object obj[]=(Object[])list.get(i);
	goodsname=obj[0].toString();
	spec=obj[1].toString();
        unit=obj[2].toString();
        price=Float.parseFloat(obj[3].toString());
	branchname=obj[4].toString();
	lyamount=Integer.parseInt(obj[5].toString());
	bsamount=Integer.parseInt(obj[6].toString());
	zyamount=Integer.parseInt(obj[7].toString());
%>
  <tr>
    <td style="padding:5px;"><%=branchname%></td>
    <td style="padding:5px;"><%=goodsname%>[<%=spec%>]</td>
    <td align="center" style="padding:5px;"><%=unit%></td>
    <td align="center" style="padding:5px;"><%=price%></td>
    <td align="center" style="padding:5px;"><%=lyamount%></td>
    <td style="padding:5px;"><%=price*lyamount%></td>
    <td style="padding:5px;"><%=bsamount%></td>
    <td style="padding:5px;"><%=price*bsamount%></td>
    <td style="padding:5px;"><%=zyamount%></td>
    <td style="padding:5px;"><%=price*zyamount%></td>
  </tr>
<%}%>
</table>
<%}%>
          </td>
      </tr>
    </table>

          </td>
          <td width="10" valign="top" background="images/right.jpg">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="55" valign="top" background="images/bottom.jpg"><%@include file="copyright.jsp"%>
    </td>
  </tr>
</table>
</body>
</html>

