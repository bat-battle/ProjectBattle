<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<html>
<% request.setCharacterEncoding("gb2312");%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
<title><%if((request.getParameter("id")!=null)&&(!request.getParameter("id").equals(""))){%>��ҵ�����޸�<%}else{%>��ҵ�������<%}%></title>
</head>
<jsp:useBean id="data" scope="page" class="cars.Bean1"/>
<link rel="stylesheet" href="Css/style.css">
<body topmargin="0" leftmargin="0">
<%!
	String sql;
	int i;
	ResultSet rs;
	String id,name,address,phone,type;
%>

<% if(request.getParameter("action")!=null){
	name=request.getParameter("name");
	address=request.getParameter("address");
	phone=request.getParameter("phone");
	type=request.getParameter("type");
	sql="insert into tb_Enterprise values('"+name+"','"+address+"','"+phone+"','"+type+"')";
	i=data.getint(sql);
	if(i>0){
%>
	<script language="javascript">
		alert("��ҵ������ӳɹ�");
		window.close();
		opener.location.reload();
	</script>
<%}}%>
<% if(request.getParameter("change")!=null){
	id=request.getParameter("id");
	name=request.getParameter("name");
	address=request.getParameter("address");
	phone=request.getParameter("phone");
	type=request.getParameter("type");
	sql="update tb_Enterprise set Name='"+name+"',Address='"+address+"',Phone='"+phone+"',Style='"+type+"' where ID="+Integer.parseInt(request.getParameter("id"));
	i=data.getint(sql);
	if(i>0){
%>
	<script language="javascript">
		alert("��ҵ�����޸ĳɹ�");
		window.close();
		opener.location.reload();
	</script>
<%}}%>
<%
if((request.getParameter("id")!=null)&&(!request.getParameter("id").equals(""))){
sql="select * from tb_Enterprise where ID="+Integer.parseInt(request.getParameter("id"));
rs=data.getrs(sql);
}
else{rs=null;}
%>
<table width="380" height="210" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#A7B5CE" class="table">
  <tr>
    <td valign="top"><table width="360" height="210" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="45" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:160;"> <%if((request.getParameter("id")!=null)&&(!request.getParameter("id").equals(""))){%>�� ҵ �� �� �� ��<%}else{%>�� ҵ �� �� �� ��<%}%></div></td>
        </tr>
        <form name="orderform" method="post" action="<%if(request.getParameter("id")==null){%>Enterprise_Add.jsp?action=add<%}else{%>Enterprise_Add.jsp?change=change<%}%>">
          <tr>
            <td valign="top">
              <table width="360" height="163" border="0" cellpadding="0" cellspacing="0">
                <tr valign="bottom">
                  <td height="35"><div align="right">��ҵ���ƣ�</div></td>
                  <td width="266" height="35">
				  <input name="name" type="text" class="wenbenkuang" id="name" size="40" value="<%if(rs!=null){rs.beforeFirst();if(rs.next()){%><%=rs.getString("Name")%><%}}%>">
				  <%if(rs!=null){rs.beforeFirst();%><input name="id" type="hidden" value="<%if(rs.next()){%><%=rs.getInt("ID")%><%}%>"><%}%>			  </td>
                </tr>
                <tr valign="bottom">
                  <td width="94" height="35"><div align="right">��ҵ��ַ��</div></td>
                  <td height="35">
                    <input name="address" type="text" class="wenbenkuang" id="address" value="<%if(rs!=null){rs.beforeFirst();if(rs.next()){%><%=rs.getString("Address")%><%}}%>" size="40">                  </td>
                </tr>
                <tr valign="bottom">
                  <td width="94" height="35"><div align="right">��ϵ�绰��</div>
                  <div align="right"></div></td>
                  <td height="35"><div align="left">
                    <input name="phone" type="text" class="wenbenkuang" id="phone" value="<%if(rs!=null){rs.beforeFirst();if(rs.next()){%><%=rs.getString("Phone")%><%}}%>" size="20">
                  </div>                    </td>
                </tr>
                <tr valign="bottom">
                  <td height="35"><div align="right">��ҵ���</div></td>
                  <td height="35">                    <select name="type" class="wenbenkuang" id="type">
                    <option value="�ͻ�����" selected>�ͻ�������ҵ</option>
                    <option value="��������">����������ҵ</option>
                  </select>
                 </td>
                </tr>
                <tr valign="bottom">
                  <td height="35" colspan="2">
                    <div align="center">
                      <input name="Submit2" type="submit" class="buttons" value="<%if(request.getParameter("id")==null){%> �� �� <%}else{%> �� �� <%}%>">
                      <input name="Submit" type="reset" class="buttons" value=" �� �� ">
                      <input name="Submit3" type="button" class="buttons" value=" �� �� " onClick="javascript:window.close()">
                  </div></td>
                </tr>
                <tr valign="bottom">
                  <td height="15" colspan="2">&nbsp;</td>
                </tr>
            </table></td>
          </tr>
        </form>
    </table></td>
  </tr>
</table><%if(rs!=null){rs.close();data.close();}%>
</body>
</html>
