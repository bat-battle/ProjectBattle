<%@page contentType="text/html; charset=gb2312" language="java"%>
<%@page import="com.actionForm.GoodsForm"%>
<%@page import="com.actionForm.ProviderForm"%>
<%@page import="com.dao.GoodsDAO"%>
<%@page import="com.actionForm.StockGoodsForm"%>
<%@page import="com.actionForm.StockMainViewForm"%>
<%@page import="com.actionForm.StockDetailForm"%>
<%@page import="com.dao.ProviderDAO"%>
<%@page import="com.core.GetTime"%>
<%@page import="java.util.*"%>
<%
boolean flag=false;
%>
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
          <td width="70%" valign="bottom"> ��ǰλ�ã���ѯͳ��
            &gt; <a href="ifDeal.do?action=stockQuery">�ɹ�����ѯ</a>&nbsp;&gt; �ɹ�����ϸ��Ϣ            &gt;&gt;&gt; </td>
        </tr>
      </table>
      <table width="100%" height="385" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td width="5" valign="top" background="images/left.gif">&nbsp;</td>
          <td align="center" valign="top">&nbsp;
            <table width="96%" height="487"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center" valign="top"><%
		StockMainViewForm stockMVF=(StockMainViewForm)request.getAttribute("stockDetail");
if(stockMVF==null){
%>
                  <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
                    <tr>
                      <td height="36" align="center">û�з��������Ĳɹ�����Ϣ��</td>
                    </tr>
                  </table>
                  <%
}else{
	int id=0;
	String sno="";
	String provider="";
	String principal="";
    String username="";
	String createTime="";
    int state=-1;
    String strState="";
  sno=stockMVF.getSno();
  provider=stockMVF.getProvider();
  principal=stockMVF.getPrincipal();
  username=stockMVF.getUsername();
  GetTime getTime=new GetTime();
  createTime=getTime.formatTime(stockMVF.getCreateTime());
  state=stockMVF.getState();
  switch(state){
    case 0:
    strState="δ���";
    break;
    case 1:
    strState="�����";
    break;
    default:
    strState="���ϸ�";
  }
%>
                  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableBorder">
                    <tr>
                      <td align="center"><table width="98%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
                    <tr>
                      <td width="28%" height="24" style="padding:4px;">�ɹ����ţ�<span style="padding:5px;"><%=sno%></span></td>
                      <td width="41%">��Ӧ�����ƣ�<span style="padding:5px;"><%=provider%></span></td>
                      <td width="31%">�ɹ�ʱ�䣺<span style="padding:5px;"><%=createTime%></span></td>
                    </tr>
                  </table>
                  <table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
                    <tr>
                      <td align="center" bgcolor="#D7F6FB">��������</td>
                      <td align="center" bgcolor="#D7F6FB">���</td>
                      <td align="center" bgcolor="#D7F6FB">��������</td>
                      <td align="center" bgcolor="#D7F6FB">����</td>
                      <td align="center" bgcolor="#D7F6FB">����</td>
                      <td align="center" bgcolor="#D7F6FB">���</td>
                    </tr>
                    <%
        String goodsname="";
        String spec="";
        String producer="";
        String unit="";
        float price=0.0f;
        int number=0;
        Set detail=stockMVF.getStockDetail();
        Iterator it=detail.iterator();
        while(it.hasNext()){
		StockDetailForm stockDF=(StockDetailForm)it.next();
			price=stockDF.getPrice();
                        number=stockDF.getNumber();
                        GoodsForm goodsF=(GoodsForm)stockDF.getGoods();
                        goodsname=goodsF.getName();
                        spec=goodsF.getSpec();
                        producer=goodsF.getProducer();
                        unit=goodsF.getUnit();
%>
                    <tr>
                      <td>&nbsp;<%=goodsname%></td>
                      <td>&nbsp; <%=spec%></td>
                      <td>&nbsp;<%=producer%></td>
                      <td>&nbsp;<%=price%>(Ԫ)</td>
                      <td>&nbsp;<%=number%>(<%=unit%>)</td>
                      <td>&nbsp;<%=price*number%>(Ԫ)</td>
                    </tr>
                    <%}%>
                  </table>
                  <table width="98%" height="35" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="36%">&nbsp;</td>
                      <td width="23%">�����ˣ�<span style="padding:5px;"><%=principal%></span></td>
                      <td width="23%">����Ա��<span style="padding:5px;"><%=username%></span></td>
                      <td width="18%">״̬��<span style="padding:5px;"><%=strState%></span></td>
                    </tr>
                  </table>
                  <%}%>
                  </td>
                    </tr>
                  </table>
                  <table width="98%" height="46" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="right">&nbsp;<a href="#" onclick="history.back()">[����]</a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
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
