<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<html>
<% request.setCharacterEncoding("gb2312");%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
<title>��ҵ��ϸ��Ϣ</title>
</head>
<jsp:useBean id="data" scope="session" class="cars.Bean1"></jsp:useBean>
<link rel="stylesheet" href="Css/style.css">
<body topmargin="0" leftmargin="0">
<%!
	String sql;
	int i;
	ResultSet rs;
	String id,name,address,phone,type,picture;
%>
<%
if(request.getParameter("id")!=null){
sql="select * from tb_Enterprise where ID="+Integer.parseInt(request.getParameter("id"));
rs=data.getrs(sql);
}
%>
<table width="380" height="235" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#A7B5CE" class="table">
  <tr>
    <td valign="top"><table width="360" height="235" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="40" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:160;"> �� ҵ �� ϸ �� ��</div></td>
        </tr>
          <tr>
            <td valign="top">
              <table width="360" height="180" border="0" cellpadding="0" cellspacing="0">
                <tr valign="bottom">
                  <td height="35"><div align="right">��ҵ���ƣ�</div></td>
                  <td width="266" height="35">
				  <%if(rs!=null){rs.beforeFirst();if(rs.next()){%><%=rs.getString("Name")%><%}}%>
				  </td>
                </tr>
                <tr valign="bottom">
                  <td width="94" height="35"><div align="right">��ҵ��ַ��</div></td>
                  <td height="35">
                    <%if(rs!=null){rs.beforeFirst();if(rs.next()){%><%=rs.getString("Address")%><%}}%>
                  </td>
                </tr>
                <tr valign="bottom">
                  <td width="94" height="35"><div align="right">��ϵ�绰��</div>
                    <div align="right"></div></td>
                  <td height="35"><div align="left">
                    <%if(rs!=null){rs.beforeFirst();if(rs.next()){%><%=rs.getString("Phone")%><%}}%>
                      </div>                    </td>
                </tr>
                <tr valign="bottom">
                  <td height="35"><div align="right">��ҵ���</div></td>
                  <td height="35"><%if(rs!=null){rs.beforeFirst();if(rs.next()){%><%=rs.getString("Style")%><%}}%> </td>
                </tr>
                <tr valign="bottom">
                  <td height="40" colspan="2">
                    <div align="center">
                      <input name="Submit" type="button" class="wenbenkuang" value="  ��  ��  ��  ��  " onClick="javascript:window.close()">                
                  </div></td>
                </tr>
                <tr valign="bottom">
                  <td height="13" colspan="2">&nbsp;</td>
                </tr>
            </table></td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
</body>
</html>
