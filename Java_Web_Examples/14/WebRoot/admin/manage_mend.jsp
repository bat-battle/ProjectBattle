<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.Mend" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
<title>manage_mend</title>
</head>
<body bgcolor="#ffffff"> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew"> 
  <tr align="center"> 
    <td colspan="6" class="TableTitle1" >����/�������ع���</td> 
  </tr> 
  <tr align="center"> 
    <td colspan="5" bgcolor="#FFFFFF">&nbsp;</td> 
    <td bgcolor="#FFFFFF"><a href="add_mend.jsp" target="_self" >��ӹ���/�������</a></td> 
  </tr> 
  <tr align="center"> 
    <td height="27" bgcolor="#FFFFFF">������</td> 
    <td bgcolor="#FFFFFF">�������</td> 
    <td bgcolor="#FFFFFF">�ϴ�ʱ��</td> 
    <td bgcolor="#FFFFFF">��������</td> 
    <td bgcolor="#FFFFFF">�������</td> 
    <td width="20%" bgcolor="#FFFFFF">�޸�ɾ��</td> 
  </tr> 
  <%BasetableFactory bf=BasetableFactory.getInstance();int submit_page=ParamUtils.getIntParameter(request,"page");
Collection coll=bf.ListMend(submit_page,"");if(coll==null||coll.size()<=0){%> 
  <tr align="center"> 
    <td height="27" colspan="6" bgcolor="#FFFFFF">��ǰ����/�������ؼ�¼Ϊ��</td> 
  </tr> 
  <%        }else{            Iterator it=coll.iterator();while(it.hasNext()){
                Mend a=(Mend)it.next();%> 
  <tr align="center"> 
    <td height="27" bgcolor="#FFFFFF"><%String name=bf.SearchSsort("where sid="+a.getSid()).getName();if(name==null){out.print("��");}else{out.print(name);}%></td> 
    <td bgcolor="#FFFFFF"><a href="info_mend.jsp?mid=<%=a.getMid()%>"><%=a.getName()%></a></td> 
    <td bgcolor="#FFFFFF"><%=a.getUptime()%></td> 
    <td bgcolor="#FFFFFF"><%=a.getLoadnum()%></td> 
    <td bgcolor="#FFFFFF"><%=a.getState()==FinalConstants.STATE_MEND?"����":"����"%></td> 
    <td bgcolor="#FFFFFF"><a href="update_mend.jsp?action=modify&mid=<%=a.getMid()%>"><img src="../images/modify.gif" border="0"></a>&nbsp;&nbsp; <a href="modify_mend.jsp?action=del&mid=<%=a.getMid()%>" onClick="javascript:return confirm('��ȷ��ɾ���ù��������')"><img src="../images/del.gif" border="0"></a></td> 
  </tr> 
  <%}%> 
  <tr align="right"> 
    <td height="27" colspan="6" bgcolor="#E9F2F6"><%=HtmlUtils.table(bf.getRow("mend"),submit_page,"manage_mend.jsp")%></td> 
  </tr>   <%        }%> 
</table> 
</body>
</html>
