<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<html>
<title>��Ʒ��Ϣ�Ǽ�</title>
<meta http-equiv="Content-Type" content="text/html">
</head>
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<%
   String strSql="select * from tb_supplier";
   ResultSet rs=rst.getResult(strSql);
%>
<table width="584" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> ��ǰλ�ã�������Ϣ���� > </span>��Ʒ��Ϣ���� &gt;&gt;&gt;</td>
  </tr>
  <tr><td><br>
<form name="form1" method="post" action="spinfo.jsp" > 
  <table width="100%" height="117"  border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#F2F2F2">
        <tr><td height="27" colspan="4">&nbsp;ע:��*��Ϊ������</td></tr>
        <tr>
          <td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��Ʒ���ƣ�</td><td width="142"><input type="text" name="spname">*</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ƣ�</td><td width="156"><input type="text" name="jc"></td></tr>
        <tr>
          <td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���أ�</td><td><input type="text" name="cd">*</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ţ�</td><td><input type="text" name="ph"></td></tr>
        <tr>
          <td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���</td><td><input type="text" name="gg">*</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��װ��</td><td><input type="text" name="bz"></td></tr>
        <tr>
          <td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������λ��</td><td><input type="text" name="dw">*</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��׼�ĺţ�</td><td><input type="text" name="pzwh"></td></tr>
        <tr>
          <td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��Ӧ��ȫ�ƣ�</td>
            <td><select name="gysname">
                 <%while(rs.next()){%>
                      <option> <%=rs.getString("gysname")%> </option>
                 <%}%>
        </select></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ע��</td><td><input type="text" name="memo"></td></tr>
    <tr>
        <td height="27" colspan="4" align="center"><input name="submit1" type="button" class="btn_grey" onClick="check()" value="������Ϣ">          &nbsp;
          <input  name="reset" type="reset" class="btn_grey" value="�������"></td></tr>
   </table>
 </form>
 </td></tr></table>
</body>
</html>
<script language="javascript">
function check()
{
  if(form1.spname.value==0){
    alert("��������Ʒ����");form1.spname.focus();return;}
  if(form1.cd.value==0){
    alert("��������Ʒ����");form1.cd.focus();return;}
  if(form1.dw.value==0){
    alert("�����������λ");form1.dw.focus();return;}
  if(form1.gg.value==0){
    alert("��������Ʒ���");form1.gg.focus();return;}
  form1.submit();
}
</script>
