<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<html>
<title>��Ʒ�۸����</title>
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<%
   request.setCharacterEncoding("gb2312");//���ַ���ͳһ���������ύ�е�������������
   String spbh="",cd="",spname="",jc="",gg="",bz="",sl="",je="",dj="";
   String jgspname=request.getParameter("jgspname");
   String strSql="select * from tb_kucun ";
   String strSpname="select * from tb_kucun where spname='"+jgspname+"'";
   ResultSet rs=rst.getResult(strSql);
   ResultSet rsSpname=rst.getResult(strSpname);
   if(rsSpname.next()){
     spbh=rsSpname.getString("id"); cd=rsSpname.getString("cd");
     jc=rsSpname.getString("jc");   gg=rsSpname.getString("gg");
     bz=rsSpname.getString("bz");   sl=rsSpname.getString("kcsl");
     je=rsSpname.getString("kcje");   dj=rsSpname.getString("dj");
     spname=rsSpname.getString("spname");
   }
%>
<table width="584" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" colspan="6" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> ��ǰλ�ã�������> </span>�۸���� &gt;&gt;&gt;</td>
  </tr>
  <tr>
    <td><br>
    <table width="550" cellspacing="1" cellpadding="1">
 <form action="modifyPrice1.jsp" method="post" name="form1">
  <tr>
    <td height="25">&nbsp;</td>
    <td><select name="jgspname" onChange="spChange()">
      <option selected>��ѡ������۸����Ʒ����:</option>
      <%while(rs.next()){%>
      <option value=<%=rs.getString("spname")%>><%=rs.getString("spname")%></option>
      <%}%>
    </select></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="54" height="25">&nbsp;</td>
    <td width="228">��Ʒ��ţ�
      <input type="hidden" name="spbh" value="<%=spbh%>"><%=spbh%></td>
    <td width="256">�� &nbsp;&nbsp;&nbsp;�أ�
      <input type="hidden" name="cd" value="<%=cd%>"> <%=cd%></td>
    </tr>
  <tr>
    <td height="25">&nbsp;</td>
    <td>��Ʒ���ƣ�
      <input type="hidden" name="spname" value="<%=spname%>"><%=spname%></td>
    <td>�� &nbsp;&nbsp;&nbsp;�ƣ�
      <input type="hidden" name="jc" value="<%=jc%>"><%=jc%></td>
    </tr>
  <tr>
    <td height="25">&nbsp;</td>
    <td>�� &nbsp;&nbsp;&nbsp;��:
      <input type="hidden" name="gg" value="<%=gg%>"><%=gg%></td>
    <td>�� &nbsp;&nbsp;&nbsp;װ��
      <input type="hidden" name="bz" value="<%=bz%>"><%=bz%></td>
    </tr>
  <tr>
    <td height="25">&nbsp;</td>
    <td>���������
      <input name="kcsl" type="text" size="15" value="<%=sl%>" readonly></td>
    <td>����
      <input type="text" name="kcje" size="15" value="<%=je%>"readonly></td>
    </tr>
  <tr>
    <td height="25">&nbsp;</td>
    <td>�� &nbsp;&nbsp;&nbsp;�ۣ�
      <input type="text" name="dj" size="15" onBlur="autoje()"></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="25">&nbsp;</td>
    <td colspan="2" align="center">
      <input name="Submit1" type="button" class="btn_grey" id="Submit13" onClick="check()" value="ȷ��">
    &nbsp;
    <input name="Submit2" type="reset" class="btn_grey" value="ȡ��"></td>
    </tr>
  </form>
</table>
<form name="form2" action="modifyPrice.jsp" method="POST">
  <input type="hidden" name="hid">
  <input type="hidden" name="hkcje">
  <input type="hidden" name="hdj">
  </form>
</td></tr></table>
</body>
</html>
<script language="JavaScript">
  function spChange(){
    form1.submit();
  }
  function autoje(){
    if(isNaN(form1.dj.value)){
      alert("����������");form1.dj.value=0;form1.dj.focus();return}
    form1.kcje.value=form1.dj.value*form1.kcsl.value;
  }
  function check(){
    form2.hid.value=form1.spbh.value;
    form2.hkcje.value=form1.kcje.value;
    form2.hdj.value=form1.dj.value;    
	if(form1.dj.value==0){
      alert("�����뵥��!");form1.dj.focus();return}
    form2.submit();
  }
</script>

