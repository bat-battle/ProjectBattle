<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Soft" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>info_soft</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<body bgcolor="#ffffff">
<%int uid=ParamUtils.getIntParameter(request,"sfid");BasetableFactory bf=BasetableFactory.getInstance();
Soft u=bf.SearchSoft("WHERE sfid="+uid);session.removeAttribute("error");if(u.getSfid()<=0){
        session.setAttribute("error","����ʧ��");response.sendRedirect("error.jsp");}else{%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew">
  <tr align="center">
    <td colspan="3" class="TableTitle1" >�����ϸ��Ϣ</td>
  </tr>
  <tr align="center">
    <td width="23%" bgcolor="#FFFFFF">�������</td>
    <td width="37%" align="left" bgcolor="#FFFFFF"><%=u.getName()%></td>
    <td width="40%" rowspan="8" align="center" bgcolor="#FFFFFF"><%String path=bf.SearchHead("WHERE iid='"+u.getIid()+"'").getPath();
    if(path==null||"".equals(path)){out.print("��ͼƬ");}else{out.print("<img src=../"+path+" width=150 height=135 >");}%></td>
  </tr>
  <tr align="center">
    <td bgcolor="#FFFFFF">����汾</td>
    <td align="left" bgcolor="#FFFFFF"><%=u.getEdition()%></td>
  </tr>
  <tr align="center">
    <td bgcolor="#FFFFFF">������</td>
    <td align="left" bgcolor="#FFFFFF"><%String name=bf.SearchSsort("where sid="+u.getSid()).getName();if(name==null){out.print("��");}else{out.print(name);}%></td>
  </tr>
  <tr align="center">
    <td bgcolor="#FFFFFF">��ʽ�汾</td>
    <td align="left" bgcolor="#FFFFFF"><%=u.getRegular()==FinalConstants.STATE_REGULAR?"��ʽ��":"���ð�"%></td>
  </tr>
  <tr align="center">
    <td bgcolor="#FFFFFF">����۸�</td>
    <td align="left" bgcolor="#FFFFFF"><%=u.getPrice()%>(Ԫ)</td>
  </tr>
  <tr align="center">
    <td bgcolor="#FFFFFF">���л���</td>
    <td align="left" bgcolor="#FFFFFF"><%=u.getEnvironment()%></td>
  </tr>
  <tr align="center">
    <td bgcolor="#FFFFFF">�Ƽ�ָ��</td>
    <td align="left" bgcolor="#FFFFFF"><% for(int i=0;i<u.getCommend();i++){out.print("<img src='../images/star.gif'>");}%></td>
  </tr>
  <tr align="center">
    <td bgcolor="#FFFFFF">�����С</td>
    <td align="left" bgcolor="#FFFFFF"><%=u.getFilesize()%>(MB)</td>
  </tr>
  <tr align="center">
    <td bgcolor="#FFFFFF">��������</td>
    <td colspan="2" align="left" bgcolor="#FFFFFF"><%=u.getLoadnum()%></td>
  </tr>
  <tr align="center">
    <td bgcolor="#FFFFFF">�ϴ���</td>
    <td colspan="2" align="left" bgcolor="#FFFFFF"><%=bf.SearchUser("WHERE uid='"+u.getUid()+"'").getName()%></td>
  </tr>
  <tr align="center">
    <td bgcolor="#FFFFFF">�ϴ�ʱ��</td>
    <td colspan="2" align="left" bgcolor="#FFFFFF"><%=u.getUptime()%></td>
  </tr>
  <tr align="center">
    <td height="80" bgcolor="#FFFFFF">�������</td>
    <td colspan="2" align="left" valign="top" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;<%=u.getIntroduce()%></td>
  </tr>
  <tr align="center">
    <td height="90" bgcolor="#FFFFFF">����˵��</td>
    <td colspan="2" align="left" valign="top" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;<%=u.getResume()%></td>
  </tr>
</table>
<table width="80%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="50" colspan="5" align="right"><a href="#" onClick="Jscript:history.back()">����</a></td>
  </tr>
</table>
<%}%>
</body>
</html>
