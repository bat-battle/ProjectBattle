<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
	<link rel="stylesheet" type="text/css" href="images/css.css">
  </head>
  
  <body>
    <html:form action="/statInfo.do?method=findBySearch">
	  	<table align="center" width="90%">
		<tr>
			<td colspan="2" height="20">&nbsp;</td>
		</tr>
		<tr>
			<td width="28" valign="middle">&nbsp;<img src="images/jiantou.jpg" width="15" height="17" /></td>
		    <td width="960" valign="middle"><span class="STYLE1">��ǰλ�ã�</span>ͳ����Ϣ</td>
		</tr>
		<tr>
			<td height="4" colspan="2" bgcolor="afdf69" ></td>
		</tr>
		<tr>
			<td colspan="2">
				    <html:form action="/course.do?method=findBySearch">
				      <table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#afdf69" width="100%">
                        <tr>
                          <td height="24" colspan="7" bgcolor="#FFFFFF" class="STYLE3">&nbsp;��������������</td>
                        </tr>
                        <tr>
                          <td height="24" bgcolor="#FFFFFF">&nbsp;ѡ��רҵ��</td>
                          <td height="24" bgcolor="#FFFFFF">&nbsp;<html:select property="specialtyId">
                              <html:option value="-1">��ѡ��רҵ</html:option>
                              <logic:iterate id="sList" name="sList">
                                <html:option value="${sList.id}">${sList.enterYear}��${sList.langthYear}����${sList.name}רҵ</html:option>
                              </logic:iterate>
                            </html:select>
                          </td>
                          <td height="24" bgcolor="#FFFFFF">&nbsp;�ڿν�ʦ������</td>
                          <td height="24" bgcolor="#FFFFFF">&nbsp;<html:text property="teacherName" size="8"/></td>
                          <td height="24" bgcolor="#FFFFFF">&nbsp;�γ����ƣ�</td>
                          <td height="24" bgcolor="#FFFFFF">&nbsp;<html:text property="name" size="20" /></td>
                          <td height="24" bgcolor="#FFFFFF">&nbsp;<html:submit value="����"/>
                          </td>
                        </tr>
                      </table>
				    </html:form>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					    <p>
  				  <table width="100%" align="center" cellspacing="0">
   		<tr>
   			<td class="td0">רҵ����</td>
   			<td class="td0">�γ�����</td>
   			<td class="td0">�ڿν�ʦ</td>
   			<td class="td0">�Ͽεص�</td>
   			<td class="td0">�Ͽ�ʱ��</td>
   			<td class="td0">�Ͽ�ѧԱ����</td>
   		</tr>
    		<logic:iterate id="cList" name="cList">
    			<bean:define id="num" value="${cList[5]}"/>
    			<logic:notEqual name="num" parameter="" value="0">	
    			<tr>
				<td class="td1">${cList[5]}��${cList[6]}����${cList[7]}רҵ</td>
    			<td class="td1">${cList[1]}&nbsp;</td>
    			<td class="td1">${cList[2]}&nbsp;</td>
    			<td class="td1">${cList[3]}&nbsp;</td>
    			<td class="td1">${cList[4]}&nbsp;</td>
    			<td class="td1"><html:link page="/statInfo.do?method=stuList&courseId=${cList[0]}&specialtyId=${cList[8]}">�鿴</html:link></td>
	    		</tr>
	    		</logic:notEqual>
			</logic:iterate>
    	</table>
					</td>
				</tr>
	</table>	
		
		
  </html:form>

  </body>
</html:html>
