<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.core.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>up_head</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<body  >
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="tableNew" >
  <tr align="center">
    <td class="TableTitle1">�ϴ��û�ͷ��</td>
  </tr>
  <form name="form1" enctype="multipart/form-data" method="post" action="upimg_head.jsp">
    <tr align="center">
      <td bgcolor="#FFFFFF"><img src="../images/ico/select.gif"></td>
    </tr>
    <tr align="center">
      <td height="50" bgcolor="#FFFFFF" class="Redfont">ע�⣺ֻ���ϴ���*.gif���롰*.jpg����ͷ��,�ļ����ܴ���100KB</td>
    </tr>
    <tr align="center">
      <td height="40" bgcolor="#FFFFFF"><input type="file" name="file">
&nbsp;&nbsp;
      <input name="Submit" type="submit" class="btn_grey" value="��ʼ�ϴ�"></td>
    </tr>
  </form>
</table>
</body>
</html>
