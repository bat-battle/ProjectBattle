<%@page contentType="text/html; charset=gb2312" language="java"%>
<%@page import="com.actionForm.DamageForm"%>
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
            ���ű����ѯ
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
		<form name="myform" method="post" action="ifDeal.do?action=damageQuery">
          <table width="98%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#E3F4F7" class="tableBorder">
            <tr>
              <td rowspan="2" align="center">&nbsp;<img src="images/search.gif" width="45" height="28"></td>
              <td height="14"><div><input name="flag" type="checkbox" class="noborder" value="a" checked>
                ��ѡ���ѯ���ݣ�
                  <select name="f" class="wenbenkuang" id="f">
                    <option value="goods.name">��������</option>
                    <option value="damage.username">����Ա</option>
                    <option value="damage.principal">������</option>
                    <option value="branch.name">��������</option>
                   </select>
                  <input name="key" type="text" id="key" size="50">
                  <input name="Submit" type="submit" class="btn_grey" value="��ѯ" onClick="return check(myform)"></div></td>
            </tr>
            <tr>
              <td><input name="flag" type="checkbox" class="noborder" id="flag" value="b">
����ʱ�䣺                ��
  <input name="sdate" type="text" id="sdate">
��
<input name="edate" type="text" id="edate">
(���ڸ�ʽΪ��2011-07-05)
</td>
            </tr>
          </table>
		</form>
<%
List list=(List)request.getAttribute("damageQuery");
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
        String username="";
	String createtime="";
	String branchname="";
	String spec="";
	String principal="";
	String cause="";
	int damagenum=0;
	String unit="";
  %>
          <table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="20%">��������</td>
    <td width="8%">���</td>
    <td width="10%">����</td>
    <td width="8%">����</td>
    <td width="20%">����ʱ��</td>
    <td width="7%">������</td>
    <td width="7%">����Ա</td>
    <td width="20%">ԭ��</td>
  </tr>
<%
for(int i=0;i<list.size();i++){
	Object obj[]=(Object[])list.get(i);
	GoodsForm goodsF=(GoodsForm)obj[0];
	DamageForm damageF=(DamageForm)obj[1];
	BranchForm branchF=(BranchForm)obj[2];
	goodsname=goodsF.getName();
        spec=goodsF.getSpec();
        branchname=branchF.getName();
	unit=goodsF.getUnit();
	GetTime getTime=new GetTime();
	createtime=getTime.formatTime(damageF.getCreatetime());
	username=damageF.getUsername();
	cause=damageF.getCause();
	principal=damageF.getPrincipal();
	damagenum=damageF.getDamagenum();
%>
  <tr>
    <td style="padding:5px;">&nbsp;<%=goodsname%></td>
    <td style="padding:5px;">&nbsp;<%=spec%></td>
    <td style="padding:5px;">&nbsp;<%=damagenum%>(<%=unit%>)</td>
    <td style="padding:5px;">&nbsp;<%=branchname%></td>
    <td style="padding:5px;">&nbsp;<%=createtime%></td>
    <td align="center" style="padding:5px;">&nbsp;<%=principal%></td>
    <td align="center" style="padding:5px;"><%=username%></td>
    <td style="padding:5px;">&nbsp;<%=cause%></td>
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

