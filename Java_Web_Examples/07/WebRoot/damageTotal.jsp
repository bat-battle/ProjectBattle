<%@page contentType="text/html; charset=gb2312" language="java"%>
<%@page import="com.actionForm.GetUseForm"%>
<%@page import="com.actionForm.BranchForm"%>
<%@page import="com.actionForm.GoodsForm"%>
<%@page import="com.core.GetTime"%>
<%@page import="java.util.*"%>
<script language="javascript">
function check(myform){
	if(myform.flag[0].checked==false && myform.flag[1].checked==false && myform.flag[2].checked==false){
		alert("��ѡ���ѯ��ʽ!");return false;
	}
	if (myform.flag[1].checked){
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
            ���ű������
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
		<form name="myform" method="post" action="ifDeal.do?action=damageTotal">
          <table width="98%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#E3F4F7" class="tableBorder">
            <tr>
              <td rowspan="2" align="center">&nbsp;<img src="images/search.gif" width="45" height="28"></td>
              <td height="14"><div><input name="flag" type="checkbox" class="noborder" value="a" checked>
                ��ѡ��ͳ�����ݣ�
                  <select name="f" class="wenbenkuang" id="f">
                    <option value="g.name">��������</option>
                    <option value="b.name">��������</option>
                   </select>
                  <input name="key" type="text" id="key" size="50">
                  &nbsp;
                  <input name="Submit" type="submit" class="btn_grey" value="ͳ��" onClick="return check(myform)">
              </div></td>
            </tr>
            <tr>
              <td><input name="flag" type="checkbox" class="noborder" id="flag" value="b">
ͳ��ʱ�䣺                ��
  <input name="sdate" type="text" id="sdate">
��
<input name="edate" type="text" id="edate">
(���ڸ�ʽΪ��2011-07-05)              </td>
            </tr>
          </table>
		</form>
<%
List list=(List)request.getAttribute("damageTotal");
System.out.println("LIST SIZE:"+list.size());
if(list.size()==0){
%>
          <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
            <tr>
              <td height="36" align="center">û�з��������Ĳ��ű�����Ϣ��</td>
            </tr>
          </table>
          <%
}else{
	String goodsname="";
	String spec="";
	String producer="";
	String branchname="";
	String unit="";
	float price=0.0f;
	int amount=0;
  %>
          <table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="17%">����</td>
    <td width="25%">��������[���]</td>
	<td width="26%">��������</td>
    <td width="4%">��λ</td>
    <td width="9%">����</td>
    <td width="8%">��������</td>
    <td width="11%">������</td>
  </tr>
<%
for(int i=0;i<list.size();i++){
	Object obj[]=(Object[])list.get(i);
	//GoodsForm goodsF=(GoodsForm)obj[0];
	//BranchTotalForm branchTotalForm=(BranchTotalForm)list.get(i);
	amount=Integer.parseInt(obj[0].toString());
	branchname=obj[1].toString();
	goodsname=obj[2].toString();
	spec=obj[3].toString();
	price=Float.parseFloat(obj[4].toString());
	unit=obj[5].toString();
	producer=obj[6].toString();
%>
  <tr>
    <td style="padding:5px;"><%=branchname%></td>
    <td style="padding:5px;"><%=goodsname%>[<%=spec%>]</td>
	<td align="center" style="padding:5px;"><%=producer%></td>
    <td align="center" style="padding:5px;"><%=unit%></td>
    <td align="center" style="padding:5px;"><%=price%></td>
    <td align="center" style="padding:5px;"><%=amount%></td>
    <td style="padding:5px;"><%=price*amount%></td>
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

