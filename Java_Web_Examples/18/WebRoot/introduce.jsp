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
          <td height="76" valign="top" background="Images/index/before_introduce.GIF"><table width="95%" height="33"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="right">��ǰλ�ã���˾��� &gt;&gt;&gt;</td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="86%" height="29"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <table width="100%"  border="0" cellspacing="-2" cellpadding="-2" height="23">
              <tr>
                <td style=" line-height:150%"> &nbsp;&nbsp;&nbsp;&nbsp;����ʡ���տƼ����޹�˾��һ���Լ�����������Ϊ���ĵĸ߿Ƽ�����ҵ����˾������2000��12�£���רҵ��Ӧ����������̺ͷ����ṩ�̡�������ʼ����������ҵ����������������ֻ������￪�����������������ϵͳ�ۺ�Ӧ�á���ҵ����������վ�����ȣ��Ⱥ�ɹ��������漰�������������ơ�������������Ӫ�������������Ķ�����ҵ����Ӧ�������Ӧ��ƽ̨����˾ӵ�������������Ŀʵʩ���������ר�Һ�ѧϰ�ͼ����Ŷӣ����������Ϊָ��˼�뽨��������з������۷�����ϵ����˾���ڳ����з�Ͷ��ͷḻ����ҵ���飬���š��ÿͻ����ɹ�����ͬ�ͻ���ͬ�ɹ����ķܶ�Ŀ�꣬Ŭ������ ��רҵ�����á���Ч���Ĳ�Ʒ���ƣ��߳�Ϊ����û��ṩ���ʵĲ�Ʒ�ͷ���<br>                                  
                                  <br>
            &nbsp;&nbsp;&nbsp;&nbsp;��ҵ��ּ��Ϊ��ҵ���񣬴�����ҵ���ܹ���ƽ̨��������ҵ�Ĺ������������̣������ҵЧ�ʣ����͹���ɱ�����ǿ��ҵ���ľ�������Ϊ��ҵ���ٷ�չ�ṩԴ������<br>            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;��ҵ�Ļ��� ���͡����¡���ѧ������ </td>
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
