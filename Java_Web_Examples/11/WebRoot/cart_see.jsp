<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="com.model.Goodselement"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String username="";
username=(String)session.getAttribute("username");
if(username=="" || username==null){
	out.println("<script language='javascript'>alert('���ȵ�¼!');window.location.href='index.jsp';</script>");
}else{
	Vector cart=(Vector)session.getAttribute("cart");
	if(cart==null || cart.size()==0){
		response.sendRedirect("cart_null.jsp");
	}else{
	%>
<html>
<head>
<title>MR���繺������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript" src="JS/AjaxRequest.js"></script>
<script language="javascript" src="JS/AjaxAssistantFun.js"></script>
<script language="javascript">
/***************************���ú���*************************/
function modifyNumber(ID,number){
if(isNaN(number) || number.indexOf('.',0)!=-1){
	alert("�벻Ҫ����Ƿ��ַ�");
}else{
	if(number=="")	{
		alert("�������޸ĵ�����");
	}else{
	    //�˴���Ҫ��&nocache="+new Date().getTime()�����򽫳��ֺϼƽ����µ����
		var loader=new net.AjaxRequest("cart_modify.jsp?ID="+ID+"&number="+number+"&nocache="+new Date().getTime(),deal_cart,onerror,"GET");					
	}
}	
}
</script>
</head>
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
    <td valign="top" bgcolor="#FFFFFF"><table width="100%" height="743"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="45" valign="top" background="images/sub_cartSee.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="10" valign="top">&nbsp;</td>
        </tr>
            <tr valign="top">
              <td align="center" background="images/cart.gif" style="background-position:right bottom; background-repeat:no-repeat">
<table width="100%" height="126"  border="0" cellpadding="0" cellspacing="0">

			    <tr>
                  <td valign="top">
                    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>
<form method="post" action="cart_modify.jsp" name="form1">
<table width="92%" height="48" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr align="center" valign="middle">
        <td height="27" class="tableBorder_B1">���</td>
        <td height="27" class="tableBorder_B1">��Ʒ���</td>
        <td class="tableBorder_B1">��Ʒ����</td>
        <td height="27" class="tableBorder_B1">����</td>
        <td height="27" class="tableBorder_B1">����</td>
        <td height="27" class="tableBorder_B1">���</td>
        <td class="tableBorder_B1">�˻�</td>
      </tr> 
	<%
		float sum=0;
		int ID=-1;
		String goodsname="";
		for(int i=0;i<cart.size();i++){
			Goodselement goodsitem=(Goodselement)cart.elementAt(i);
			sum=sum+goodsitem.number*goodsitem.nowprice;
			ID=goodsitem.ID;
			if (ID>0){
				ResultSet rs_goods=conn.executeQuery("select * from tb_goods where ID="+ID);
				if (rs_goods.next()){
					goodsname=rs_goods.getString("goodsname");
				}
			}
	%> 
      <tr align="center" valign="middle"> 
        <td width="32" height="27"><%=i+1%></td>
        <td width="109" height="27"><%=ID%></td> 
        <td width="199" height="27"><%=goodsname%></td>
        <td width="59" height="27">��<%=goodsitem.nowprice%></td> 
        <td width="51" height="27">
          <input name="num<%=i%>" size="7" type="text" class="txt_grey" value="<%=goodsitem.number%>" onBlur="modifyNumber(<%=ID%>,this.value)"></td> 
        <td width="65" height="27">��<%=(goodsitem.nowprice*goodsitem.number)%></td> 
        <td width="34"><a href="cart_move.jsp?ID=<%=i%>"><img src="images/del.gif" width="20" height="20"></a></td>
	<%
		}

	%> </tr>
      </table>
	  </form>
<table width="100%" height="52" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr align="center" valign="middle">
		<td height="10">&nbsp;		</td>
        <td width="24%" height="10" colspan="-3" align="left">&nbsp;</td>
		</tr>
      <tr align="center" valign="middle">
        <td height="21" class="tableBorder_B1">&nbsp;</td>
        <td height="21" colspan="-3" align="left" class="tableBorder_B1" id="totalSum">�ϼ��ܽ�<span class="word_orange">��<%=sum%></span></td>
      </tr>
      <tr align="center" valign="middle">
        <td height="21" colspan="2"> <a href="index.jsp">��������</a> | <a href="cart_checkout.jsp">ȥ����̨����</a> | <a href="cart_clear.jsp">��չ��ﳵ</a></td>
        </tr>
</table>						</td>
                      </tr>
                    </table></td>
		      </tr>
              </table>              </td>
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
}}
%>