<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.*" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>update_resolvent</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<%int rid=ParamUtils.getIntParameter(request,"rid");BasetableFactory bf=BasetableFactory.getInstance();
Resolvent r=bf.SearchResolvent("WHERE rid="+rid);if(r.getRid()<=0){
  session.setAttribute("error","����ʧ��");        response.sendRedirect("error.jsp");}else{
%>
<body>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#EFEFEF" bordercolordark="#000000" class="tableNew">
  <tr align="center">
    <td colspan="2" class="TableTitle1" >�鿴�������</td>
  </tr>
  <tr align="center">
    <td width="21%" bgcolor="#FFFFFF">��������</td>
    <td width="79%" align="left" bgcolor="#FFFFFF"><%=r.getName()%></td>
  </tr>
  <tr align="center">
    <td height="27" bgcolor="#FFFFFF">����������</td>
    <td align="left" bgcolor="#FFFFFF"><%=bf.SearchSsort("WHERE sid="+r.getSid()).getName()%></td>
  </tr>
  <tr align="center">
    <td height="27" bgcolor="#FFFFFF">ʵ��Ӧ��</td>
    <td align="left" bgcolor="#FFFFFF"><%=bf.SearchSoft("WHERE sfid="+r.getSfid()).getName()%></td>
  </tr>
  <tr align="center">
    <td height="27" colspan="2" bgcolor="#FFFFFF">�������</td>
  </tr>
  <tr align="left">
    <td colspan="2" bgcolor="#FFFFFF"><%=r.getContent()%></td>
  </tr>
  <tr align="center">
    <td height="2" colspan="2" bgcolor="#FFFFFF"><%String path=bf.SearchHead("WHERE iid='"+r.getIid()+"'").getPath();if(path==null){out.print("��ͼƬ");}else{out.print("<img src=../"+path+" width=460 height=300 >");}%></td>
  </tr>
  <tr align="center">
    <td height="3" bgcolor="#FFFFFF">�����</td>
    <td height="3" align="left" bgcolor="#FFFFFF"><%=((User)bf.SearchUser("WHERE uid='"+r.getUid()+"'")).getName()%></td>
  </tr>
  <tr align="center">
    <td height="2" bgcolor="#FFFFFF">���ʱ��</td>
    <td height="2" align="left" bgcolor="#FFFFFF"><%=r.getUptime()%></td>
  </tr>
  <tr align="center">
    <td height="6" colspan="2" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
</table>
<table width="80%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="50" colspan="5" align="right"><a href="#" onClick="Jscript:history.back()">����</a></td>
  </tr>
</table> <%}%>
</body>
</html>
