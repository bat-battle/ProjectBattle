<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.Soft" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<title>manage_soft</title>
</head>
<body bgcolor="#ffffff">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew">
  <tr align="center">
    <td colspan="6" class="TableTitle1" >�����Դ����</td>
  </tr>
  <tr align="center">
    <td colspan="5" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF"><a href="add_soft.jsp" target="_self" >��������</a></td>
  </tr>
  <tr align="center">
    <td height="27" bgcolor="#FFFFFF">������</td>
    <td bgcolor="#FFFFFF">�������</td>
    <td bgcolor="#FFFFFF">����۸�</td>
    <td bgcolor="#FFFFFF">�ϴ�ʱ��</td>
    <td bgcolor="#FFFFFF">��������</td>
    <td width="20%" bgcolor="#FFFFFF">�޸�ɾ��</td>
  </tr>
  <%BasetableFactory bf=BasetableFactory.getInstance();int submit_page=ParamUtils.getIntParameter(request,"page");
Collection coll=bf.ListSoft(submit_page,"ORDER BY sid,uptime");if(coll==null||coll.size()<=0){%>
  <tr align="center">
    <td height="27" colspan="6" bgcolor="#FFFFFF">��ǰ�����¼Ϊ��</td>
  </tr>   <%        }else{Iterator it=coll.iterator();
 while(it.hasNext()){Soft a=(Soft)it.next();%>
  <tr align="center">
    <td height="27" bgcolor="#FFFFFF"><%String name=bf.SearchSsort("where sid="+a.getSid()).getName();if(name==null){out.print("��");}else{out.print(name);}%></td>
    <td bgcolor="#FFFFFF"><a target="_self" href="info_soft.jsp?sfid=<%=a.getSfid()%>"><%=a.getName()%></a></td>
    <td bgcolor="#FFFFFF"><%=a.getPrice()%> </td>
    <td bgcolor="#FFFFFF"><%=a.getUptime()%></td>
    <td bgcolor="#FFFFFF"><%=a.getLoadnum()%></td>
    <td bgcolor="#FFFFFF"><a href="update_soft.jsp?action=modify&sfid=<%=a.getSfid()%>"><img src="../images/modify.gif" border="0"></a>&nbsp;&nbsp; <a href="modify_soft.jsp?action=del&sfid=<%=a.getSfid()%>" onClick="javascript:return confirm('��ȷ��ɾ���������')"><img src="../images/del.gif" border="0"></a></td>
  </tr>
  <%
                }
%>
  <tr align="right">
    <td height="27" colspan="6" bgcolor="#E9F2F6"><%=HtmlUtils.table(bf.getRow("soft"),submit_page,"manage_soft.jsp")%></td>
  </tr>
  <%
        }
%>
</table>
</body>
</html>
