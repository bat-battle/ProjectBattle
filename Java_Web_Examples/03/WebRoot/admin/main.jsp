<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">   
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���ղ��͵ش�-��̨��ҳ</title>
</head>
<body>
<jsp:include page="top.jsp" flush="true"/>
<table width="900" height="303" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="F7FAFF">
  <tr align="center">
    <td>��ӭ�������ղ��͵�ַ��̨����</td>
  </tr>
</table>
<jsp:include page="down.jsp" flush="true"/>
</body>
</html>
