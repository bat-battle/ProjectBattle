<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ taglib prefix="s2" uri="/struts-tags" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>

<html>
<head>
    <title>����Ա��¼</title>
    <base href="<%=basePath%>">
    <link type="text/css" rel="stylesheet" href="<s2:url value='css/style.css'/>">
</head>
<body bgcolor="#E7ECEF">
    <center>
        <s2:form action="log_Login.action" theme="simple">
            <table border="0" cellspacing="0" cellpadding="0" style="margin-top:130">
                <tr><td><img src="images/logon_top.gif"></td></tr>                
                <tr height="180">
                    <td background="images/logon_middle.gif" align="center" valign="top">
                         <table border="0" width="90%" cellspacing="0" cellpadding="0">
                             <tr height="50"><td colspan="2"><s2:fielderror/></td></tr>
                             <tr height="30">
                                 <td align="right" width="40%">�û�����&nbsp;&nbsp;</td>
                                 <td style="text-indent:5"><s2:textfield name="user.userName" size="30"/></td>
                             </tr>                
                             <tr height="30">
                                 <td align="right">��&nbsp;&nbsp;�룺&nbsp;&nbsp;</td>
                                 <td style="text-indent:5"><s2:password name="user.userPassword" size="30"/></td>
                             </tr>
                             <tr height="60">
                                 <td></td>
                                 <td>
                                     <s2:submit value="��¼"/>
                                     <s2:reset value="����"/>
                                     <s2:a href="index.jsp">[������ҳ]</s2:a>
                                 </td>
                             </tr>
                         </table>
                    </td>
                </tr>
                <tr><td><img src="images/logon_end.gif"></td></tr>
            </table>
        </s2:form>     
    </center>
</body>
</html>