<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">   
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���ղ��͵ش�-��̨��ҳ-���²�ѯ</title>
</head>
<body>
<jsp:include page="../top.jsp" flush="true"/>
<table width="900" height="303" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="F7FAFF">
  <tr align="center">
    <td width="116" valign="top"><table width="98" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#3399CC">
	 <s:iterator value="%{#request.authorList}" id="author">
      <tr>
        <td height="30" align="center" bgcolor="#FFFFFF"><s:a href="articleInfo_admin_articleQuery.htm?account=%{#author}"><s:property value="#author"/></s:a></td>
      </tr>
	  </s:iterator>
    </table></td>
    <td width="778" valign="top"><br>  &nbsp;
      ${requestScope.articleInfo.title}
	  <br><br>
	  <table width="709" height="113" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>${requestScope.articleInfo.content}</td>
        </tr>
        <tr>
          <td height="30" align="center">�����ˣ�${requestScope.articleInfo.author}&nbsp;&nbsp;&nbsp;&nbsp;����ʱ�䣺${requestScope.articleInfo.sendTime}&nbsp;&nbsp;&nbsp;&nbsp;�������ͣ�${requestScope.articleInfo.typeName}&nbsp;&nbsp;&nbsp;&nbsp;�Ƿ��Ƽ���<s:a href="articleInfo_admin_articleQueryOne.htm?id=%{#request.articleInfo.id}&commend=1">${requestScope.articleInfo.commend}</s:a>&nbsp;&nbsp;&nbsp;&nbsp;���ʴ�����${requestScope.articleInfo.visit}</td>
        </tr>
      </table>  
      <table width="652" height="24" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="24" align="right"><a style="cursor:hand;" onclick="javascript:history.go(-1);">����</a></td>
        </tr>
      </table></td>
  </tr>
</table>
<jsp:include page="../down.jsp" flush="true"/>
</body>
</html>
