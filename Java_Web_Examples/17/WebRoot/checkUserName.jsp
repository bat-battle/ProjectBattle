<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<%
String username=chStr.chStr(request.getParameter("username"));
ResultSet rs=connDB.executeQuery("select * from tb_member where username='"+username+"'");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>����û���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>

<body>
      <table width="90%"  border="0" cellspacing="0" cellpadding="0">
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
    </table>
</body>
</html>
