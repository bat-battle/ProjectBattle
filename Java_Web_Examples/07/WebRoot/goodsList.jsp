<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="com.actionForm.GoodsForm" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���ʹ���ϵͳ</title>
<link rel="stylesheet" href="Css/style.css">
</head>

<body>
<table width="757" height="174" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="133" align="center" valign="top"><%@ include file="top.jsp"%></td>
  </tr>
  <tr>
    <td>
      <table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" background="images/area_bg.jpg">
        <tr>
          <td width="26%" align="center" class='word_white'>��ǰ��¼�û���<%=session.getAttribute("username")%></td>
          <td width="4%">&nbsp;</td>
          <td width="70%" valign="bottom">��ǰλ�ã�������Ϣ &gt; ���ʹ��� &gt;&gt;&gt;</td>
        </tr>
      </table>
<table width="100%" height="385" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td width="5" valign="top" background="images/left.gif">&nbsp;</td>
        <td align="center" valign="top">&nbsp;
        <table width="96%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="right"><a href="goodsAdd.jsp">���������Ϣ</a></td>
          </tr>
        </table>
<%
List list=(List)request.getAttribute("goodslist0");
	if(list.size()<=0){%>
        <table width="96%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td  height="40" align="center" >����������Ϣ!</td>
          </tr>
		  </table>
		<%}else{%>
        <table width="96%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#DDDDDA">
          <tr>
            <td width="24%" align="center" bgcolor="#D7F6FB">��Ʒ����</td>
            <td width="21%" align="center" bgcolor="#D7F6FB">���</td>
            <td width="31%" align="center" bgcolor="#D7F6FB">��Ӧ��</td>
            <td width="14%" align="center" bgcolor="#D7F6FB">����</td>
            <td width="5%" align="center" bgcolor="#D7F6FB">�޸�</td>
            <td width="5%" align="center" bgcolor="#D7F6FB">ɾ��</td>
          </tr>
        <%
Iterator it=list.iterator();
int id=-1;
String goodsname="";
String spec="";
String unit="";
float price=0;
String producer="";
Byte ifdel=new Byte("0");
while(it.hasNext()){
	GoodsForm goodsForm=(GoodsForm)it.next();
        id=goodsForm.getId();
		goodsname=goodsForm.getName();
        spec=goodsForm.getSpec();
        unit=goodsForm.getUnit();
        price=goodsForm.getPrice();
        producer=goodsForm.getProducer();
        ifdel=goodsForm.getIfdel();
%>
          <tr>
            <td>&nbsp;<%=goodsname %></td>
            <td>&nbsp;<%=spec%></td>
            <td>&nbsp;<%=producer%></td>
            <td>&nbsp;<%=price%>(Ԫ)/<%=unit %></td>
            <td>&nbsp;<a href="goods.do?action=goodsMquery&id=<%=id%>">�޸�</a></td>
            <td align="center">
            <a href="goods.do?action=goodsdel&id=<%=id%>&val=1">ɾ��</a>
            </td>
          </tr>
		  <%}%>
		  <br>
        </table>
		        <table width="96%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#DDDDDA">
          <tr>
            <td width="24%" align="center" bgcolor="#D7F6FB">��������</td>
            <td width="21%" align="center" bgcolor="#D7F6FB">���</td>
            <td width="31%" align="center" bgcolor="#D7F6FB">��Ӧ��</td>
            <td width="14%" align="center" bgcolor="#D7F6FB">����</td>
            <td width="5%" align="center" bgcolor="#D7F6FB">�޸�</td>
            <td width="5%" align="center" bgcolor="#D7F6FB">�ָ�</td>
          </tr>
        <%
List list1=(List)request.getAttribute("goodslist1");
Iterator it1=list1.iterator();
while(it1.hasNext()){
	GoodsForm goodsForm=(GoodsForm)it1.next();
        id=goodsForm.getId();
	goodsname=goodsForm.getName();
        spec=goodsForm.getSpec();
        unit=goodsForm.getUnit();
        price=goodsForm.getPrice();
        producer=goodsForm.getProducer();
        ifdel=goodsForm.getIfdel();
%>
          <tr>
            <td>&nbsp;<%=goodsname %></td>
            <td>&nbsp;<%=spec%></td>
            <td>&nbsp;<%=producer%></td>
            <td>&nbsp;<%=price%>(Ԫ)/<%=unit %></td>
            <td>&nbsp;<a href="goods.do?action=goodsMquery&id=<%=id%>">�޸�</a></td>
            <td align="center">
             <a href="goods.do?action=goodsdel&id=<%=id%>&val=0">�ָ�</a>
            </td>
          </tr>
		  <%}%>
        </table>		<%}%>
		</td>
        <td width="10" valign="top" background="images/right.jpg">&nbsp;</td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="55" valign="top" background="images/bottom.jpg"><%@ include file="copyright.jsp"%></td>
  </tr>
</table>
</body>
</html>
