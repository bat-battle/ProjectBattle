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
	sql="delete tb_OrderForm where ID="+request.getParameter("id");
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
	sql="update tb_OrderForm set Whether='����' where ID="+request.getParameter("id");
	int j=data.getint(sql);
	data.close();
%>
<script language="javascript">
	alert("��������ɹ�");
	opener.location.reload();
	window.close();
</script>
<%
}
%>
<%
sql="select * from tb_OrderForm where ID="+request.getParameter("id");
rs=data.getrs(sql);
rs.beforeFirst();
if(rs!=null&&rs.next()){
%>
<body leftmargin="0" topmargin="0">
<table width="500" height="560" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#A7B5CE" class="table">
  <tr>
    <td valign="top"><table width="480" height="500" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="40" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:180;">�� �� �� �� �� ��</div></td>
        </tr><form name="orderform" method="post" action="OrderForm_Particular.jsp">
      <tr>
        <td valign="top">
		<table width="480" height="510" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30"><div align="right">�������ͣ�</div></td>
            <td height="30" colspan="3"><input type="hidden" name="id" value="<%=request.getParameter("id")%>">
              <%=rs.getString("Name")%></td>
            </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">����������</div></td>
            <td width="152" height="30"><%=rs.getInt("Counts")%> </td>
            <td width="80" height="30"><div align="right">���ʽ��</div></td>
            <td width="158" height="30"><%=rs.getString("Payment")%>
            </td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">��ѡ��ɫ��</div></td>
            <td height="30" colspan="3"><div align="left"><%=rs.getString("Color")%>
                </div></td>
            </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">��˾���ƣ�</div></td>
            <td height="30" colspan="3">              <div align="left"><%=rs.getString("EnterpriseName")%></div></td></tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">��ϸ��ַ��</div></td>
            <td height="30" colspan="3">              <div align="left"><%=rs.getString("Address")%></div></td></tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">���ڵ�����</div></td>
            <td height="30" colspan="3"><div align="right">
              <table width="380" height="30" border="0" align="left" cellpadding="0" cellspacing="0">
                <tr valign="bottom">
                  <td> <%=rs.getString("Omit")%>ʡ  <%=rs.getString("City")%>�� <%=rs.getString("Area")%> ��</td>
                  </tr>
              </table>
            </div></td>
            </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">���������ƣ�</div></td>
            <td height="30" colspan="3"><div align="right">
              <table width="380" height="30" border="0" align="left" cellpadding="0" cellspacing="0">
                <tr valign="bottom">
                  <td>&nbsp;<%=rs.getString("Dealer")%>
      </td>
                  </tr>
              </table>
            </div></td>
            </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">��ϵ�ˣ�</div></td>
            <td height="30">&nbsp;<%=rs.getString("Linkman")%></td>
            <td height="30"><div align="right">��ϵ�绰��</div></td>
            <td height="30">&nbsp;<%=rs.getString("Phone")%></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">���棺</div></td>
            <td height="30">&nbsp;<%=rs.getString("Fax")%></td>
            <td height="30"><div align="right">E-mail��</div></td>
            <td height="30">&nbsp;<%=rs.getString("Email")%></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">�������룺</div></td>
            <td height="30"><%=rs.getString("PhoneNumber")%>&nbsp;</td>
            <td height="30">&nbsp;</td>
            <td height="30">&nbsp;</td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">��ע��Ϣ��</div></td>
            <td height="90" colspan="3" rowspan="3">
              <textarea name="remark" cols="60" rows="5" class="wenbenkuang" id="remark" readonly><%=rs.getString("Remark")%></textarea>            </td>
            </tr>
          <tr valign="bottom">
            <td height="30">&nbsp;</td>
            </tr>
          <tr valign="bottom">
            <td height="30">&nbsp;</td>
            </tr>
          <tr valign="bottom">
            <td height="30" colspan="4">
              <div align="center">
                <input name="Submit2" type="submit" class="buttons" value="  ��  ��  ">
                <input name="Submit" type="submit" class="buttons" value="  ɾ  ��  ">
                  <input name="Submit3" type="button" class="buttons" value="  ��  ��  " onClick="javascript:window.close()">
              </div></td>
            </tr>
          <tr valign="bottom">
            <td height="30" colspan="4"><div align="center" style="color: #FF0000 ">����ʡ�����л����������ۼ��Ź�˾ 24Сʱ�ͻ��������ߣ�xxxx-xxxxxxx</div></td>
          </tr>
        </table></td>
      </tr></form>
    </table></td>
  </tr>
</table>
</body>
<%}%>
</html>
