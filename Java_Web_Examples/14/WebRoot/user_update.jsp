<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.core.*" %>
<%@ page import="com.model.User" %>
<%
User u=(User)session.getAttribute("user");
if(u==null){        response.sendRedirect("user_logon.jsp");}else{%>
<html>
<head>
<title>�û��޸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<link href="css/css.css" rel="stylesheet" type="text/css">
<script src="js/validate.js"></script>
<body bgcolor="#ffffff">
<table width="630" border="0" cellspacing="0" cellpadding="0" class="tableBorder6">
  <tr>
    <td height="165"><jsp:include page="top.jsp" /></td>
  </tr>
  <tr><td height="9"></td></tr>
  <tr>
    <td height="235"> <form method="post" action="user_modify.jsp" name="formr">
        <table width="97%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew" style="padding-left:5px;">
          <tr align="center">
            <td height="29" colspan="3" class="TableTitle1">�û��޸���Ϣ</td>
          </tr>
          <tr>
            <td width="140" height="27" bgcolor="#FFFFFF">�û���</td>
            <td width="230" bgcolor="#FFFFFF"><%=u.getUid()%></td>
            <td width="227" rowspan="13" valign="top" bgcolor="#FFFFFF" class="Redfont">ע�⣺
                <ul>
    һ����*��Ϊ�����
                </ul>
                <ul>
    ��������ֻ����������ɡ�
                </ul>
                <ul>
    ����Email������д��ȷ��ʽ��<br>
    �磺mingrisoft@mingrisoft.com
                </ul>
                <ul>
    �ġ�����ͷ���е�ͼƬ����ѡ����Ҫ��ͷ��
��
            </ul></td>
          </tr>
          <tr>
            <td height="13" bgcolor="#FFFFFF">�����޸�</td>
            <td bgcolor="#FFFFFF"><input type="password" name="password" >
            <span class="Redfont">*</span></td>
          </tr>
          <tr>
            <td height="13" bgcolor="#FFFFFF">����ȷ��</td>
            <td bgcolor="#FFFFFF"><input type="password" name="repassword">
            <span class="Redfont">*</span></td>
          </tr>
          <tr>
            <td height="27" bgcolor="#FFFFFF">��ʵ����</td>
            <td bgcolor="#FFFFFF"><input type="text" name="name" value="<%=u.getName()%>">
            <span class="Redfont">*</span></td>
          </tr>
          <tr>
            <td height="27" bgcolor="#FFFFFF">ȡ��������ʾ</td>
            <td bgcolor="#FFFFFF"><input type="text" name="regqu" value="<%=u.getRegqu()%>">
            <span class="Redfont">*</span></td>
          </tr>
          <tr>
            <td height="27" bgcolor="#FFFFFF">ȡ������ش�</td>
            <td bgcolor="#FFFFFF"><input type="text" name="reganswer" value="<%=u.getReganswer()%>">
            <span class="Redfont">*</span></td>
          </tr>
          <tr>
            <td height="27" bgcolor="#FFFFFF">�Ա�</td>
            <td bgcolor="#FFFFFF"><input name="sex" type="radio" class="noborder" value="1" <%=u.getSex()==1?"checked":""%>>
              ��
              <input name="sex" type="radio" class="noborder" value="0" <%=u.getSex()==0?"checked":""%>>
            Ů</td>
          </tr>
          <tr>
            <td height="27" bgcolor="#FFFFFF">����</td>
            <td bgcolor="#FFFFFF"><input type="text" name="age" onBlur="ages()" value="<%=u.getAge()%>">
            <span class="Redfont">*</span></td>
          </tr>
          <tr>
            <td height="27" bgcolor="#FFFFFF">�绰</td>
            <td bgcolor="#FFFFFF"><input type="text" name="tel" value="<%=u.getTel()%>"></td>
          </tr>
          <tr>
            <td height="27" bgcolor="#FFFFFF">Email</td>
            <td bgcolor="#FFFFFF"><input type="text" name="email" value="<%=u.getEmail()%>">
            <span class="Redfont">*</span></td>
          </tr>
          <tr>
            <td height="27" bgcolor="#FFFFFF">QQ</td>
            <td bgcolor="#FFFFFF"><input type="text" name="qq" value="<%=u.getQq()%>"></td>
          </tr>
          <tr>
            <td height="27" bgcolor="#FFFFFF">���˵�ַ</td>
            <td bgcolor="#FFFFFF"><input type="text" name="address" value="<%=u.getAddress()%>"></td>
          </tr>
          <tr>
            <td height="27" bgcolor="#FFFFFF">������ҳ</td>
            <td bgcolor="#FFFFFF"><input type="text" name="http" value="<%=u.getHttp()%>"></td>
          </tr>
          <tr>
            <td height="22" bgcolor="#FFFFFF">���˼��</td>
            <td colspan="2" bgcolor="#FFFFFF"><textarea name="resume" cols="30" rows="5"><%=u.getResume()%></textarea> </td>
            <input type="hidden" name="action" value="updates">
          </tr>
          <tr>
            <td height="50" bgcolor="#FFFFFF">ͷ��</td>
            <td colspan="2" bgcolor="#FFFFFF"><a onClick="javascript:window.open('head.jsp','Menuhead','location=no,scrollbars=no,menubars=no,toolbars=no,resizable=yes,left=200,top=200,width=700,height=400');" class="delink"><img src=<%String path=BasetableFactory.getInstance().SearchHead("WHERE iid='"+u.getIid()+"'").getPath(); if(path==null){out.println("images/ico/select.gif");}else{out.println(path);}%> alt="����޸�ͷ��"  name="ico" width=64 height=64></a>
            <input type="hidden" name="iid" value="<%=u.getIid()%>"></td>
          </tr>
          <tr align="center">
            <td height="22" colspan="3" bgcolor="#FFFFFF"> <input name="Submit" type="submit" class="btn_grey" onClick="return updates()" value="�޸�"></td>
          </tr>
          <input type="hidden" name="uid" value="<%=u.getUid()%>">
        </table>
      </form></td>
  </tr>
  <tr>
    <td align="center"><jsp:include page="bottom.jsp"/></td>
  </tr>
</table>
</body>
</html>
<%}%>
