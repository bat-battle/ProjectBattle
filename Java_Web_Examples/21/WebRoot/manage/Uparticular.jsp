<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.db.Condb"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�û��굥</title>
<style type="text/css">
<!--
.style1 {color: #CC9933}
-->
</style>
</head>
<link href="../css/style.css" rel="stylesheet">
<table width="610" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" bgcolor="#FFFFFF" bordercolordark="#D1E2D6" bordercolorlight="#FFFFFF">
  <tr bgcolor="#F7F3EF">
    <td height="26" colspan="8" align="center"><center class="style1">
      <font size="+1" face="����">������Ա�굥</font>
    </center></td>
  </tr>
  <tr>
    <td width="37" height="22" align="center">���</td>
    <td width="95" height="22" align="center">�û���</td>
    <td width="96" height="22" align="center">����</td>
    <td width="56" height="22" align="center">����</td>
    <td width="75" height="22" align="center">ְ��</td>
    <td width="85" height="22" align="center">ְ��</td>
    <td width="85" align="center">����ʱ��</td>
    <td width="58" height="22" align="center">ɾ���Ƿ�</td>
  </tr>
  <%
  int num=0;
  Condb con=new Condb();
  String sql="select * from tb_Person";
  ResultSet rs=con.executeQuery(sql);
  while(rs.next()){
  num++;
  %>
  <tr>
    <td height="22" align="center"><%=num%></td>
    <td height="22" align="center"><%String str=rs.getString(2);out.println(str);%></td>
    <td height="22" align="center"><%=rs.getString(5)%></td>
    <td height="22" align="center"><%=rs.getInt(6)%></td>
    <td height="22" align="center"><%String zw=rs.getString(7);if(zw==null){out.println("&nbsp;");}else{out.println(zw);}%></td>
    <td height="22" align="center"><%String zc=rs.getString(8);if(zc==null){out.println("&nbsp;");}else{out.println(zc);}%></td>
    <td align="center"><%Date dt=rs.getDate(9);if(dt==null){out.println("&nbsp;");}else{out.println(dt);}%></td>
    <td height="22" align="center"><a href="deluser.jsp?temp=<%=str%>">ɾ��</a></td>
  </tr>
  <%
  }
  %>
</table>
</body>
</html>
