<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
</head>

<body>

<%
String goods_id=(String)request.getAttribute("goods_id");

out.print("<script language=javascript>alert('����ִ������ȷ�ϳɹ�������');window.location.href='goods_queryGoodsId.action?goods_id="+goods_id+"';</script>");

%>






</body>
</html>
