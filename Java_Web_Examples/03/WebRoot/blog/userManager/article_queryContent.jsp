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
<title>${sessionScope.account}�Ĳ��ͺ�̨����-��������ѯ</title>
</head>




<body>
<jsp:include page="manager_top.jsp" flush="true"/>
<table width="900" height="39" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_b_top1.gif">
  <tr>
    <td width="249">&nbsp;&nbsp;<font color="#FFFFFF"><b>��ǰ��¼�û���${session.account}</b></font></td>
    <td width="651">${requestScope.form.title}</td>
  </tr>
</table>
<table width="900" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="EBF1FD">
  <tr>
    <td width="194" height="339" valign="top" bgcolor="EBF1FD"><jsp:include page="manager_left.jsp" flush="true"/></td>
    <td width="644" align="center" valign="top" bgcolor="#FFFFFF"><br>
      <br>     
    <br>
    <table width="602" height="94" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="EBF1FD">
      <tr>
        <td width="598" height="63" bgcolor="#FFFFFF">${requestScope.form.content}</td>
      </tr>
      <tr>
        <td height="29" bgcolor="#FFFFFF">�������${requestScope.form.typeName }&nbsp;&nbsp;&nbsp;�����ˣ�${requestScope.form.author }&nbsp;&nbsp;&nbsp;����ʱ�䣺${requestScope.form.sendTime}&nbsp;&nbsp;&nbsp;���ʴ�����${requestScope.form.visit}&nbsp;&nbsp;&nbsp;<a style="cursor:hand;" onclick="javascript:history.go(-1);">����</a></td>
      </tr>
    </table>    </td>
  </tr>
</table>
<jsp:include flush="true" page="manager_down.jsp"/>
</body>
</html>
