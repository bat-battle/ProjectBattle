<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.*" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>add_mend</title>
</head>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<script src="../js/validate.js"></script>
<body>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew">
  <tr align="center">
    <td colspan="2" class="TableTitle1" >����¹������</td>
  </tr>
  <form action="up_modify_mend.jsp" method="post" enctype="multipart/form-data" name="forms">
    <tr align="center">
      <td width="23%" bgcolor="#FFFFFF">�������</td>
      <td align="left" bgcolor="#FFFFFF"><input name="name" type="text" size="40"></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">������</td>
      <td align="left" bgcolor="#FFFFFF"><select name="sid">
          <%
Collection coll=BasetableFactory.getInstance().ListSsort("");
if(coll==null||coll.size()<=0){
    out.print("<option>��������</option>");
}else{
    out.print("<option>����ѡ��</option>");
    Iterator it=coll.iterator();
    while(it.hasNext()){
        Ssort s=(Ssort)it.next();
        out.print("<option value="+s.getSid()+">"+s.getName()+"</option>)");
        }
}%>
      </select></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">�������</td>
      <td align="left" bgcolor="#FFFFFF"><input name="state" type="radio" class="noborder" value="0" >
        ����
        <input name="state" type="radio" class="noborder" value="1" checked>
      ����</td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">�Ƽ�ָ��</td>
      <td align="left" bgcolor="#FFFFFF"><select name="commend">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3" selected>3</option>
          <option value="4">4</option>
          <option value="5">5</option>
      </select></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">�����С</td>
      <td align="left" bgcolor="#FFFFFF"><input name="filesize" type="text" onBlur="return filesizes()">
      (MB)</td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">�ϴ����</td>
      <td align="left" bgcolor="#FFFFFF"><input type="file" name="file"></td>
    </tr>
    <tr align="center">
      <td bgcolor="#FFFFFF">����˵��</td>
      <td align="left" bgcolor="#FFFFFF"><textarea name="resume" cols="50" rows="5" class="textarea"></textarea></td>
    </tr>
    <tr align="center">
      <td height="27" colspan="2" bgcolor="#FFFFFF"> <input type="hidden" name="action" value="add">
        <input name="Submit" type="submit" class="btn_grey" onClick="return mend()" value="�ύ">
&nbsp;&nbsp;
      <input name="Submit2" type="reset" class="btn_grey" value="����"> </td>
    </tr>
  </form>
</table>
<table width="80%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="50" colspan="5" align="right"><a href="#" onClick="Jscript:history.back()">����</a></td>
  </tr>
</table>
</body>
</html>
