<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set name="user" value="%{#request.userInfo}"/>
<title><s:property value="#session.account"/>�Ĳ��ͺ�̨����-�û���ѯ</title>
</head>

<body>
<jsp:include page="manager_top.jsp" flush="true"/>
<table width="900" height="39" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_b_top1.gif">
  <tr>
    <td width="249">&nbsp;&nbsp;<font color="#FFFFFF"><b>��ǰ��¼�û���${session.account}</b></font></td>
    <td width="651">������Ϣ��ѯ</td>
  </tr>
</table>
<table width="900" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="EBF1FD" bgcolor="#FFFFFF">
  <tr>
    <td width="194" height="339" valign="top" bgcolor="EBF1FD"><jsp:include page="manager_left.jsp" flush="true"/></td>
    <td width="700" align="center" valign="top"><br><br>    <br>
      <table width="411" height="92" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="EBF1FD">
        <tr align="center">
          <td colspan="5">�����޸ĵ���Ϣ</td>
        </tr>
        <tr align="center">
        
          <td width="91">�����</td>
		  <td width="58">���</td>
		  <td width="74">�˺�</td>
        </tr>
        <tr align="center" bgcolor="#FFFFFF">
       
          <td><s:property value="#user.vistor"/>&nbsp;��</td>        
		  <td><s:property value="#user.id"/>&nbsp;</td>         
		  <td><s:property value="#user.account"/>&nbsp;</td>          
        </tr>
		<tr align="center">
		<td height="24">������ҳ</td>
		<td colspan="4" bgcolor="#FFFFFF"><s:property value="#user.homepage"/></td>
		</tr>
      </table>
	  <br><br>
	  <table width="608" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="EBF1FD">
        <tr>
          <td height="30" colspan="6" align="center">������Ϣ�����޸ģ�</td>
        </tr> 
        <tr>
          <td width="78" height="30">��ʵ������</td>
          <td width="182" height="30" bgcolor="#FFFFFF"><s:property value="#user.realname"/></td>
          <td width="56" height="30">ְҵ��</td>
          <td width="155" height="30" bgcolor="#FFFFFF"><s:property value="#user.profession"/></td>
          <td width="125" colspan="2" rowspan="3" align="center" bgcolor="#FFFFFF"><img src="<s:property value="#user.headgif"/>"></td>
        </tr>
        <tr>
          <td height="30">Email��ַ��</td>
          <td height="30" bgcolor="#FFFFFF"><s:property value="#user.email"/></td>
          <td height="30">�Ա�</td>
          <td height="30" bgcolor="#FFFFFF"><s:property value="#user.sex"/></td>
        </tr>
        <tr>
          <td height="30">��ϵ��ַ��</td>
          <td height="30" bgcolor="#FFFFFF"><s:property value="#user.address"/></td>
          <td height="30">QQ���룺</td>
          <td height="30" bgcolor="#FFFFFF"><s:property value="#user.qq"/></td>
        </tr>
		 <tr>
          <td height="30">���˸��ԣ�</td>
          <td height="30" colspan="3" bgcolor="#FFFFFF"><s:property value="#user.self"/></td>
          <%
          	String account = session.getAttribute("account").toString();
          	String acNew = new String (account.getBytes("ISO8859-1"),"gbk");
          	System.out.println(account);
          %>
          <td height="30" align="center"><a href="userInfo_userSelectOne.htm?account=<%=account %>">�޸���Ϣ</a></td>
        </tr>		
      </table>
	  <br>
	  
	  
    </td>
  </tr>
</table>
<jsp:include flush="true" page="manager_down.jsp"/>
</body>
</html>
