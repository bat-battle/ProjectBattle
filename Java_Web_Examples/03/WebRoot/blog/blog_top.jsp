<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@taglib prefix ="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<table width="900" height="36" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_top1.gif">
  <tr>
    <td align="right">
	��ӭ���� | <a href="dealwith.jsp">�˳��ò���</a> 
    <s:if test="%{#session.account!=null}">
        | <a href="userInfo_goinUserManager.htm">�����ҵĲ���</a>
    </s:if>
    &nbsp;&nbsp;&nbsp;	
	</td>
  </tr>
</table>
<table width="900" height="50" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_top2.gif">
  <tr>
    <td width="319"><table width="214" border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
        <td width="214" height="22">		
		<font color="#FFFFFF"><b>		
		<s:property value="%{#session.userInfo.account}"/>�Ĳ���<br>
		<%=basePath%><s:property value="%{#session.userInfo.account}"/>
		</b></font></td>
      </tr>
    </table></td>
    <td width="581">&nbsp;</td>
  </tr>
</table>
<table width="210" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/b_top3.gif" width="900" height="149"></td>
  </tr>
</table>













<table width="900" height="33" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_top4.gif">
  <tr>
    <td width="376" height="34" align="right">���ã���ӭ����<s:property value="%{#session.userInfo.account}"/>�Ĳ������磡ף�������и������飡</td>
    <td width="524">
	<table width="423" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr align="center">
    <td height="20"><s:a href="userInfo_goinUser.htm?account=%{#session.userInfo.account}">�ҵ�����</s:a>&nbsp;&nbsp;|&nbsp;&nbsp;<s:a href="photoInfo_fphoto_query.htm">�ҵ����</s:a>&nbsp;&nbsp;|&nbsp;&nbsp;<s:a href="blog/blog_individual.jsp?topId=2">�ҵ�����</s:a>&nbsp;&nbsp;|&nbsp;&nbsp;<s:a href="blog/blog_friends.jsp?topId=2">�ҵĺ���</s:a></td>
    </tr>
</table>
	
	</td>
  </tr>
</table>



