<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.string.Str"%>
<%@ page import="com.bwm.db.Condb"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����굥</title>
<style type="text/css">
<!--
.style1 {color: #CC9933}
-->
</style>
</head>
<script language="javascript">
function check(){
form1.submit();
}
</script>
<link href="../css/style.css" rel="stylesheet">
<body>
<%
	Condb con=new Condb();
	Str str1=new Str();
	String temp=str1.toChinese(request.getParameter("temp"));
	String sql="select * from tb_Task where Taskname='"+temp+"'";
	ResultSet rs=con.executeQuery(sql);
	if(rs.next()){
%>
<table width="610" height="409" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#0000CC" bgcolor="#FFFFFF" class="tableBorder">
  <form action="Tcheck.jsp" method="post" name="form1">
    <tr align="center" bgcolor="#F7F3EF">
      <td height="26" colspan="3"><center class="style1">
        <font face="����" size="+1">�������굥</font>
      </center></td>
    </tr>
    <tr align="left">
      <td height="23">&nbsp;</td>
      <td height="23">�����׼:</td>
      <td width="460" height="23"><font color="#0000CC"><%=rs.getString(1)%></font></td>
    </tr>
    <tr>
      <td width="49" height="23">&nbsp;</td>
      <td width="91" height="23">��������:</td>
      <td height="23"><font color="#0000CC"><%String str=rs.getString(2);out.println(str);%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">�о�����:</td>
      <td height="23"><font color="#0000CC"><%=rs.getString(3)%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">��������:</td>
      <td height="23"><font color="#0000CC"><%=rs.getString(4)%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">�ɹ���ʽ:</td>
      <td height="23"><font color="#0000CC"><%=rs.getString(5)%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">�о���ʽ:</td>
      <td height="23"><font color="#0000CC"><%=rs.getString(6)%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">������Դ:</td>
      <td height="23"><font color="#0000CC"><%=rs.getString(7)%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">������׼��λ:</td>
      <td height="23"><font color="#0000CC"><%=rs.getString(8)%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">����ʱ��:</td>
      <td height="23"><font color="#0000CC"><%=rs.getDate(9)%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">���ʱ��:</td>
      <td height="23"><font color="#0000CC"><%=rs.getDate(10)%></font></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td height="23">����������:</td>
      <td height="23"><font color="#0000CC"><%=rs.getString(11)%></font></td>
    </tr>
    <tr>
      <td height="40">&nbsp;</td>
      <td height="40">����ժҪ:</td>
      <td height="40"><font color="#0000CC"><%=rs.getString(12)%></font></td>
    </tr>
    <tr>
      <td height="30">&nbsp;</td>
      <td height="30">��ע:</td>
      <td height="30"><font color="#0000CC"><%=rs.getString(13)%></font></td>
    </tr>
    <tr>
      <td height="30">&nbsp;</td>
      <td height="30">�Ƿ����:</td>
      <td height="30"><input type="checkbox" name="choose" 
	  <%
		int pat=rs.getInt(14);
		if(pat==1)
		out.println("checked");%>
	 	onClick="check()">
        <input name="Numbic" type="hidden" value="<%=str%>">
��/��</td>
    </tr>
    <tr align="center">
      <td height="30" colspan="3" bgcolor="#F7F3EF"><a href="lacktask.jsp">����</a> </td>
    </tr>
  </form>
</table>
  <%
}
	con.close();
%>
</body>
</html>
