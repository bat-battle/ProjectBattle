<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>�û���¼</title>
		<base href="<%=basePath%>">
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	<body style="background:url(images/logonBack.jpg)">
		<form action="visitor/logon" method="post">
    	<table border="0" width="400" height="160" cellspacing="0" cellpadding="0" style="margin-top:300;margin-left:350">
			<tr height="50"><td colspan="2"><c:out value="${requestScope.message}" escapeXml="false"/></td></tr>
			<tr>
				<td align="center"><font color="white"><b>�û�����</b></font></td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<td align="center"><font color="white"><b>��&nbsp;&nbsp;�룺</b></font></td>
				<td><input type="password" name="userPswd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="" style="background:url(images/logonB.jpg);border:0;width:51;height:20">
					<input type="reset" value="" style="background:url(images/resetB.jpg);border:0;width:51;height:20">
					<a href="javascript:window.close()">���رձ�ҳ��</a>
				</td>
    	</table>
    	</form>
	</body>
</html>