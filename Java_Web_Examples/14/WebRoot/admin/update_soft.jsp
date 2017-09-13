<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Soft" %>
<%@ page import="com.model.Ssort" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<title>update_soft</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<script src="../js/validate.js"></script>
<body>
<%
int uid=ParamUtils.getIntParameter(request,"sfid");
BasetableFactory bf=BasetableFactory.getInstance();
Soft u=bf.SearchSoft("WHERE sfid="+uid);
session.removeAttribute("error");
if(u.getSfid()<=0){
        session.setAttribute("error","����ʧ��");
        response.sendRedirect("error.jsp");}else{
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew">
  <form name="forms" method="post" action="modify_soft.jsp">
    <tr align="center">
      <td colspan="3" class="TableTitle1" >�����Դ�޸�</td>
    </tr>
    <tr align="center">
      <td width="23%" bgcolor="#FFFFFF">�������</td>
      <td width="37%" align="left" bgcolor="#FFFFFF"><input name="name" type="text" value="<%=u.getName()%>"></td>
      <td width="40%" rowspan="8" align="center" bgcolor="#FFFFFF"><%String path=bf.SearchHead("WHERE iid='"+u.getIid()+"'").getPath();
    if(path==null||"".equals(path)){out.print("��ͼƬ");}else{out.print("<img src=../"+path+" width=150 height=135 >");}%></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">����汾</td>
      <td align="left" bgcolor="#FFFFFF"><input name="edition" type="text" value="<%=u.getEdition()%>"></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">������</td>
      <td align="left" bgcolor="#FFFFFF"><select name="sid">
          <%Collection coll=bf.ListSsort("");if(coll==null||coll.size()<=0){    out.print("<option>��������</option>");
}else{    Iterator it=coll.iterator();    while(it.hasNext()){
        Ssort s=(Ssort)it.next();
        out.print("<option value='"+s.getSid()+"' "+(s.getSid()==u.getSid()?"selected":"")+">"+s.getName()+"</option>)");
        }}%>
      </select></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">��ʽ�汾</td>
      <td align="left" bgcolor="#FFFFFF"><input name="regular" type="radio" class="noborder" value="1" <%=u.getRegular()==1?"checked":""%>>
        ��
        <input name="regular" type="radio" class="noborder" value="0" <%=u.getRegular()==0?"checked":""%>>
      ��</td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">����۸�</td>
      <td align="left" bgcolor="#FFFFFF"> <input name="price" type="text" value="<%=u.getPrice()%>" onBlur="return pricenum()">
      (Ԫ)</td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">���л���</td>
      <td align="left" bgcolor="#FFFFFF"> <input name="environment" type="text" value="<%=u.getEnvironment()%>"></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">�Ƽ�ָ��</td>
      <td align="left" bgcolor="#FFFFFF"> <select name="commend">
          <option value="1" <%=u.getCommend()==1?"selected":""%>>1</option>
          <option value="2" <%=u.getCommend()==2?"selected":""%>>2</option>
          <option value="3" <%=u.getCommend()==3?"selected":""%>>3</option>
          <option value="4" <%=u.getCommend()==4?"selected":""%>>4</option>
          <option value="5" <%=u.getCommend()==5?"selected":""%>>5</option>
      </select></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">�����С</td>
      <td align="left" bgcolor="#FFFFFF"> <input name="filesize" type="text" value="<%=u.getFilesize()%>" onBlur="return filesizes()">
      (MB)</td>
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
      <td colspan="2" align="left" valign="top" bgcolor="#FFFFFF"><textarea name="introduce" cols="50" rows="5" class="textarea"><%=u.getIntroduce()%></textarea></td>
    </tr>
    <tr align="center">
      <td height="45" bgcolor="#FFFFFF">����˵��</td>
      <td colspan="2" align="left" valign="top" bgcolor="#FFFFFF"><textarea name="resume" cols="50" rows="5" class="textarea"><%=u.getResume()%></textarea></td>
    </tr>
    <tr align="center">
      <td height="30" colspan="3" bgcolor="#FFFFFF"> <input type="hidden" name="action" value="modify">
        <input type="hidden" name="sfid" value="<%=uid%>">
        <input name="Submit2" type="submit" class="btn_grey" onClick="return softs()" value="�ύ">
&nbsp;&nbsp;
      <input name="Submit" type="reset" class="btn_grey" value="����"> </td>
    </tr>
  </form>
</table>
<table width="80%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="50" colspan="5" align="right"><a href="#" onClick="Jscript:history.back()">����</a></td>
  </tr>
</table> <%}%>
</body>
</html>
