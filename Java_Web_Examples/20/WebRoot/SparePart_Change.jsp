<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<html>
<% request.setCharacterEncoding("gb2312");%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
<title>���������޸�</title>
</head>
<jsp:useBean id="data" scope="session" class="cars.Bean1"></jsp:useBean>
<link rel="stylesheet" href="Css/style.css">
<body topmargin="0" leftmargin="0">
<%!
	String sql;
	int id,i;
	String type;
	String price;
	ResultSet rs;
%>
<% if(request.getParameter("action")!=null){
	id=Integer.parseInt(request.getParameter("id"));
	price=request.getParameter("price");
	sql="update tb_SparePart set Price='"+price+"' where ID="+id;
	i=data.getint(sql);
	if(i>0){
%>
	<script language="javascript">
		alert("����������ӳɹ�");
		window.close();
		opener.location.reload();
	</script>
<%
	}
}
data.close();
%>
<table width="380" height="210" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#A7B5CE" class="table">
  <tr>
    <td valign="top"><table width="360" height="210" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="40" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:160;"> �� �� �� �� �� ��</div></td>
        </tr>
        <form name="orderform" method="post" action="SparePart_Change.jsp?action=add">
          <tr>
            <td valign="top">
			<% sql="select * from tb_SparePart where ID="+Integer.parseInt(request.getParameter("id"));
				rs=data.getrs(sql);
				rs.beforeFirst();
				if(rs.next()){
			%>	
              <table width="360" height="163" border="0" cellpadding="0" cellspacing="0">
                <tr valign="bottom">
                  <td height="30"><div align="right">�� �� �� �ţ�</div></td>
                  <td width="236" height="30"><input name="number" type="text" class="wenbenkuang" size="20" value="<%=rs.getString("Number")%>" readonly="yes"></td>
                </tr><input name="id" type="hidden" value="<%=request.getParameter("id")%>">
                <tr valign="bottom">
                  <td width="124" height="30"><div align="right">�� �� �� �ƣ�</div></td>
                  <td height="30">
                    <input name="name" type="text" class="wenbenkuang" size="20" value="<%=rs.getString("Name")%>" readonly="yes">
                  </td>
                </tr>
                <tr valign="bottom">
                  <td width="124" height="30"><div align="right">ƥ �� �� �ͣ�</div>                    
                    <div align="right"></div></td>
                  <td height="23"><div align="left">
					<input name="type" type="text" class="wenbenkuang" size="20" value="<%=rs.getString("Type")%>" readonly="yes">
                      </div>                    </td>
                </tr>
                <tr valign="bottom">
                  <td height="30"><div align="right">�� �� �� ��</div></td>
                  <td height="30"><input name="price" type="text" class="wenbenkuang" size="15" value="<%=rs.getString("Price")%>">
                    �� Ԫ ��</td>
                </tr>
                <tr valign="bottom">
                  <td height="30" colspan="2">
                    <div align="center">
                      <input name="Submit2" type="submit" class="buttons" value=" �� �� ">
                      <input name="Submit" type="reset" class="buttons" value=" �� �� ">
                      <input name="Submit3" type="button" class="buttons" value=" �� �� " onClick="javascript:window.close()">
                  </div></td>
                </tr>
                <tr valign="bottom">
                  <td height="13" colspan="2">&nbsp;</td>
                </tr>
            </table>
			<%}%>
			</td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
</body>
</html>
