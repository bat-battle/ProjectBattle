<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="con" class="com.bwm.db.Conn" scope="page"/>
<jsp:useBean id="show" class="com.bwm.page.Show" scope="page"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/default.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<p align="center" style=" margin-top:30">&nbsp;</p>
<table width="500" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F5f7f7">
  <tr align="center">
    <td height="27" colspan="4" bgcolor="#21536A"><div id="reg">��ϸ��Ϣ</div></td>
  </tr>
<%
String strSid=(String)request.getParameter("sid");
String strCid=(String)request.getParameter("cid");
String strEmail=null;
if(strSid!=null){
        ResultSet rs=con.getRs("SELECT * FROM tb_student AS a,tb_sjob AS b WHERE b.jobid='"+strSid.trim()+"'  AND a.sname=b.sname");
        if(rs.next()){
%>
  <tr>
    <td height="22" align="center" >��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
    <td ><%=rs.getString(3)%></td>
    <td align="center" >��&nbsp;&nbsp;&nbsp;&nbsp;�䣺</td>
    <td ><%=rs.getInt(4)%></td>
  </tr>
  <tr>
    <td height="22" align="center" >��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
    <td ><%
                int intS=rs.getInt(5);
                if(intS==1){
                        out.print("��");
                }else{
                        out.print("Ů");
                }
%></td>
    <td align="center" >��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
    <td ><%=rs.getDate(6)%></td>
  </tr>
  <tr>
    <td height="22" align="center" >��ҵԺУ��</td>
    <td ><%=rs.getString(7)%></td>
    <td align="center" >רҵ���ƣ�</td>
    <td ><%=rs.getString(8)%></td>
  </tr>
  <tr>
    <td height="22" align="center" >���ѧ����</td>
    <td ><%=rs.getString(9)%></td>
    <td align="center" >E��mail��</td>
    <td >
<%
                        strEmail=rs.getString(10);
                        session.setAttribute("email",strEmail);
                        out.print(strEmail);
%></td>
  </tr>
  <tr>
    <td height="22" align="center" >���˼�����</td>
    <td colspan="3" ><%=rs.getString(11)%></td>
  </tr>
  <tr >
    <td height="22" align="center" >��ְ��ҵ��</td>
    <td ><%=rs.getString(14)%></td>
    <td align="center" >����ְλ�� </td>
    <td ><%=rs.getString(15)%></td>
  </tr>
  <tr >
    <td height="22" align="center" >����нˮ�� </td>
    <td ><%=rs.getString(16)%></td>
    <td align="center" >����ʱ�䣺</td>
    <td ><%=rs.getDate(17)%></td>
  </tr>
  <tr >
    <td height="22" align="center" >��Чʱ�䣺</td>
    <td ><%=rs.getDate(18)%></td>
    <td align="center" >&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr >
    <td height="22" align="center" >����˵����</td>
    <td colspan="3" ><%=rs.getString(19)%></td>
  </tr>
<%
        }else{
                show.errorBox("û�д���","������Ϣ");
        }
        rs.close();
        con.close();
}else if(strCid!=null){
        ResultSet rs=con.getRs("SELECT * FROM tb_company AS a,tb_cjob AS b WHERE b.jobid='"+strCid.trim()+"'  AND a.cname=b.cname");
                if(rs.next()){
%>
  <tr>
    <td height="22" align="center" >��ҵ���ƣ�</td>
    <td ><%=rs.getString(3)%></td>
    <td align="center" >E��mail��</td>
    <td >
<%
                        strEmail=rs.getString(4);
                        session.setAttribute("email",strEmail);
                        out.print(strEmail);
%></td>
  </tr>
  <tr>
    <td height="22" align="center" >��ϵ�绰��</td>
    <td ><%=rs.getString(5)%></td>
    <td align="center" >������ҵ��</td>
    <td ><%=rs.getString(6)%></td>
  </tr>
  <tr>
    <td height="22" align="center" >��ҵ��ַ��</td>
    <td colspan="3" ><%=rs.getString(7)%></td>
  </tr>
  <tr>
    <td height="22" align="center" > ��˾��飺 </td>
    <td colspan="3" ><%=rs.getString(8)%></td>
  </tr>
  <tr >
    <td height="22" align="center" > ������ҵ�� </td>
    <td ><%=rs.getString(11)%></td>
    <td align="center" > ��Ƹְλ�� </td>
    <td ><%=rs.getString(12)%></td>
  </tr>
  <tr >
    <td height="22" align="center" > ��ŵнˮ�� </td>
    <td ><%=rs.getString(13)%></td>
    <td align="center" >����ʱ�䣺</td>
    <td ><%=rs.getDate(14)%></td>
  </tr>
  <tr >
    <td height="22" align="center" >��Чʱ�䣺</td>
    <td colspan="3" ><%=rs.getDate(15)%></td>
  </tr>
  <tr >
    <td height="22" align="center" >����˵����</td>
    <td colspan="3" ><%=rs.getString(16)%></td>
  </tr>
<%
                }else{
                        show.errorBox("û�д���ҵ","������Ϣ");
                }
                rs.close();
                con.close();
}
%>
  <tr align="center" >
    <td height="35" colspan="4"><a href="mail/">�����ʼ�</a>&nbsp;&nbsp;&nbsp;&nbsp;<a onClick="Jscript:window.close()" style="cursor:hand; ">�رմ���</a></td>
  </tr>
</table>
</body>
</html>
