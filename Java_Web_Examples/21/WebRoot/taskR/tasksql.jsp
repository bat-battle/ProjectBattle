<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.db.Condb"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����ѯ</title>
<style type="text/css">
<!--
.style2 {color: #CC9933}
-->
</style>
</head>
<link href="../css/style.css" rel="stylesheet">
<body>
<table width="610" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" bordercolordark="#D1E2D6" bordercolorlight="#FFFFFF" bgcolor="#FFFFFF">
  <form action="" method="post" name="form1">
    <tr align="center" bgcolor="#0066CC">
      <td height="26" colspan="16" bgcolor="#F7F3EF"><center class="style2">
        <font size="+1" face="����">��ʾ����Ĳ�ѯ���</font>
      </center></td>
    </tr>
    <tr>
      <td width="29" height="25" align="center"><span class="head">���</span></td>
      <td width="61" align="center"><span class="head">������ʽ</span></td>
      <td width="198" align="center"><span class="head">��������</span></td>
      <td width="64" align="center"><span class="head">��������</span></td>
      <td width="169" align="center"><span class="head">������׼��λ</span></td>
      <td width="75" height="25" colspan="11" align="center"><span class="head">�Ƿ����</span></td>
    </tr>
    <%
	Condb con=new Condb();
	String datetime=request.getParameter("datetime");
	String dattime=request.getParameter("dattime");
	String resultname=request.getParameter("resultname");
	String sql="select * from tb_Task where Taskname='"+resultname+"'";
	ResultSet rs=con.executeQuery(sql);
	int num=0;
	while(rs.next()){
	num++;
%>
    <tr>
      <td height="20" align="center"><%=num%></td>
      <td align="center"><%=rs.getString(1)%></td>
      <td align="center"><%=rs.getString(2)%></td>
      <td align="center"><%=rs.getString(4)%></td>
      <td align="center"><%=rs.getString(8)%></td>
      <td height="20" colspan="11" align="center"><%int str=rs.getInt(14);if(str==0) out.println("��");if(str==1) out.println("��");%></td>
    </tr>
    <tr bgcolor="#F7F3EF">
      <td height="21" colspan="17" align="center" bgcolor="#F7F3EF"><a href="rquery.htm">����</a></td>
    </tr>
    <%
}
con.close();
%>
</form>
</table>
<center>
</center>
</body>
</html>
