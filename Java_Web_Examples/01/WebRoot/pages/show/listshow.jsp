<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ taglib prefix="s2" uri="/struts-tags" %>

<html>
<head><title>�鿴��Ϣ�б�</title></head>
<body>
    <center>        
        <!-- �б���ʾ������Ϣ -->
        <s2:set name="onepayforlist" value="#request.onepayforlist"/>        
        <table border="0" width="670" cellspacing="0" cellpadding="0" style="margin-top:5">
            <s2:if test="#onepayforlist==null||#onepayforlist.size()==0">
                <tr height="30"><td align="center">���� �ɷѺ���������Ϣ�Ϳ���������ʾ������</td></tr>
            </s2:if>
            <s2:else>
                <tr height="30"><td style="text-indent:5" valign="bottom"><font color="#004790"><b>���Ƽ�<s2:property value="#session.typeMap[#onepayforlist[0].infoType]"/></b>���ɷ�ר����</font></td></tr>
                <s2:iterator status="onepayforStatus" value="onepayforlist">
                     <s2:if test="#onepayforStatus.odd">
                         <tr><td align="center" style="border:1 solid" bgcolor="#F0F0F0">
                     </s2:if>
                     <s2:else>
                         <tr><td align="center" style="border:1 solid" bgcolor="white">
                     </s2:else>
                             <table border="0" width="655" cellpadding="3" style="word-break:break-all">
                                 <tr height="30">
                                     <td colspan="2">��<s2:property value="#session.typeMap[infoType]"/>��</td>
                                     <td align="right">����ʱ�䣺��<s2:property value="infoDate"/>��&nbsp;</td>
                                 </tr>
                                 <tr height="80"><td colspan="3"><s2:property value="infoContent"/></td></tr>
                                 <tr height="30" align="center">
                                     <td>��ϵ�绰��<s2:property value="infoPhone"/></td>
                                     <td>�� ϵ �ˣ�<s2:property value="infoLinkman"/></td>
                                     <td>E-mail��<s2:property value="infoEmail"/></td>
                                 </tr>                                 
                             </table>
                         </td>
                     </tr>
                     <tr height="1"><td></td></tr>
                </s2:iterator>
            </s2:else>
        </table>
        <!-- �б���ʾ�����Ϣ -->
        <s2:set name="onefreelist" value="#request.onefreelist"/>
        <table border="0" width="670" cellspacing="0" cellpadding="0" style="margin-top:5" rules="rows">
            <s2:if test="#onefreelist==null||#onefreelist.size()==0">
                <tr height="30"><td align="center">���� ��������ʾ��ѷ�������Ϣ������</td></tr>
            </s2:if>
            <s2:else>
                <tr height="30"><td style="text-indent:5" valign="bottom"><font color="#004790"><b>������<s2:property value="#session.typeMap[#onefreelist[0].infoType]"/></b>�����ר����</font></td></tr>
                <s2:iterator status="onefreeStatus" value="onefreelist">
                     <s2:if test="#onefreeStatus.odd">
                         <tr><td align="center" style="border:1 solid" bgcolor="#F0F0F0">
                     </s2:if>
                     <s2:else>
                         <tr><td align="center" style="border:1 solid" bgcolor="white">
                     </s2:else>
                             <table border="0" width="655" cellpadding="3" style="word-break:break-all">
                                 <tr height="30">
                                     <td colspan="2">��<s2:property value="#session.typeMap[infoType]"/>��</td>
                                     <td align="right">����ʱ�䣺��<s2:property value="infoDate"/>��&nbsp;</td>
                                 </tr>
                                 <tr height="80"><td colspan="3"><s2:property value="infoContent"/></td></tr>
                                 <tr height="30" align="center">
                                     <td>��ϵ�绰��<s2:property value="infoPhone"/></td>
                                     <td>��ϵ�ˣ�<s2:property value="infoLinkman"/></td>
                                     <td>E-mail��<s2:property value="infoEmail"/></td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr height="1"><td></td></tr>
                </s2:iterator>
                <tr height="30"><td align="center"><jsp:include page="/pages/page.jsp"/></td></tr>                
            </s2:else>
        </table>
        <br>
    </center>
</body>
</html>