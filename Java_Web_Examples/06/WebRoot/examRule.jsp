<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%if(session.getAttribute("student")==null){
	response.sendRedirect("../index.jsp");
}%>
<html>
<head>
<title>�������߿���</title>
<html:base />
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>

<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="131" background="Images/top_bg.jpg">&nbsp;</td>
  </tr>
</table>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="774" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="76%" class="word_grey">&nbsp;<img src="Images/f_ico.gif" width="8" height="8"> ��ǰλ�ã��� <span class="word_darkGrey">���߿��� �� ���Թ��� &gt;&gt;&gt;</span></td>
			  <td width="24%" align="right"><img src="Images/m_ico1.gif" width="5" height="9">
			    <html:link page="/default.jsp" >������ҳ</html:link>&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
<html:form action="/manage/lesson.do?action=selectLesson" method="post">
 <table width="100%" height="253"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="81" colspan="3" align="center" class="word_orange1">���Թ���</td>
</tr>
  <tr>
    <td width="12%">&nbsp;</td>
    <td width="77%" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;�������߿���ϵͳ���������ҳ����ˢ�¡����˵Ȳ������������Ը�������ڹ涨�Ŀ���ʱ����û�н���ϵͳ���Զ��ύ�Ծ�ÿλ����ͬһ���γ�ֻ�ܿ�һ�Σ�ϵͳ�ἰʱ֪ͨ���Եľ���ʱ�䣻�뿼����ע���Կγ��Լ�����ʱ�䣡<br>
&nbsp;&nbsp;&nbsp;&nbsp;ֻ��ͬ�����Ϲ���ſ��Խ��п��ԡ���������������δ�ҵ���صĿ��Կγ̣��������Ա��ϵ��	</td>
    <td width="11%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="center" valign="top"><html:submit property="submit" styleClass="btn_grey" value="ͬ��"/></td>
    <td>&nbsp;</td>
  </tr>
</table> 
</html:form>
        </td>
      </tr>
    </table>
</td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
