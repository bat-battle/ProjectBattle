<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String PID="";
String goodsname="";
String superType="";
String subType="";
String introduce="";
String picture="";
float price=(float)0.0;
float nowprice=(float)0.0;
int sale=0;
int newgoods=0;
PID=request.getParameter("ID");
if (PID!=null && PID!=""){
	int ID=Integer.parseInt(PID);
	ResultSet rs=conn.executeQuery("select * from V_goods where ID="+ID);
	if(!rs.next()){
		out.println("<script lanuage='javascript'>alert('���Ĳ�������1!');window.location.href='index.jsp';</script>");
	}else{
		superType=rs.getString("superType");	
		subType=rs.getString("subType");	
		goodsname=rs.getString("goodsname");
		introduce=rs.getString("introduce");
		price=rs.getFloat("Price");		
		nowprice=rs.getFloat("nowPrice");		
		picture=rs.getString("picture");
		newgoods=rs.getInt("newgoods");		
		sale=rs.getInt("sale");
	}
%>
<html>
<head>
<title>MR���繺�����ġ�����̨����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="banner.jsp"/>
<table width="788" height="288"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>

    <td align="center" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="10" height="38" align="right">&nbsp;</td>
        <td colspan="3" class="tableBorder_B_dashed"><img src="../images/manage_ico1.GIF" width="11" height="11">&nbsp;<a href="superType.jsp"> [�������Ϣ����]</a>&nbsp;&nbsp;&nbsp;<img src="../images/manage_ico2.GIF" width="11" height="11">&nbsp;<a href="subType.jsp">[С������Ϣ����]</a>&nbsp;&nbsp;&nbsp;<img src="../images/manage_ico3.GIF" width="12" height="12">&nbsp;<a href="goods_add.jsp">[�����Ʒ��Ϣ]</a></td>
        <td width="12">&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td height="10" colspan="3">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="29" align="right">&nbsp;</td>
        <td width="19" background="../images/manage_leftTitle_left.GIF">&nbsp;</td>
        <td width="588" align="center" background="../images/manage_leftTitle_mid.GIF" class="word_white"><b>ɾ����Ʒ��Ϣ</b></td>
        <td width="20" background="../images/manage_leftTitle_right.GIF">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
	<!---->
      			 <form action="goods_del_deal.jsp" method="post" name="form1">
			    <table width="94%"  border="0" align="right" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                  <tr>
                    <td width="14%" height="27">&nbsp;��Ʒ���ƣ�</td>
                    <td height="27" colspan="3">&nbsp;
					<input name="ID" type="hidden" id="ID" value="<%=ID%>">
                      <%=goodsname%>
                      &nbsp;&nbsp;                    </td>
                  </tr>
                  <tr>
                    <td height="27">&nbsp;�������ࣺ</td>
                    <td width="31%" height="27">&nbsp;<%=superType%></td>
                    <td width="13%" height="27"> &nbsp;����С�ࣺ</td>
                    <td width="42%" height="27">&nbsp;<%=subType%></td>
                  </tr>
                  <tr>
                    <td height="16">&nbsp;ͼƬ�ļ���</td>
                    <td height="27" colspan="3">&nbsp;
                       <%=picture%></td>
                  </tr>
                  <tr>
                    <td height="27" align="center">�������ۣ�</td>
                    <td height="27">&nbsp;<%=price%>(Ԫ)</td><td height="27" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ۣ� </td>
                    <td height="27">&nbsp;<%=nowprice%>(Ԫ)</td>
                  </tr>
                  <tr>
                    <td height="45">&nbsp;�Ƿ���Ʒ��</td>
                    <td>&nbsp; <%if(newgoods==0){out.print("������Ʒ");}
					else{out.print("����Ʒ");}
					%></td>
                    <td>&nbsp;�Ƿ��ؼۣ�</td>
                    <td><%if(sale==0){out.print("�����ؼ���Ʒ");}
					else{out.print("���ؼ���Ʒ");}
					%></td>
                  </tr>
                  <tr>
                    <td height="103">&nbsp;��Ʒ��飺</td>
                    <td colspan="3"><span class="style5">&nbsp; </span>
                        <%=introduce%></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="4" align="center">
                        <input name="Submit" type="submit" class="btn_bg_long1" value="ȷ��ɾ��">
                        &nbsp;
                        <input name="Submit3" type="button" class="btn_bg_short" value="����" onClick="JScript:history.back()">                    </td>
                  </tr>
                </table>
			  </form>
	 <!----> 
</td>
	  
	      <td width="182" valign="top"><table width="100%" height="431"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="199" valign="top" bgcolor="#FFFFFF"><jsp:include page="navigation.jsp"/></td>
      </tr>
    </table></td>	  
  </tr>
</table>
<jsp:include page="copyright.jsp"/>
</body>
</html>
<%}else{
	out.println("<script language='javascript'>alert('���Ĳ�������!');window.location.href='index.jsp';");
}%>