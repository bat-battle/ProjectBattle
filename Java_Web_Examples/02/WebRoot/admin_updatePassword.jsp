<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��������������޸Ĺ���Ա����</title>
</head>
<link href="css/style.css" type="text/css" rel="stylesheet">
<%
String admin=(String)session.getAttribute("admin_user");
%>
<body>
<jsp:include page="main_top.jsp"/>



<table border="0" cellpadding="0" cellspacing="0">
  <tr>
  <td width="57">&nbsp;</td>
    <td width="637" valign="top" align="center">
	<table width="615"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="25" valign="top">��ǰλ�ã�&nbsp;�޸Ĺ���Ա����</td>
      </tr>
    </table>  

	   <s:form action="admin_updatePassword">
        <table width="364" height="138" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="E4ECEF">
          <tr>
            <td width="107">ԭ&nbsp;��&nbsp;�룺</td>
            <td width="251" bgcolor="#FFFFFF" ><s:password name="admin_password"/><s:fielderror><s:param value="%{'admin_password'}"/></s:fielderror></td>
          </tr>
          <tr>
            <td>��&nbsp;��&nbsp;�룺</td>
            <td bgcolor="#FFFFFF"><s:password name="admin_repassword1"/><s:fielderror><s:param value="%{'admin_repassword1'}"/></s:fielderror></td>
          </tr>
          <tr>
            <td>����ȷ�ϣ�</td>
            <td bgcolor="#FFFFFF"><s:password name="admin_repassword2"/><s:fielderror><s:param value="%{'admin_repassword2'}"/></s:fielderror></td>
          </tr>
          <tr align="center" bgcolor="#FFFFFF">
            <td colspan="2"><s:hidden name="admin_user" value="%{#session.admin_user}"/><s:submit value="�޸�"/>&nbsp;&nbsp;<s:reset value="����"/></td>
          </tr>
    </table>
    </s:form>  
           <s:actionerror/>
           <%
           if(request.getAttribute("editPassword")!=null){
        	 String  editPassword=(String)request.getAttribute("editPassword");
        	 out.print("<script language=javascript>alert('"+editPassword+"');window.location.href='admin_loginout.jsp';</script>");
           } 
           %>
	 
	
  

  </td>
    <td width="115" valign="top">
	
	<jsp:include page="main_right.jsp"/>
	
	</td>
  </tr>
</table>


















<jsp:include page="main_down.jsp"/>
</body>
</html>
