<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%@ page import="com.bwm.db.Condb"%>
<%@ page import="com.bwm.string.Str"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��������</title>
<style type="text/css">
<!--
.style1 {color: #000000}
-->
</style>
</head>
<link href="../css/style.css" rel="stylesheet">
<body>
  <%
  	Str str=new Str();
	Condb con=new Condb();
	String st=str.toChinese(request.getParameter("temp"));
	String sql="select * from tb_Task where Taskname='"+st+"'";
	ResultSet rs=con.executeQuery(sql);
	while(rs.next()){
%>
<table width="645" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" bgcolor="#FFFFFF" bordercolordark="#D1E2D6" bordercolorlight="#FFFFFF">
  <form action="" method="post" name="form1">
    <tr align="center" bgcolor="#F7F3F7">
      <td height="32" colspan="2"><center class="style1">
        <font face="����" size="+1">���������굥</font>
      </center></td>
    </tr>
    <tr align="left">
      <td width="114" height="26" align="center">�����׼:</td>
      <td width="486" height="26"><font color="#0000CC"><%=rs.getString(1)%></font></td>
    </tr>
    <tr>
      <td height="26" align="center">��������:</td>
      <td height="26"><font color="#0000CC"><%=rs.getString(2)%></font></td>
    </tr>
    <tr>
      <td height="26" align="center">�о�����:</td>
      <td height="26"><font color="#0000CC"><%=rs.getString(3)%></font></td>
    </tr>
    <tr>
      <td height="26" align="center">��������:</td>
      <td height="26"><font color="#0000CC"><%=rs.getString(4)%></font></td>
    </tr>
    <tr>
      <td height="26" align="center">�ɹ���ʽ:</td>
      <td height="26"><font color="#0000CC"><%=rs.getString(5)%></font></td>
    </tr>
    <tr>
      <td height="26" align="center">�о���ʽ:</td>
      <td height="26"><font color="#0000CC"><%=rs.getString(6)%></font></td>
    </tr>
    <tr>
      <td height="26" align="center">������Դ:</td>
      <td height="26"><font color="#0000CC"><%=rs.getString(7)%></font></td>
    </tr>
    <tr>
      <td height="26" align="center">������׼��λ:</td>
      <td height="26"><font color="#0000CC"><%=rs.getString(8)%></font></td>
    </tr>
    <tr>
      <td height="26" align="center">����ʱ��:</td>
      <td height="26"><font color="#0000CC"><%=rs.getDate(9)%></font></td>
    </tr>
    <tr>
      <td height="26" align="center">���ʱ��:</td>
      <td height="26"><font color="#0000CC"><%=rs.getDate(10)%></font></td>
    </tr>
    <tr>
      <td height="26" align="center">����������:</td>
      <td height="26"><font color="#0000CC"><%=rs.getString(11)%></font></td>
    </tr>
    <tr>
      <td height="26" align="center">����ժҪ:</td>
      <td height="26"><font color="#0000CC"><%=rs.getString(12)%></font></td>
    </tr>
    <tr>
      <td height="26" align="center">��ע:</td>
      <td height="26"><font color="#0000CC"><%=rs.getString(13)%></font></td>
    </tr>
  </form>
</table>
<%
  }
  con.close();
%>
</body>
</html>
