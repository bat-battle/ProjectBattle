<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>���������--��Դ��Ϣ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<link href="css/style.css" type="text/css" rel="stylesheet">
<s:set name="carForm" value="#request.carForm"/>         
<body>
<jsp:include page="main_top.jsp"/>






<table border="0" cellpadding="0" cellspacing="0">
  <tr>
  <td width="57">&nbsp;</td>
    <td width="637" valign="top" align="center">
	<table width="615"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="25" valign="top">��ǰλ�ã���Դ��Ϣ����&nbsp;&nbsp;>>&nbsp;&nbsp;�޸ĳ�Դ��Ϣ</td>
      </tr>
    </table>  
  <s:form action="car_updateCar">
    <table width="449" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="E4ECEF">
      <tr>
        <td width="75" height="30">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
        <td bgcolor="#FFFFFF"><s:textfield name="username" size="36" value="%{#carForm.username}"/><s:fielderror><s:param value="%{'username'}"/></s:fielderror></td>
        </tr>
      <tr>
        <td height="30">���֤�ţ�</td>
        <td bgcolor="#FFFFFF"><s:textfield name="user_number" size="36" value="%{#carForm.user_number}"/><s:fielderror><s:param value="%{'user_number'}"/></s:fielderror></td>
        </tr>
      <tr>
        <td height="30">��&nbsp;&nbsp;&nbsp;&nbsp;ַ��</td>
        <td bgcolor="#FFFFFF"><s:textfield name="address" size="36" value="%{#carForm.address}"/><s:fielderror><s:param value="%{'address'}"/></s:fielderror></td>
        </tr>
	   <tr>
        <td height="30">��&nbsp;��&nbsp;�ţ�</td>
        <td bgcolor="#FFFFFF"><s:textfield name="car_number" size="36" value="%{#carForm.car_number}"/><s:fielderror><s:param value="%{'car_number'}"/></s:fielderror></td>
        </tr>
      <tr>
        <td height="30">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
        <td bgcolor="#FFFFFF"><s:textfield name="tel" size="36" value="%{#carForm.tel}"/><s:fielderror><s:param value="%{'tel'}"/></s:fielderror></td>
        </tr>
      <tr>
        <td height="120">����·�ߣ�</td>
        <td bgcolor="#FFFFFF"><s:textarea name="car_road" rows="7" cols="30" value="%{#carForm.car_road}"/><s:fielderror><s:param value="%{'car_road'}"/></s:fielderror></td>
        </tr>
      <tr>
        <td height="120">����������</td>
        <td bgcolor="#FFFFFF"><s:textarea name="car_content" rows="7" cols="30" value="%{#carForm.car_content}"/><s:fielderror><s:param value="%{'car_content'}"/></s:fielderror></td>
        </tr>
		  <tr bgcolor="#FFFFFF">
        <td height="30" colspan="2" align="center"><s:submit value="�޸�"/>&nbsp;&nbsp;<s:reset value="����"/><s:hidden name="id" value="%{#carForm.id}"/></td>
        </tr>
    </table>
    </s:form>
	 
	 
	
  

  </td>
    <td width="115" valign="top">
	
	<jsp:include page="main_right.jsp"/>
	
	</td>
  </tr>
</table>






















<jsp:include page="main_down.jsp"/>
</body>
</html>
