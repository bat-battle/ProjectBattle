<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="com.struts.form.UserForm;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
  <head>
    <title>��ҳ������</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
<script src="JS/DateTime2.js"></script>
<script language="javascript">
function Check()
{
if(confirm("ȷ��Ҫ���µ�¼��ϵͳ��??"))
{
window.location="index.jsp";
}
}
</script>
<script language="javascript">
function Check1()
{
	window.close();
}
</script>
<% 
    if((UserForm) session.getAttribute("uform") == null){   //���session���ڣ�����ʾ�û����µ�¼ϵͳ
    %>
    <script language="javascript">                         
         alert("����¼����ҳ�Ѿ����ڣ������µ�¼��");             
         window.location="index.jsp"
   </script>
    <%}else{                                               //���sessionû�й��ڣ���ִ�����´���
    UserForm uf =(UserForm) session.getAttribute("uform");
    application.setAttribute("Purview",uf.getUserPurview());
    application.setAttribute("un",uf.getUserName());
    %>
</head>
<body>
<table width="1003" height="114" border="0" align="center" cellpadding="0" cellspacing="0" background="Images/top_bg.jpg">
  <tr>
    <td height="67">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" height="45" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="17" colspan="3">&nbsp;</td>
        <td colspan="2">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="30%" align="center"><a href="default.jsp"  style="color:#546A3E">&nbsp;&nbsp;&nbsp;��ҳ</a></td>
              <td width="44%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="Check();return false;" style="color:#546A3E">���µ�¼</a></td>
              <td width="26%">&nbsp;&nbsp;<a href="#" onClick="Check1();return false;" style="color:#546A3E">�˳�</a></td>
            </tr>
          </table></td>
        </tr>
      <tr>
        <td width="21%">&nbsp;</td>
        <td width="55%" class="word_white">&nbsp;�û����� <%=uf.getUserName()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ȩ�ޣ�<%=uf.getUserPurview()%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ڲ��ţ�<%=uf.getUserbranch()%></td>
        <td colspan="2" class="word_white" id="Time">&nbsp;<script language="javascript">ShowDate(Time);</script></td>
        <td width="10%" class="word_white" id="Time2">&nbsp;<script language="javascript">ShowTime(Time2);</script></td>
      </tr>
    </table></td>
    </tr>
</table>
<%} %>
  </body>
</html>
