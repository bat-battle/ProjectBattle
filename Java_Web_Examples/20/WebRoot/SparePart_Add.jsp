<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<html>
<% request.setCharacterEncoding("gb2312");%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
<title>�����������</title>
</head>
<jsp:useBean id="data" scope="session" class="cars.Bean1"></jsp:useBean>
<link rel="stylesheet" href="Css/style.css">
<body topmargin="0" leftmargin="0">
<%!
	String sql;
	int i;
	String type;
	String name,price,number;
%>
<% if(request.getParameter("action")!=null){
	type=request.getParameter("type");
	number=request.getParameter("number");
	price=request.getParameter("price");
	name=request.getParameter("name");
	sql="insert into tb_SparePart values('"+number+"','"+name+"','"+price+"','"+type+"')";
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
        <form name="orderform" method="post" action="SparePart_Add.jsp?action=add">
          <tr>
            <td valign="top">
              <table width="360" height="163" border="0" cellpadding="0" cellspacing="0">
                <tr valign="bottom">
                  <td height="30"><div align="right">�� �� �� �ţ�</div></td>
                  <td width="236" height="30"><input name="number" type="text" class="wenbenkuang" size="20"></td>
                </tr>
                <tr valign="bottom">
                  <td width="124" height="30"><div align="right">�� �� �� �ƣ�</div></td>
                  <td height="30">
                    <input name="name" type="text" class="wenbenkuang" size="20">
                  </td>
                </tr>
                <tr valign="bottom">
                  <td width="124" height="30"><div align="right">ƥ �� �� �ͣ�</div>                    
                    <div align="right"></div></td>
                  <td height="23"><div align="left">
                    <input name="type" type="text" class="wenbenkuang" id="type" size="20">
                      </div>                    </td>
                </tr>
                <tr valign="bottom">
                  <td height="30"><div align="right">�� �� �� ��</div></td>
                  <td height="30"><input name="price" type="text" class="wenbenkuang" size="15">
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
            </table></td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
</body>
</html>
