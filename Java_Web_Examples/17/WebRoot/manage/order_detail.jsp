<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
if (request.getParameter("ID")!=null){
int ID=Integer.parseInt(request.getParameter("ID"));
ResultSet rs_main=connDB.executeQuery("select * from tb_order where orderID="+ID);
int orderID=0;
String username="";
String Truename="";
String address="";
String postcode="";
String tel="";
String email="";
String bz="";
String ISBN="";
String bookname="";
String publisher="";
float price=0;
int number=0;
float rebate=0;
String time="";
if(rs_main.next()){
orderID=rs_main.getInt("orderID");
username=rs_main.getString("username");
Truename=rs_main.getString("Truename");
address=rs_main.getString("address");
postcode=rs_main.getString("postcode");
tel=rs_main.getString("tel");
email=rs_main.getString("email");
rebate=rs_main.getFloat("rebate");
time=rs_main.getString("OrderDate");
bz=rs_main.getString("bz");
if (bz.equals("")){
	bz="��";
}
}
%>
<html>
<head>
<title>������ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
</head>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" background="../Images/bg.gif">
  <tr>
    <td>
<table width="777" height="609"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td valign="top">
	<jsp:include page="Top.jsp"/>
	<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="tableBorder_LTR">
      <tr>
        <td height="30" align="center" bgcolor="#eeeeee">�ԡԡ� �������� �ԡԡ�</td>
      </tr>
    </table>
	<table width="100%" height="396"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LBR">
        <tr>
          <td width="26%" height="395" valign="top"><table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="55%" height="82" align="center" class="word_grey">&nbsp;<img src="../Images/reg.gif" width="84" height="54"></td>
              <td width="45%" align="left" class="word_grey">��������</td>
            </tr>
            <tr>
              <td height="112" colspan="2" valign="top" class="word_grey" style="line-height:200%;"><ul>
                <li>������ִ�У������ִ�С����еġ�ִ�С�ͼ�����ִ�д˶�����</li>
                <li>������Ϣ�鿴�����Բ鿴��������ϸ��Ϣ�����������޸Ķ�����Ϣ��</li>
                </ul></td>
            </tr>
            <tr align="center">
              <td colspan="2" valign="middle" class="word_grey"></td>
            </tr>
          </table></td>
          <td width="5" valign="top" background="../Images/Cen_separate.gif"></td>
          <td width="73%" valign="top"><table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="13" align="center">&nbsp;</td>
            </tr>
          </table>

					  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_B1">
                        <tr>
                          <td width="16%" height="24">�� �� �ţ�&nbsp;<%=orderID%></td>
                        </tr>
                        <tr>
                          <td height="24">�� �� ����&nbsp;<%=username%></td>
                        </tr>
                        <tr>
                          <td height="24">��ʵ������&nbsp;<%=Truename%></td>
                        </tr>
                        <tr>
                          <td height="24">��&nbsp;&nbsp;&nbsp;&nbsp;ַ��&nbsp;<%=address%></td>
                        </tr>
                        <tr>
                          <td height="24">�������룺&nbsp;<%=postcode%></td>
                        </tr>
                        <tr>
                          <td height="24">��&nbsp;&nbsp;&nbsp;&nbsp;����&nbsp;<%=tel%></td>
                        </tr>
                        <tr>
                          <td height="24">Email&nbsp;&nbsp;&nbsp;��&nbsp;<%=email%></td>
                        </tr>
                        <tr>
                          <td height="24">��&nbsp;&nbsp;&nbsp;&nbsp;�ۣ�&nbsp;<%=rebate*100%>%</td>
                        </tr>
                        <tr>
                          <td height="24">ʱ&nbsp;&nbsp;&nbsp; �䣺&nbsp;<%=time%></td>
                        </tr>
                        <tr>
                          <td height="24">��&nbsp;&nbsp;&nbsp;&nbsp;ע��&nbsp;<%=bz%></td>
                        </tr>
                      </table>
					  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_B1">
                        <tr align="center" bgcolor="#eeeeee">
                          <td width="18%" height="27">ͼ��ISBN��</td>
                          <td width="46%">ͼ������</td>
                          <td width="20%">������</td>
                          <td width="9%">����</td>
                          <td width="7%">����</td>
                        </tr>
						<%ResultSet rs=connDB.executeQuery("select * from V_order_detail where orderID="+ID);
						while(rs.next()){
							ISBN=rs.getString("ISBN");
							bookname=rs.getString("BookName");
							publisher=rs.getString("publisher");
							price=rs.getFloat("price");
							number=rs.getInt("number");
						%>  
                        <tr align="center">
                          <td height="27"><%=ISBN%></td>
                          <td height="27"><%=bookname%></td>
                          <td height="27"><%=publisher%></td>
                          <td><%=price%>(Ԫ)</td>
                          <td><%=number%></td>
                        </tr>
						 <%}%>
                      </table>
					  <table width="100%" height="40"  border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td align="center"><input name="Button" type="button" class="btn_grey" value="����" onClick="history.back();"></td>
                        </tr>
                      </table></td>
              <td width="3%" valign="top">&nbsp;</td>
            </tr>
          </table>
          </td>
  </tr>
      </table>
      <jsp:include page="copyright.jsp"/>
    </td>
  </tr>
</table>
</td>
  </tr>
</table>

</body>
</html>
<%}else{
	response.sendRedirect("ordersearch.jsp");
}%>