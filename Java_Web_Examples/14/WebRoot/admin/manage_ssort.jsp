<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.Ssort" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<title>manage_ssort</title>
</head>
<body bgcolor="#ffffff"> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td colspan="3" class="TableTitle1" >���������</td> 
  </tr> 
  <tr align="center"> 
    <td colspan="2" bgcolor="#FFFFFF">&nbsp;</td> 
    <td width="30%" bgcolor="#FFFFFF"><a href="add_ssort.jsp" target="_self" >��������</a></td> 
  </tr> 
  <tr align="center"> 
    <td height="27" bgcolor="#FFFFFF">�������</td> 
    <td bgcolor="#FFFFFF">�����</td> 
    <td bgcolor="#FFFFFF">�޸�ɾ��</td> 
  </tr> 
  <%BasetableFactory bf=BasetableFactory.getInstance();int submit_page=ParamUtils.getIntParameter(request,"page");
Collection coll=bf.ListSsort(submit_page,"");if(coll==null||coll.size()<=0){%> 
  <tr align="center"> 
    <td height="27" colspan="3" bgcolor="#FFFFFF">�������¼Ϊ��</td> 
  </tr>   <%}else{Iterator it=coll.iterator();while(it.hasNext()){Ssort a=(Ssort)it.next();%> 
  <tr align="center"> 
    <td height="27" bgcolor="#FFFFFF"><%=a.getName()%></td> 
    <td bgcolor="#FFFFFF"><%=a.getResume()%></td> 
    <td bgcolor="#FFFFFF"><a href="update_ssort.jsp?action=modify&sid=<%=a.getSid()%>"><img src="../images/modify.gif" border="0"></a>&nbsp;&nbsp;<a href="modify_ssort.jsp?action=del&sid=<%=a.getSid()%>" onClick="javascript:return confirm('��ȷ��ɾ���������')"><img src="../images/del.gif" border="0"></a></td> 
  </tr>   <%}%> 
  <tr align="right"> 
    <td height="27" colspan="3" bgcolor="#E9F2F6"><%=HtmlUtils.table(bf.getRow("ssort"),submit_page,"manage_ssort.jsp")%></td> 
  </tr><%}%> 
</table> 
</body>
</html>
