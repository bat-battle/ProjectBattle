<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.Soft" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>��â�Ƽ�</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="clockon(bgclock)">
<table width="781" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
  <tr>
    <td height="165" colspan="3"><jsp:include page="top.jsp"/></td>
  </tr>
  <tr>
    <td width="11">&nbsp;</td>  
    <td width="7" align="left" valign="top"><jsp:include page="left_softsort.jsp"/></td>

    <td width="731"  align="center" valign="top">
	<table><tr bgcolor="#FFFFFF">
    <td colspan="3"  align="center" valign="top" height="5px"></td>
	</tr></table>
	<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew">
	    <tr align="center" bgcolor="#1789D5">
          <td height="27" colspan="3" class="TableTitle1">�� ��Ʒ��Ϣ ��</td>
        </tr>
        <%
BasetableFactory bf=BasetableFactory.getInstance();
String sql=ParamUtils.getRequestString(request,"sid");
if(sql!=null&&!"".equals(sql)) sql="WHERE sid="+sql;
	Collection coll=bf.ListSoft(sql);
	if(coll==null||coll.size()<0||coll.isEmpty()){%>
        <tr align="center">
          <td width="750" height="24" colspan="3" bgcolor="#FFFFFF">û����Ӹ����Ĳ�Ʒ</td>
        </tr><%}else{
        Iterator it=coll.iterator();
        while(it.hasNext()){        Soft s=(Soft)it.next();%>
        <tr>
          <td width="33%" height="24" align="center" bgcolor="#FFFFFF">��Ʒ����</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getName()%></td>
          <td width="34%" rowspan="5" align="center" bgcolor="#FFFFFF">
		  <%String path=bf.SearchHead("WHERE iid='"+StringUtils.toUnicode(s.getIid()+"'")).getPath();
		  if(path==null){out.print("��ͼƬ");
		  }else{out.print("<img src='"+path+"' width=150 height=135 >");}%></td>
        </tr>
        <tr>
          <td height="24" align="center" bgcolor="#FFFFFF">��Ʒ�汾</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getEdition()%></td>
        </tr>
        <tr>
          <td height="24" align="center" bgcolor="#FFFFFF">���л���</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getEnvironment()%></td>
        </tr>
        <tr>
          <td height="12" align="center" bgcolor="#FFFFFF">��Ʒ�۸�</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getPrice()%>(Ԫ)</td>
        </tr>
        <tr>
          <td height="12" align="center" bgcolor="#FFFFFF">�Ƽ�ָ��</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><% for(int i=0;i<s.getCommend();i++){out.print("<img src='images/star.gif'>");}%></td>
        </tr>
        <tr>
          <td height="24" align="center" bgcolor="#FFFFFF">�汾˵��</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getRegular()==1?"��ʽ��":"���ð�"%>
          <td width="34%" rowspan="5" align="left" valign="top" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;<%=s.getIntroduce()%></td>
        </tr>
        <tr>
          <td height="24" align="center" bgcolor="#FFFFFF">��Ʒ���</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=bf.SearchSsort("where sid="+s.getSid()).getName()%></td>
        </tr>
        <tr>
          <td height="12" align="center" bgcolor="#FFFFFF">�ļ���С</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getFilesize()%>MB</td>
        </tr>
        <tr>
          <td height="12" align="center" bgcolor="#FFFFFF">��������</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getLoadnum()%></td>
        </tr>
        <tr>
          <td height="24" align="center" bgcolor="#FFFFFF">�ϴ�ʱ��</td>
          <td width="33%" align="center" bgcolor="#FFFFFF"><%=s.getUptime()%></td>
        </tr>
        <tr>
          <td height="12" align="center" bgcolor="#FFFFFF">����˵��</td>
          <td colspan="2" rowspan="2" align="left" valign="top" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;<%=s.getResume()%></td>
        </tr>
        <tr>
          <td height="12" align="center" bgcolor="#FFFFFF">�������<a href="download.jsp?sfid=<%=s.getSfid()%>"><img src="images/download.gif" border="0"></a></td>
        </tr>
		<tr><td colspan="3" bgcolor="#FFFFFF">
		<hr size="1">
		</td></tr> 
		
<%}}%>
      </table></td>
  </tr>
  <tr>
    <td colspan="3" align="left" valign="top">
<jsp:include page="bottom.jsp"/>
	</td>
  </tr>
</table>
</body>
</html>
