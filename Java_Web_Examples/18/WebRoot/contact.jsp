<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="electric.dbs.Dbnews"%>
<%@ page import="electric.dbs.news"%>
<%@ page import="electric.dbs.Newsdb"%>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.electricUtils.DbConnectionManager"%>
<%
      Newsdb newse=new Newsdb();
      int countpage=newse.selectsql(5);
      int a=0;
      int i=0;
%>
<html>
<head>
<title>�°¼ҵ������������ģ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>

<body>
<jsp:include page="banner.htm"/>
<table width="777" height="112"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="188" height="163" valign="top">
<jsp:include page="left.htm"/>
	</td>
    <td align="center" valign="top"><table width="100%" height="46"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td background="Images/index/index_03.gif"><jsp:include page="navigation.htm"/></td>
      </tr>
    </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center">
<table width="100%" height="76"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="76" valign="top" background="Images/index/before_contact.GIF"><table width="95%" height="33"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="right">��ǰλ�ã���ϵ���� &gt;&gt;&gt;</td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="86%" height="29"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <table width="100%"  border="0" cellspacing="-2" cellpadding="-2" height="23">
              <tr>
                <td style=" line-height:150%">                  <table width="60%" height="277"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td>��˾���ƣ�</td>
                      <td>����ʡ���տƼ����޹�˾</td>
                    </tr>
                    <tr>
                      <td width="27%">��&nbsp;&nbsp;&nbsp;&nbsp;ַ��</td>
                      <td width="73%">�����ж�ʢ���89��</td>
                    </tr>
                    <tr>
                      <td>�绰���룺</td>
                      <td>0431-4978981 <br>
            0431-4978982</td>
                    </tr>
                    <tr>
                      <td>��&nbsp;&nbsp;&nbsp;&nbsp;�棺</td>
                      <td>0431-4972266</td>
                    </tr>
                    <tr>
                      <td>�������䣺</td>
                      <td><a href="mailto:mingrisoft@mingrisoft.com">mingrisoft@mingrisoft.com</a> <br>
                          <a href="mailto:mingrisoft@vip.sina.com">mingrisoft@vip.sina.com</a></td>
                    </tr>
                    <tr>
                      <td>��&nbsp;&nbsp;&nbsp;&nbsp;ַ��</td>
                      <td><a href="http://www.mingrisoft.com" target="_blank">http://www.mingrisoft.com</a><br>
                          <a href="http://www.cccxy.com" target="_blank">http://www.cccxy.com</a></td>
                    </tr>
                    <tr>
                      <td>QQ &nbsp;���룺</td>
                      <td>3642159</td>
                    </tr>
                    <tr>
                      <td>�������룺</td>
                      <td>130031</td>
                    </tr>
                </table></td>
              </tr>
            </table>
            </td>
        </tr>
      </table>		  </td>
        </tr>
      </table></td>
    <td width="35" valign="top"><img src="Images/index/index_04.gif" width="35" height="301"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
</body>
</html>
