<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="con" class="com.bwm.db.Conn" scope="page"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>
<body background="images/bg.jpg">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="27" colspan="3" align="right"><div id="link"></div></td>
  </tr>
  <tr>
    <td width="1" height="36" background="images/gbnavl.gif"></td>
    <td width="99%" background="images/gbnavm.gif"><div id="link1"><a href="student/">ѧ��ע��</a> <a href="company/">��ҵע��</a></div></td>
    <td width="1" background="images/gbnavr.gif"></td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="50"  bgcolor="#FFFFFF"><div id="top"><img src="images/top.gif" width="340" height="38"></div></td>
  </tr>
</table>
<table width="100%" height="400"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr align="center" >
        <td width="50%" height="22"><div id="font1">ѧ����ְ</div></td>
        <td width="50%" height="22"><div id="font1">��ҵ��Ƹ</div></td>
      </tr>
      <tr>
        <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
<%
ResultSet rs=con.getRs("SELECT a.jobid,b.name,b.school,b.specialty,b.knowledge,a.job,a.emolument FROM tb_sjob AS a,tb_student AS b WHERE a.sname=b.sname and getdate()<=atime ORDER BY ptime DESC");
        while(rs.next()){
%>
      <tr>
        <td valign="top"><font id="reg">&lt;&lt;</font><a target="_blank" href="view.jsp?sid=<%=rs.getString(1)%>">[<%=rs.getString(2)%>]��ҵ��[<%=rs.getString(3)%>��<%=rs.getString(4)%>��<%=rs.getString(5)%>]������[<%=rs.getString(6)%>]ְλ��Ҫ��нˮ[<%=rs.getString(7)%>]��</a>&nbsp;</td>
      </tr>
<%
        }
        con.close();
%>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table></td>
        <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
<%
rs=con.getRs("SELECT a.jobid,b.name,b.manage,a.job,a.emolument FROM  tb_cjob AS a,tb_company AS b WHERE a.cname=b.cname and getdate()<=atime ORDER BY ptime DESC");
        while(rs.next()){
%>
      <tr>
        <td valign="top"><font id="reg">&gt;&gt;</font><a  target="_blank" href="view.jsp?cid=<%=rs.getString(1)%>">[<%=rs.getString(2)%>]��Ҫ��Ӫ[<%=rs.getString(3)%>]����Ƹ[<%=rs.getString(4)%>]ְλ����ŵнˮ[<%=rs.getString(5)%>]��</a></td>
      </tr>
<%
        }
        con.close();
%>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table></td>
      </tr>
    </table></td>
    <td width="180" rowspan="2" valign="top" bgcolor="#F5f7f7"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
        <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="22" colspan="2" align="center"  background="images/tdbg.jpg"><div id="font1">��¼���</div></td>
          </tr>
          <form name="form1" method="post" action="login.jsp"><tr>
            <td width="37%" height="22" align="center">�û�����</td>
            <td width="63%">
              <input name="username" type="text" size="12">
            </td>
          </tr>
          <tr>
            <td height="22" align="center">��&nbsp;&nbsp;�룺</td>
            <td height="22"><input name="password" type="password" size="12"></td>
          </tr>
          <tr align="center">
            <td height="30" colspan="2">
              <input name="select" type="radio" value="student" checked >
              ѧ��
              <input type="radio" name="select" value="company">
              ��ҵ</td>
          </tr>
          <tr align="center">
            <td height="30" colspan="2">
              <input type="submit" name="Submit2" value="����">
              &nbsp;
<input name="Submit" type="reset" value="����"></td>
          </tr></form>
        </table></td>
      </tr>
<tr>
        <td><table width="100%"  border="0" cellpadding="0" cellspacing="0" background="images/tdbg.jpg" >
          <tr>
            <td height="27"><div id="font1">��������</div></td>
          </tr>
<%
rs=con.getRs("SELECT address,name FROM tb_flink");
        while(rs.next()){
%>
          <tr>
            <td height="22"><div id="link2"><a href="<%=rs.getString(1)%>" target="_blank"><%=rs.getString(2)%></a></div></td>
          </tr>
<%
        }
        con.close();
%>
        </table></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="1"bgcolor="#FFFFFF"><hr size="1" color="#CC3300" style="position:absolute;"></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF">&nbsp;<a href="mailto:mingrisoft@163.com">��ϵ��վ</a> | <a href="admin/">����Ա���</a> | &copy;2004 MingRi </td>
  </tr>
</table>
</body>
</html>