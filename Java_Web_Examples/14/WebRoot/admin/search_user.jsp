<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>find_user</title>
</head><link href="../css/admin.css" rel="stylesheet" type="text/css">
<body bgcolor="#ffffff"> 
<form name="form1" method="post" action="manage_user.jsp"> 
  <table width="98%" border="0" cellpadding="0" cellspacing="1" class="tableNew"> 
    <tr align="center"> 
      <td height="27" colspan="3" class="TableTitle1">�û�����</td> 
    </tr> 
    <tr> 
      <td width="585" height="81" rowspan="3" align="center" bgcolor="#FFFFFF"> <select name="select"> 
          <option value="uid">�û�ID</option> 
          <option value="name">��ʵ����</option> 
          <option value="age">�û�����</option> 
          <option value="tel">�û��绰</option> 
          <option value="email">�����ʼ�</option> 
          <option value="qq">OICQ</option> 
          <option value="address">���˵�ַ</option> 
          <option value="http">������ҳ</option> 
        </select> 
&nbsp;&nbsp; 
        <input type="text" name="value"></td> 
      <td width="334" bgcolor="#FFFFFF"><input name="sex" type="checkbox" class="noborder" value="1"> 
        �� &nbsp;&nbsp;&nbsp;&nbsp; 
        <input name="sex" type="checkbox" class="noborder" value="0"> 
        Ů</td> 
      <td width="99" rowspan="3" align="center" bgcolor="#FFFFFF"><input type="image" class="noborder" src="../images/search.gif"> 
    <input type="hidden" value="submit" name="submit"></td>
    </tr> 
    <tr> 
      <td bgcolor="#FFFFFF"> <input name="status" type="checkbox" class="noborder" value="1"> 
        ����Ա
        <input name="status" type="checkbox" class="noborder" value="0"> 
        ��ͨ�û�</td> 
    </tr> 
    <tr> 
      <td bgcolor="#FFFFFF"><input name="state" type="checkbox" class="noborder" value="1"> 
        ������
        <input name="state" type="checkbox" class="noborder" value="0"> 
        ���� </td> 
    </tr> 
  </table> 
</form> 
</body>
</html>
