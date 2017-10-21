<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	response.addHeader("Pragma","No-cache");
	response.addHeader("Cache-Control","no-cache");
	response.addDateHeader("Expires",1);

	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>�鿴��������</title>
		<base href="<%=basePath%>">
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<center>
			<table border="0" width="1003" height="299" cellpadding="0" cellspacing="0"><tr><td background="images/top.jpg"></td></tr></table>
    		<c:set var="master" value="${sessionScope.callBlogMaster}"/>

     		<c:if test="${empty master}">
   			<table border="10" width="1003" height="167" background="images/allBack.jpg" bordercolor="#4E6900" style="margin-top:1;margin-bottom:1"><tr><td align="center">���� �Բ��𣬲鿴��������ʧ�ܣ�����</td></tr></table>
     		</c:if>

     		<c:if test="${!empty master}">
    		<table border="1" rules="none" width="1003" height="167" background="images/allBack.jpg" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" cellspacing="0" cellpadding="0" style="margin-top:1">
	      		<tr height="50"><td colspan="2">���������ϡ�</td></tr>
	       		<tr height="20"><td colspan="2">ͷ��</td></tr>
	       		<tr><td colspan="2"><img src="images/ico/${master.userIco}" width="237" height="140" style="border:1 solid"></td></tr>
	       		<tr height="40">
	       			<td width="10%" align="right" style="padding-right:20">������</td>
	       			<td><c:out value="${master.userName}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">�Ա�</td>
	       			<td><c:out value="${master.userSex}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">OICQ��</td>
	       			<td><c:out value="${master.userOicq}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">E-mail��</td>
	       			<td><c:out value="${master.userEmail}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">���ԣ�</td>
	       			<td><c:out value="${master.userFrom}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">���ͣ�</td>
	       			<td><c:out value="${master.userBlogName}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">ǩ����</td>
	       			<td><c:out value="${master.userMotto}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">����ʱ�䣺</td>
	       			<td><c:out value="${master.userCTTime}"/></td>
	       		</tr>
	       		<tr height="30">
	       			<td align="right" style="padding-right:20">���ʴ�����</td>
	       			<td><c:out value="${master.userHitNum}"/> ��</td>
	       		</tr>
		   	</table>
       		</c:if>
			<table border="0" width="1003" height="128" cellpadding="0" cellspacing="0"><tr><td background="images/end.jpg"></td></tr></table>
    	</center>
	</body>
</html>