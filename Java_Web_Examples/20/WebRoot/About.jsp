<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<html>
<head>
<title>�����������ۼ�����վ</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="session" class="cars.Bean1" />
<jsp:useBean id="bottom" scope="session" class="cars.Bean3" />
<%!
	ResultSet rs;
	String sql;
	int i;
%>
<link rel="stylesheet" href="Css/style.css">
<Script src="Js/PopMenu.js"></script>
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<%@ include file="Top.jsp" %>
<table width="740" height="700" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td height="20" valign="bottom" bgcolor="#ffcc99"> &nbsp;δ �� չ ��</td>
  </tr>
  <tr>
    <td height="330" align="center" valign="middle">
    <div align="left" style="height:310;width:720;position:inherit ">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<%
	sql="select * from tb_News where Title='δ��չ��'";
	rs=data.getrs(sql);
	rs.beforeFirst();
	if(rs.next()){
		out.write(rs.getString("Content"));
	}
	data.close();
	%>
	</div></td>
  </tr>
  <tr>
    <td height="20" valign="bottom" bgcolor="#ffcc99">&nbsp;�� ʷ �� ��</td>
  </tr>
  <tr>
    <td height="330" align="center" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;
    <div align="left" style="height:310;width:720;position:inherit ">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<%
	sql="select * from tb_News where Title='��ʷ�ع�'";
	rs=data.getrs(sql);
	rs.beforeFirst();
	if(rs.next()){
		out.write(rs.getString("Content"));
	}
	data.close();
	%>
	</div></td>
  </tr>
</table>
<table width="744" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="center">�������̱�־</div></td>
  </tr>
</table>
<table width="744" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="center">
      <p><%=bottom.seturl("����ʡ���������տƼ����޹�˾","www.mingrisoft.com")%> <a style="color:#000000;" onDblClick="javascript:window.open('M_Login.jsp','','width=528,height=218,toolbar=no,location=no,status=no,menubar=no')">ϵͳ����</a><%=bottom.setnumbers("0431-4972266")%><br>
        <%=bottom.setemail("mingrisoft@mingrisoft.com")%><br>
        Copyright &copy; 2005-2008</p>
    </div></td>
  </tr>
</table>
</body>
</html>
