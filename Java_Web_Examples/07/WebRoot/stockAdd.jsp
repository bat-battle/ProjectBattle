<%@page contentType="text/html; charset=gb2312" language="java"%>
<%@page import="com.actionForm.GoodsForm"%>
<%@page import="com.actionForm.ProviderForm"%>
<%@page import="com.dao.GoodsDAO"%>
<%@page import="com.actionForm.StockGoodsForm"%>
<%@page import="com.dao.ProviderDAO"%>
<%@page import="com.core.GetTime"%>
<%@page import="java.util.*"%>
<%
boolean flag=false;
    GetTime getTime = new GetTime();
  //��ȡȫ��������Ϣ
    List listgoods = null;
    GoodsDAO goodsDAO = new GoodsDAO();
    listgoods = goodsDAO.query(null, 0);
   // session.setAttribute("listgoods", listgoods);
  //��ȡȫ����Ӧ����Ϣ
    List listprovider = null;
    ProviderDAO providerDAO = new ProviderDAO();
    listprovider = providerDAO.query(null);
  //  session.setAttribute("listprovider", listprovider);
  //List listgoods=(List)request.getAttribute("goodsList");
 // List listprovider = (List) request.getAttribute("providerList");
  if (listgoods.size() <= 0) {
    out.println("<script language='javascript'>alert('����¼��������Ϣ');window.location.href='goods.do?action=goodsRequest';</script>");
  }
  else if (listprovider.size() <= 0) {
    out.println("<script language='javascript'>alert('����¼�빩Ӧ����Ϣ');window.location.href='provider.do?action=providerQuery';</script>");
  }
  else {
    int goodsid = -1;
    String goodsname = "";
    String spec = "";
    String unit = "";
    float price = 0.0f;
    String producer = "";
    int providerid = -1;
    String providername = "";
    float amount=0.0f;
%>
<script language="javascript">
function mycheck(form){
	if(form.principal.value==""){
		alert("����д����������!");form.principal.focus();return false;
	}
}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title>���ʹ���ϵͳ</title>
<link rel="stylesheet" href="Css/style.css">
</head>
<body>
<table width="757" height="174" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="133" align="center" valign="top"><%@include file="top.jsp"%>
    </td>
  </tr>
  <tr>
    <td><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" background="images/area_bg.jpg">
        <tr>
          <td width="26%" align="center" class='word_white'>��ǰ��¼�û���<%=session.getAttribute("username")%></td>
          <td width="4%">&nbsp;</td>
          <td width="70%" valign="bottom"> ��ǰλ�ã��������
            &gt;
            �ɹ��Ǽ�
            &gt;&gt;&gt; </td>
        </tr>
      </table>
      <table width="100%" height="385" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td width="5" valign="top" background="images/left.gif">&nbsp;</td>
          <td align="center" valign="top">&nbsp;
            <form name="form1" method="post" action="cart.do?action=add" onSubmit="return mycheck(form1)">
              <table width="96%" height="56" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#DDDDDA" bordercolordark="#FFFFFF">
                <tr>
                  <td width="35%" align="center" bgcolor="#D7F6FB">��������[���]</td>
                  <td width="25%" align="center" bgcolor="#D7F6FB">��������</td>
                  <td width="17%" align="center" bgcolor="#D7F6FB">����</td>
                  <td width="17%" align="center" bgcolor="#D7F6FB">����</td>
                  <td width="6%" align="center" bgcolor="#D7F6FB">����</td>
                </tr>
                <tr>
                  <script language="javascript">
				  function checkStock(myform){
				  	if(myform.price.value<=0){
						alert("�����뵥��!");myform.price.focus();return;
					}
				  	if(myform.number.value<=0){
						alert("����������!");myform.number.focus();return;
					}
					myform.submit();
				  }
		  function ChangeItem(id){
		  	window.location.href="instorage.do?action=changeGoods&id="+id;
		  }
		  </script>
                  <td align="left"style="padding-left:10px"><select name="id" class="select" id="id" onChange="ChangeItem(this.value)">
                      <%
                  GoodsForm selGoodsF=(GoodsForm)request.getAttribute("selGoods");
                  int selgoodsId=selGoodsF.getId();
                  String selProducer=selGoodsF.getProducer();
                  String selUnit=selGoodsF.getUnit();
                  float selPrice=selGoodsF.getPrice();
                    Iterator itgoods = listgoods.iterator();
                    while (itgoods.hasNext()) {
                      GoodsForm goods = (GoodsForm) itgoods.next();
                      goodsid = goods.getId();
                      goodsname = goods.getName();
                      spec = goods.getSpec();
                      producer = goods.getProducer();
                  %>
                      <option value="<%=goodsid%>" <%if(selgoodsId==goodsid){out.print("selected");}%>><%=goodsname+" ["+spec+"]" %> </option>
                      <%}                  %>
                    </select>
                  </td>
                  <td align="left"style="padding-left:10px"><%=selProducer%> </td>
                  <td align="center"><input name="price" type="text" id="price" size="10" value="<%=selPrice%>">
                  Ԫ </td>
                  <td align="center"><input name="number" type="text" id="number" value="0" size="8">
                  <%=selUnit%></td>
                  <td align="center"><a href="#" onClick="checkStock(form1)">�ɹ�</a> </td>
                </tr>
				<%if(session.getAttribute("stockgoods")!=null ){
					flag=true;
					List sessionList=(List)session.getAttribute("stockgoods");
					int sesId=0;
					float sesPrice=0.0f;
					int sesNumber=0;
                                        String sesName="";
                                        String sesProducer="";
                                        String sesunit="";
					for(int i=0;i<sessionList.size();i++){
						StockGoodsForm stockgoodsF=(StockGoodsForm)sessionList.get(i);
						sesId=stockgoodsF.getId();
                                                //**********��ȡ���ʻ�����Ϣ
						GoodsForm goods=(GoodsForm)goodsDAO.query(sesId);
                                                sesName=goods.getName();
                                                sesProducer=goods.getProducer();
                                                sesunit=goods.getUnit();
                                                //******************
						sesPrice=stockgoodsF.getPrice();
						sesNumber=stockgoodsF.getNumber();
                                                amount=amount+sesPrice*sesNumber; //����ϼƽ��
				%>
				<tr>
                  <td width="35%" align="left" style="padding-left:10px"><%=sesName%></td>
                  <td width="25%" align="left" style="padding-left:10px"><%=sesProducer%></td>
                  <td width="17%" align="left" style="padding-left:15px"><%=sesPrice%>Ԫ</td>
                  <td width="17%" align="left" style="padding-left:20px"><%=sesNumber%>&nbsp;[<%=sesunit%>]</td>
                  <td width="6%" align="center"><a href="cart.do?action=remove&removeid=<%=i%>">��ȥ</a></td>
                </tr>
				<%
					}
				}%>
              </table>
            </form>
            <form name="form2" method="post" action="instorage.do?action=stockadd" onSubmit="return mycheck(form2)">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                </tr>
              </table>
              <table width="96%" height="76" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#DDDDDA" bordercolordark="#FFFFFF" class="tableBorder">
                <tr>
                  <td width="14%" height="38" align="center">��Ӧ�����ƣ�</td>
                  <td colspan="3" align="left"><select name="providerid" id="providerid">
                      <%
                    Iterator itprovider = listprovider.iterator();
                    while (itprovider.hasNext()) {
                      ProviderForm provider = (ProviderForm) itprovider.next();
                      providerid = provider.getId();
                      providername = provider.getName();
                  %>
                      <option value="<%=providerid%>"><%=providername %> </option>
                      <%}                  %>
                    </select>                  </td>
                  <td width="10%" align="left">�ϼƽ�</td>
                  <td width="26%" align="left"><input name="totalpay" type="text" id="totalpay"  size="20" value="<%=amount%>" readonly="yes" >
                    Ԫ </td>
                </tr>
                <tr>
                  <td height="38" align="center"> ��&nbsp;&nbsp;��&nbsp;&nbsp;�ˣ�</td>
                  <td width="35%" align="left"><input name="principal" type="text" id="principal" size="20">                  </td>
                  <td width="8%" align="left">&nbsp;</td>
                  <td width="7%" align="left">&nbsp;</td>
                  <td align="left">��&nbsp;��&nbsp;Ա��</td>
                  <td align="left"><input name="username" type="text" id="username" value="<%=session.getAttribute("username")%>" size="20" readonly="yes"></td>
                </tr>
              </table>
              <table width="96%" height="76" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#DDDDDA" bordercolordark="#FFFFFF">
                <tr>
                  <td align="center">
				  <%if(flag){%>
				  <input name="Submit4" type="submit" class="btn_grey" value="����">
                    &nbsp;
                    <input name="Submit22" type="button" class="btn_grey" value="����" onClick="window.location.href='cart.do?action=clear';"><%}%>
                    &nbsp;</td>
                </tr>
              </table>
            </form></td>
          <td width="10" valign="top" background="images/right.jpg">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="55" valign="top" background="images/bottom.jpg"><%@include file="copyright.jsp"%>
    </td>
  </tr>
</table>
</body>
</html>
<%}%>
