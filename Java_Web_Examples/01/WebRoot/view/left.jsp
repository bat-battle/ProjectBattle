<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.TreeMap" %>
<%@ taglib prefix="s2" uri="/struts-tags" %>
<%
  TreeMap searchType=new TreeMap();
  searchType.put("like","ģ������");
  searchType.put("all","ȫ��ƥ��");
  request.setAttribute("searchType",searchType);
%>

<html>
<head>
  <title>����</title>
</head>
<body>
    <center>
        <table border="0" width="225" height="100%" cellspacing="0" cellpadding="0">
            <tr height="30"><td style="text-indent:5" valign="bottom"><font color="#004790"><b>������</b></font></td></tr>            
            <tr height="1"><td></td></tr>
            <tr height="215">
                <td valign="top" background="images/leftD.jpg"><jsp:include page="/pages/calendar.jsp"/></td>
            </tr>
            <tr height="1"><td></td></tr>
            <tr height="30"><td style="text-indent:5" valign="bottom"><font color="#004790"><b>����Ϣ��������</b></font></td></tr>
            <tr height="1"><td></td></tr>
            <tr height="103">
                <td align="center" valign="top" background="images/leftS.jpg">
                    <table border="0" width="99%" height="100%" cellspacing="0">
                    <s2:form action="info_SearchShow.action" theme="simple">                        
                        <tr height="10"><td colspan="3"></td></tr>
                        <tr>
                            <td align="right" width="70">�ؼ��֣�</td>
                            <td colspan="2" width="200"><s2:textfield name="searchInfo.sqlvalue" value="%{searchInfo.sqlvalue}" size="21"/></td>
                        </tr>
                        <tr>
                            <td align="right">��&nbsp;&nbsp;����</td>
                            <td>
                                <s2:select
                                    emptyOption="true"
                                    list="#session.searchMap"
                                    listKey="value"
                                    listValue="key"                             
                                    name="searchInfo.subsql"/>
                            </td>
                            <td align="center" width="30"><s2:submit value="����"/></td>
                        </tr>
                        <tr>
                            <td align="right">�������ͣ�</td>
                            <td colspan="2">
                                <s2:radio 
                                    list="#request.searchType"
                                    value="%{'like'}"
                                    name="searchInfo.type"/>                                
                            </td>
                        </tr>
                        <tr height="10"><td colspan="3"></td></tr>
                    </s2:form>
                    </table>
                </td>
            </tr>
            <tr><td></td></tr>
        </table>                
    </center>
</body>
</html>