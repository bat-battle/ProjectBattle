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
    <td width="778" valign="top"><br>���²�ѯ<br><br>
      <table width="692" border="0" cellspacing="0" cellpadding="0">
        <tr align="center">
          <td width="130" height="25">���±���</td>
          <td width="134">��������</td>
          <td width="96">���·�����</td>
          <td width="122">����ʱ��</td>
          <td width="93">���·��ʴ���</td>
          <td width="100">����</td>          
        </tr>
      <s:iterator value="%{#request.list}" id="article">
        <tr align="center">
          <td height="25"><s:property value="#article.title"/></td>
          <td><s:property value="#article.typeName"/></td>
          <td><s:property value="#article.author"/></td>
          <td><s:property value="#article.sendTime"/></td>
          <td><s:property value="#article.visit"/></td>
          <td><s:a href="articleInfo_admin_articleQueryOne.htm?id=%{#article.id}">��ϸ��ѯ</s:a></td>          
        </tr>
        </s:iterator>
      </table>
      <br> 
	<s:bean name="org.apache.struts2.util.Counter" id="counter">
	    <s:param name = "first" value="1"/>
	    <s:param name = "last" value="%{#request.maxPage}"/>
	    <s:iterator status="st" id="idd">
	     <s:if test="%{#request.account==null}">
	      <s:a href="articleInfo_admin_articleQuery.htm?count=%{idd}"><s:property value="id"/></s:a>
	    </s:if>
	    <s:else>
	     <s:a href="articleInfo_admin_articleQuery.htm?count=%{idd}&account=%{#request.account}"><s:property value="id"/></s:a>
	    </s:else>
	      <s:if test="!#st.last">
	      &nbsp;&nbsp;&nbsp;
	      </s:if>
	    </s:iterator>
	</s:bean>
    </td>
  </tr>
</table>
<jsp:include page="../down.jsp" flush="true"/>
</body>
</html>
