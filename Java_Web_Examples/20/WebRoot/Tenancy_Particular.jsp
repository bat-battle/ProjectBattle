<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>�����������ۼ�����վ���߶���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<link rel="stylesheet" href="Css/style.css">
<%!
 String sql;
 ResultSet rs;
 int i;
 %>
 <%
 if(request.getParameter("Submit")!=null){
	sql="delete tb_Tenancy where ID="+request.getParameter("id");
	int j=data.getint(sql);
	data.close();
%>
<script language="javascript">
	alert("��������ɾ���ɹ�");
	opener.location.reload();
	window.close();
</script>
<%
}
%>
 <%
 if(request.getParameter("Submit2")!=null){
	sql="update tb_Tenancy set Whether='����' where ID="+request.getParameter("id");
	int j=data.getint(sql);
	data.close();
%>
<script language="javascript">
	alert("������������ɹ�");
	opener.location.reload();
	window.close();
</script>
<%
}
%>
<%
sql="select * from tb_Tenancy where ID="+request.getParameter("id");
rs=data.getrs(sql);
rs.beforeFirst();
if(rs!=null&&rs.next()){
%>
<body leftmargin="0" topmargin="0">
<table width="472" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#EAEAEA" class="table">
  <form name="form2" method="post" action="Tenancy_Particular.jsp">
    <tr>
      <td height="40" colspan="4" align="center"><div align="center" class="bottm" style="font-size: 18px;font-weight: bold;color: #FF0000;width:180; ">�� �� �� �� �� ��</div></td>
    </tr>
    <tr>
      <td height="10" colspan="4"><input type="hidden" name="id" value="<%=request.getParameter("id")%>"></td>
    </tr>
    <tr>
      <td width="145" height="27"><div align="right">��ϵ�ˣ�</div></td>
      <td height="27" colspan="3">&nbsp;<%=rs.getString("UserName")%></td>
    </tr>
    <tr>
      <td height="27"><div align="right">��ϵ�绰��</div></td>
      <td height="27" colspan="3">&nbsp;<%=rs.getString("Phone")%></td>
    </tr>
    <tr>
      <td height="27"><div align="right">�ֻ����룺</div></td>
      <td height="27" colspan="3">&nbsp;<%=rs.getString("Hander")%></td>
    </tr>
    <tr>
      <td height="27"><div align="right">���棺</div></td>
      <td height="27" colspan="3">&nbsp;<%=rs.getString("Fax")%></td>
    </tr>
    <tr>
      <td height="27"><div align="right">E-mail��</div></td>
      <td height="27" colspan="3">&nbsp;<%=rs.getString("Email")%></td>
    </tr>
    <tr>
      <td height="27"><div align="right">��ϵ��ַ��</div></td>
      <td height="27" colspan="3">&nbsp;<%=rs.getString("Address")%></td>
    </tr>
    <tr>
      <td height="27"><div align="right">���֤���룺</div></td>
      <td height="27" colspan="3">&nbsp;<%=rs.getString("Numbers")%></td>
    </tr>
    <tr>
      <td height="27"><div align="right">�⳵���ͣ�</div></td>
      <td height="27" colspan="3">&nbsp; <%=rs.getString("CarsName")%>       </td>
    </tr>
    <tr>
      <td height="27"><div align="right">�⳵ʱ�䣺</div></td>
      <td height="27" colspan="3"> <%=rs.getDate("StartTime")%> �� <%=rs.getDate("EndTime")%></td>
    </tr>
    <tr>
      <td height="15">&nbsp;</td>
      <td width="179" height="15">&nbsp;</td>
      <td width="140" height="15">&nbsp;</td>
      <td width="6" height="15">&nbsp;</td>
    </tr>
    <tr valign="top">
      <td height="40" colspan="4"><div align="center">
          <input name="Submit2" type="submit" class="buttons" value="  ��  ��  ">
          <input name="Submit" type="submit" class="buttons" value="  ɾ  ��  ">
          <input name="Submit3" type="button" class="buttons" value="  ��  ��  " onClick="javascript:window.close()">
      </div></td>
    </tr>
  </form>
</table>
</body>
<%}%>
</html>
