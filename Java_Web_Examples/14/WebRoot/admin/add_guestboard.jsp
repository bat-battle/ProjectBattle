<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Guestboard" %>
<%@ page import="com.core.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>add_guestboard</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<script src="../js/validate.js"></script>
<body> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td height="30" colspan="2" class="TableTitle1" >�ظ�������Ϣ</td> 
  </tr> 
  <%
int gid=ParamUtils.getIntParameter(request,"gid");
BasetableFactory bf=BasetableFactory.getInstance();
Guestboard a=bf.SearchGuestboard("WHERE gid="+gid);
if(a.getGid()<=0){
%> 
  <tr align="center"> 
    <td height="27" colspan="2" bgcolor="#FFFFFF">��ǰ����Ϊ��</td> 
  </tr> 
  <%}else{%> 
  <tr align="center"> 
    <td width="36%" height="27" bgcolor="#FFFFFF">���Ա���</td> 
    <td width="64%" align="left" bgcolor="#FFFFFF"><%=a.getTitle()%></td> 
  </tr> 
  <tr align="left"> 
    <td height="13" align="center" bgcolor="#FFFFFF">����ʱ��</td> 
    <td height="0" align="left" bgcolor="#FFFFFF"><%=a.getGtime()%></td> 
  </tr> 
  <tr align="left"> 
    <td height="14" align="center" bgcolor="#FFFFFF">��&nbsp;��&nbsp;��</td> 
    <td height="0" align="left" bgcolor="#FFFFFF"><%=a.getGuest()%></td> 
  </tr> 
  <tr align="left"> 
    <td height="60" align="center" bgcolor="#FFFFFF">��������</td> 
    <td height="0" align="left" valign="top" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;<%=a.getContent()%></td> 
  </tr> 
  <form name="form2" method="post" action="modify_guestboard.jsp"> 
    <tr align="left"> 
      <td height="50" align="center" bgcolor="#FFFFFF">�ظ�����</td> 
      <td height="0" align="left" valign="top" bgcolor="#FFFFFF"> <textarea name="recontent" cols="60" rows="6" class="textarea"></textarea> </td> 
    </tr> 
    <input type="hidden" name="action" value="add"> 
    <input type="hidden" name="gid" value="<%=a.getGid()%>"> 
    <tr align="left"> 
      <td height="40" colspan="2" align="center" bgcolor="#FFFFFF"><input name="Submit" type="submit" class="btn_grey" onClick="return guestboard()" value="�ظ�"> 
&nbsp;&nbsp; 
      <input name="Submit2" type="button" class="btn_grey"  onClick="javascirpt:history.back();" value="����"></td> 
    </tr> 
  </form> 
  <%}%> 
</table> 
</body>
</html>
