<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.core.*" %>
<%@ page import="com.model.Mend" %><%
BasetableFactory bf=BasetableFactory.getInstance();
String action=ParamUtils.getRequestString(request,"action");
String nid=ParamUtils.getRequestString(request,"sid");if("".equals(action)) return;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>���տƼ�</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="clockon(bgclock)">
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0"  class="tableBorder">
  <tr>
    <td height="165" colspan="3"><jsp:include page="top.jsp"/></td>
  </tr>
  <tr>
    <td width="11">&nbsp;</td>  
    <td width="173" align="left" valign="top"><jsp:include page="left_tools.jsp"><jsp:param name="action" value="<%=action%>" /></jsp:include></td>
    <td width="570"  align="center" valign="top"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#D4D0C8" class="tableNew">
        <tr align="center">
          <td colspan="2" class="TableTitle1" >���������ϸ��Ϣ</td>
        </tr>
        <%if("tool".equals(action)){
        if(!"".equals(nid)){
            nid="WHERE state="+FinalConstants.STATE_TOOL+" AND sid='"+nid+"'";
        }else{            nid="WHERE state="+FinalConstants.STATE_TOOL;
        }}else if("mend".equals(action)){
        if(!"".equals(nid)){
            nid="WHERE state="+FinalConstants.STATE_MEND+" AND sid='"+nid+"'";
        }else{            nid="WHERE state="+FinalConstants.STATE_MEND;
        }}Collection coll=bf.ListMend(nid);
if(coll==null||coll.size()<=0||coll.isEmpty()){%>
        <tr align="center">
          <td colspan="2" bgcolor="#FFFFFF">û�й������</td>
        </tr><%
}else{    Iterator it=coll.iterator();
    while(it.hasNext()){        Mend n=(Mend)it.next();%>
        <tr align="center">
          <td width="20%" bgcolor="#FFFFFF">�������</td>
          <td width="60%" align="left" bgcolor="#FFFFFF"><%=n.getName()%> </td>
        </tr>
        <tr align="center">
          <td bgcolor="#FFFFFF">������</td>
          <td align="left" bgcolor="#FFFFFF"><%=bf.SearchSsort("where sid="+n.getSid()).getName()%></td>
        </tr>
        <tr align="center">
          <td height="4" bgcolor="#FFFFFF">�������</td>
          <td height="4" align="left" bgcolor="#FFFFFF"><%=n.getState()==FinalConstants.STATE_MEND?"����":"����"%></td>
        </tr>
        <tr align="center">
          <td height="1" bgcolor="#FFFFFF">�Ƽ�ָ��</td>
          <td height="0" align="left" bgcolor="#FFFFFF"><% for(int i=0;i<n.getCommend();i++){out.print("<img src='images/star.gif'>");}%></td>
        </tr>
        <tr align="center">
          <td height="2" bgcolor="#FFFFFF">�����С</td>
          <td height="0" align="left" bgcolor="#FFFFFF"><%=n.getFilesize()%></td>
        </tr>
        <tr align="center">
          <td height="3" bgcolor="#FFFFFF">�ϴ�ʱ��</td>
          <td height="0" align="left" bgcolor="#FFFFFF"><%=n.getUptime()%></td>
        </tr>
        <tr align="center">
          <td height="3" bgcolor="#FFFFFF">���ش���</td>
          <td height="3" align="left" bgcolor="#FFFFFF"><%=n.getLoadnum()%></td>
        </tr>
        <tr align="center">
          <td bgcolor="#FFFFFF">��������</td>
          <td height="7" rowspan="2" align="left" valign="top" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;<%=n.getResume()%></td>
        </tr>
        <tr align="center">
          <td height="12" align="center" bgcolor="#FFFFFF">�������<a href='download.jsp?mid=<%=n.getMid()%>'><img src="images/download.gif" border="0"></a></td>
        </tr>         <%}}%>
    </table></td>
  </tr>
  <tr>
    <td colspan="3" align="center"><jsp:include page="bottom.jsp"/></td>
  </tr>
</table>
</body>
</html>
