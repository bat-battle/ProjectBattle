<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String username=chStr.chStr(request.getParameter("username"));
ResultSet rs=conn.executeQuery("select * from tb_member where username='"+username+"'");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>����û���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>

<body>
      <table width="100%" height="125" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td height="7" align="center">&nbsp;</td>
        </tr>	  
	  <%
	  if(rs.next()){
	  %>

        <tr>
          <td height="45" align="center"><%out.println("�ܱ�Ǹ!<br><br>["+username+"]�û����Ѿ���ע��!");%></td>
        </tr>
	<%}else{%>
        <tr>
          <td height="56" align="center"><%out.println("ף����!<br><br>["+username+"]�û���û�б�ע��!");%></td>
        </tr>	
	<%}%>
        <tr>
          <td height="30" align="center"><input name="Button" type="button" class="btn_bg_short" onClick="window.close();" value="�ر�"></td>
        </tr>		
</table>
</body>
</html>
