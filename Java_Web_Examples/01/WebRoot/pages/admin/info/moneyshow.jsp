<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ taglib prefix="s2" uri="/struts-tags" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
  <title>��̨-��������</title>
  <base href="<%=basePath%>">
  <script type="text/javascript" src="<s2:url value='js/DeleteCheck.js'/>"></script>
</head>
<body>
    <center>
        <br>
        <s2:form theme="simple">
        <input type="hidden" name="moneyID" value="<s2:property value="infoSingle.id"/>">
        <input type="hidden" name="deleteID" value="<s2:property value="infoSingle.id"/>">        
        <table border="0" width="645" cellpadding="10" cellspacing="0" style="word-break:break-all">            
            <tr height="30">
                <td style="text-indent:5"><b>�������� [IDֵ��<s2:property value="infoSingle.id"/>]</b></td>
                <td colspan="2" align="right"><s2:fielderror/></td>
            </tr>
            <tr height="30" bgcolor="#F9F9F9"><td colspan="3" align="center" style="text-indent:5">��Ϣ��ϸ����</td></tr>
            <tr height="30">
                <td width="25%" style="text-indent:10">��Ϣ���</td>
                <td>��<s2:property value="#session.typeMap[infoSingle.infoType]"/>��</td>
                <td>����״̬��&nbsp;&nbsp;<s2:if test="infoSingle.infoPayfor==1">�� �Ѹ���</s2:if><s2:else>�� δ����</s2:else></td>
            </tr>
            <tr height="30">
                <td style="text-indent:10">����ʱ�䣺</td>
                <td><s2:property value="infoSingle.infoDate"/></td>
                <td>���״̬��&nbsp;&nbsp;<s2:if test="infoSingle.infoState==1">�� �����</s2:if><s2:else>�� δ���</s2:else></td>
            </tr>
            <tr height="30">
                <td style="text-indent:10">��Ϣ���⣺</td>
                <td colspan="2"><s2:property value="infoSingle.infoTitle"/></td>
            </tr>
            <tr height="40" bgcolor="#F9F9F9">
                <td style="text-indent:10">��Ϣ���ݣ�</td>
                <td align="center">
                    <s2:if test="infoSingle.infoPayfor==1"><s2:set name="forbid" value="true"/></s2:if>
                    <s2:else><s2:set name="forbid" value="false"/></s2:else>
                    <s2:submit action="admin_SetMoney" value="����Ϊ����" disabled="forbid"/>
                </td>
                <td align="center"><s2:submit action="admin_Delete" value="��ɾ����Ϣ" onclick="return really()"/></td>                
            </tr>
            <tr height="5"><td></td></tr>
            <tr>
                <td colspan="3" style="border:1 solid">
                    <table border="0" width="630" cellspacing="0" cellpadding="10" style="word-break:break-all">
                        <tr height="130"><td colspan="3" valign="top"><s2:property value="infoSingle.infoContent" escape="false"/></td></tr>
                        <tr height="30" align="center">
                            <td>��ϵ�绰��<s2:property value="infoSingle.infoPhone"/></td>
                            <td>��ϵ�ˣ�<s2:property value="infoSingle.infoLinkman"/></td>
                            <td>E-mial��<s2:property value="infoSingle.infoEmail"/></td>
                        </tr>
                   </table>  
                </td>
            </tr>
         </table>
         </s2:form>
    </center>
</body>
</html>