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
<%
int rid=ParamUtils.getIntParameter(request,"rid");
BasetableFactory bf=BasetableFactory.getInstance();
Resolvent r=bf.SearchResolvent("WHERE rid="+rid);
if(r.getRid()<=0){
        session.setAttribute("error","����ʧ��");
        response.sendRedirect("errorw.jsp");
}else{
%>
<script>
function ur(){
        document.form3.onse.value="on";
        document.form3.action="";
        document.form3.submit();
}
</script>
<body>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew">
  <form action="modify_resolvent.jsp" method="post" name="form3">
    <tr align="center">
      <td colspan="2" class="TableTitle1" >�޸Ľ������</td>
    </tr>
    <tr align="center">
      <td width="30%" bgcolor="#FFFFFF">��������</td>
      <td width="60%" align="left" bgcolor="#FFFFFF"> <input name="name" type="text" size="50" value="<%=r.getName()%>"> </td>
    </tr>
    <tr align="center">
      <td height="27" bgcolor="#FFFFFF">����������</td>
      <input type="hidden" name="onse">
      <td align="left" bgcolor="#FFFFFF"><select name="sid" onChange="ur()">
          <%
        int sid=ParamUtils.getIntParameter(request,"sid");
        if(!"on".equals(ParamUtils.getParameter(request,"onse"))) if(sid==0) sid=r.getSid();
        Collection coll=bf.ListSsort("");
        if(coll==null||coll.size()<=0){
                out.print("<option value='-1'>���ޡ�</option>");
        }else{
                out.print("<option>����ѡ��</option>");
                Iterator it=coll.iterator();
                while(it.hasNext()){
                Ssort s=(Ssort)it.next();
                        out.print("<option value='"+s.getSid()+"' "+(sid==s.getSid()?"selected":"")+">"+s.getName()+"</option>)");
                }
        }
%>
      </select></td>
    </tr>
    <tr align="center">
      <td height="27" bgcolor="#FFFFFF">ʵ��Ӧ��</td>
      <td align="left" bgcolor="#FFFFFF"><select name="sfid">
          <%
        Collection col=bf.ListSoft("WHERE sid="+sid);
        int sfid=ParamUtils.getIntParameter(request,"sfid");
        if(sfid==0) sfid=r.getSfid();
        if(col==null|col.size()<=0){
                out.print("<option value='-1'>���ޡ�</option>");
        }else{
                out.print("<option>����ѡ��</option>");
                Iterator it=col.iterator();
                while(it.hasNext()){
                        Soft s=(Soft)it.next();
                        out.print("<option value='"+s.getSfid()+"'"+(sfid==s.getSfid()?"selected":"")+" >"+s.getName()+"</option>)");
                }
        }
%>
      </select></td>
    </tr>
    <input type="hidden" name="haction" value="modify">
    <tr align="center">
      <td height="27" colspan="2" bgcolor="#FFFFFF">�������</td>
    </tr>
    <tr align="center">
      <td height="14" colspan="2" bgcolor="#FFFFFF"><textarea name="content" cols="80" rows="20" class="textarea"><%=r.getContent()%></textarea></td>
    </tr>
    <tr align="center">
      <td height="2" colspan="2" bgcolor="#FFFFFF"><%String path=bf.SearchHead("WHERE iid='"+r.getIid()+"'").getPath();if(path==null){out.print("��ͼƬ");}else{out.print("<img src=../"+path+" width=300 height=260>");}%></td>
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
      <td height="6" colspan="2" bgcolor="#FFFFFF"> <input type="hidden" name="uid" value='<%=((User)session.getAttribute("user")).getUid()%>'>
        <input name="Submit" type="submit" class="btn_grey" value="�ύ">
&nbsp;&nbsp;
      <input name="Submit2" type="reset" class="btn_grey" value="����"></td>
    </tr>
    <input type="hidden" name="rid" value='<%=r.getRid()%>'>
  </form>
</table>
<table width="80%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="50" colspan="5" align="right"><a href="#" onClick="Jscript:history.back()">����</a></td>
  </tr>
</table>
<%}%>
</body>
</html>
