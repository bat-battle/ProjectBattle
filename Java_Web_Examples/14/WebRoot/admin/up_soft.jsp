<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.core.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>�ϴ��������</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<body>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" >
  <tr align="center">
    <td class="TableTitle1">�ϴ��������</td>
  </tr>
  <form name="form1" enctype="multipart/form-data" method="post" action="upimg_soft.jsp">
    <tr align="center">
      <td bgcolor="#FFFFFF"><img src="../images/ico/select.gif"></td>
    </tr>
    <tr align="center">
      <td height="50" class="Redfont">ע�⣺ֻ���ϴ�(*.gif)��(*.jpg)��ͼƬ,ͼƬ���ܴ���100KB</td>
    </tr>
    <tr align="center">
      <td><input type="file" name="ufile">
&nbsp;&nbsp;
        <input type="submit" name="Submit" value="��ʼ�ϴ�"></td>
    </tr>
  </form>
</table>
</body>
</html>
