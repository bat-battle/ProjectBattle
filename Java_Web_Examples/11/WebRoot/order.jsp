<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String username="";
username=(String)session.getAttribute("username");
if(username=="" || username==null){
	out.println("<script language='javascript'>alert('���ȵ�¼!');window.location.href='index.jsp';</script>");
}else{
	ResultSet rs=conn.executeQuery("select * from tb_order where username='"+username+"'");
	int orderID=0;
	int bnumber=0;
	String truename="";
	String pay="";	
	String carry="";
	float rebate=1;
	String orderDate="";
%>
<html>
<head>
<title>MR���繺������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>
<body>
<jsp:include page="navigation.jsp"/>
<jsp:include page="login_u.jsp"/>
<jsp:include page="ad.jsp"/>
<table width="788" height="236"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="193" height="182" valign="top" bgcolor="#FFFFFF">
	<jsp:include page="search.jsp"/>
    <jsp:include page="goodsType.jsp"/>
	</td>
    <td valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="45" valign="top" background="images/sub_order.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="10" valign="top">&nbsp;</td>
        </tr>
            <tr valign="top">
              <td height="134" align="center">
<table width="94%"  border="0" cellpadding="0" cellspacing="0">
                    <tr align="center" >
                      <td width="8%" height="30" class="tableBorder_B_dashed">������</td>
                      <td width="8%" class="tableBorder_B_dashed">Ʒ����</td>
                      <td width="13%" class="tableBorder_B_dashed">��ʵ����</td>
                      <td width="18%" class="tableBorder_B_dashed">���ʽ</td>
                      <td width="18%" class="tableBorder_B_dashed">���ͷ�ʽ</td>
                      <td width="9%" class="tableBorder_B_dashed">�ۿ�</td>
                      <td width="26%" class="tableBorder_B_dashed">��������</td>
                    </tr>
					<%
					while(rs.next()){
						orderID=rs.getInt("orderID");
						bnumber=rs.getInt("bnumber");
						truename=rs.getString("truename");
						pay=rs.getString("pay");
						carry=rs.getString("carry");
						rebate=rs.getFloat("rebate");
						orderDate=rs.getString("orderDate");
					%>
                    <tr align="center">
                      <td height="24"><a href="order_detail.jsp?ID=<%=orderID%>"><%=orderID%></a></td>
                      <td><%=bnumber%></td>
                      <td><%=truename%></td>
                      <td><%=pay%></td>
                      <td><%=carry%></td>
                      <td><%=rebate*100%>%</td>
                      <td><%=orderDate%></td>
                    </tr>
					<%}%>
                  </table>
                 </td>
            </tr>
          </table>
	  
	  
	  </td>
        </tr>
    </table></td>
  </tr>
</table>
 <jsp:include page="copyright.jsp"/>
</body>
</html>
<%conn.close();
}
%>