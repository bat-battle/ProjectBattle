<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="electric.dbs.Dbware"%>
<%@ page import="electric.dbs.waredb"%>
<%@ page import="electric.dbs.ware"%>
<%@ page import="electric.dbs.Dbshop"%>
<%@ page import="electric.dbs.shop"%>
<%@ page import="electric.dbs.Shopdb"%>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.electricUtils.DbConnectionManager"%>
<%@ page import="java.util.Date"%>
<%
      waredb ware=new waredb();
      int countpage=ware.selectsql(5);
      shop pt=(shop)session.getAttribute("USERPO");
      if(pt==null)
      {
                response.sendRedirect("login.jsp");
      }
%>
<html>
<head>
<title>���۵Ǽ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>
<script language="javascript">
function CheckForm()
{
	if(document.form1.a.value=="��")
	{
		alert("������Ա�������ۣ�");
		history.back();
		return false;
	}
}
</script>
<body>
<table width="777" height="172"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="Images/tiring-room/tiring-room_01.gif" width="777" height="125"></td>
      </tr>
      <tr>
        <td height="47" valign="top" background="Images/tiring-room/tiring-room_02.gif"><jsp:include page="H_navigation.jsp"/></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="44" height="380" valign="top"><img src="Images/tiring-room/tiring-room_03.gif" width="44" height="248"></td>
    <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="68" colspan="2" background="Images/tiring-room/h_sell.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">

                    <form method="POST" action="sell_add.jsp" name="form1" onSubmit="return CheckForm();">
                      <div align="center">
                        <table border="0" cellpadding="0" cellspacing="0" width="570" height="259">
                          <center>
                            <tr>
                              <td width="138" align="left">���������ƣ�</td>
                              <td width="462" align="left">
                                    <%if(pt!=null){%>
                                    <input type="hidden" name="shopid" value="<%=pt.getId()%>">
                                    <input type="hidden" name="pageaction" value="create">
                                    <input type="text" name="a" value="<%=pt.getShopname()%>" readonly="true">
                                    <input type="hidden" name="responsepage" value="sell.jsp">
                              <%}%>                             </td>
                            </tr>
                            <tr>
                              <td width="138" align="left">  ��ѡ����Ʒ��</td>
                              <td width="462" height="35" align="left"><select size="1" name="productid">
                                  <%
                             		waredb waredb=new waredb();
			                        Collection col=waredb.select(5000,1);
            			            if (col == null || col.isEmpty()) {
							            System.out.println("coll is null");
							        } else {
							            Iterator itl = col.iterator();
						    	        while (itl.hasNext()) {
						        	        ware b3 = (ware) itl.next();
		                        %>
                                  <option value="<%=b3.getId()%>"><%=b3.getPname()%></option>
                                  <%}}%>
                              </select>                            </td>
                            </tr>
                            <tr>
                              <td width="138" align="left"> ��Ʒ��ɫ��</td>
                              <td width="462" height="30" align="left"> 
                              <input type="text" name="procolor" size="17">                              </td>
                            </tr>
                            <tr>
                              <td width="138" height="39" align="left">�ͻ����ͣ�</td>
                              <td width="462" align="left" > <font size="1">
                                <select size="1" name="protype">
                                  <option selected value="1">����</option>
                                  <option value="2">˽Ӫ��ҵ</option>
                                  <option value="3">������ҵ</option>
                                  <option value="4">������ҵ</option>
                                  <option value="5">������ҵ</option>
                                </select>
                              </font> </td>
                            </tr>
                            <tr>
                              <td width="138" align="left">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
                              <td width="462" align="left" >
                                <input type="text" name="pronumber" size="17">
                              ̨</td>
                            </tr>
                            <tr>
                              <td width="138" align="left"> ��&nbsp;��&nbsp;�ˣ�</td>
                              <td width="462" align="left">
                              <input type="text" name="propeople" size="17">                              </td>
                            </tr>
                            <tr>
                              <td width="138" align="left">�ۻ����ڣ�</td>
							  <%
							  Date date1=new Date();
							  java.sql.Date date=new java.sql.Date(date1.getTime());
							  %>
                              <td width="462" align="left"> <%=date.toString()%></td>
                            </tr>
                            <tr align="center">
                              <td height="25" align="center">&nbsp;                              </td>
                              <td height="25" align="left"><input name="B4" type="reset" class="btn_grey" value="�� ��" >
&nbsp;
<input name="B1" type="submit" class="btn_grey" value="�� ��"></td>
                            </tr>
                          </center>
                        </table>
                      </div>
                      <p>&nbsp; </p>
                  </form>
		  </td>
      </tr>
    </table></td>
    <td width="35" valign="top"><img src="Images/tiring-room/tiring-room_05.gif" width="35" height="248"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
</body>
</html>





