<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <title>showCourse.jsp</title>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <link href="images/css.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  	<table align="center" width="90%">
		<tr><td colspan="2">
			<table width="750px">
				<tr>
					<td align="right" valign="middle">&nbsp;
						<html:link page="/course.do?method=showInsert">
							<img src="images/addCourse.gif" border="0"/></html:link></td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td width="28" valign="middle">&nbsp;<img src="images/jiantou.jpg" width="15" height="17" /></td>
		    <td width="960" valign="middle"><span class="STYLE1">��ǰλ�ã�</span>�γ̹���</td>
		</tr>
		<tr>
			<td height="4" colspan="2" bgcolor="afdf69" ></td>
		</tr>
		<tr>
			<td colspan="2">
				    <html:form action="/course.do?method=findBySearch">
    	<table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#afdf69" width="100%">
    		<tr>
    			<td height="28" colspan="4" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><span class="STYLE3">&nbsp;����������������</span></td>
    		</tr>
    		<tr>
    			<td height="28" bordercolor="#FFFFFF" bgcolor="#FFFFFF" align="center">ѡ��רҵ��
    				<html:select property="specialtyId">
    					<html:option value="-1">��ѡ��רҵ</html:option>
    					<logic:iterate id="sList" name="sList">
							<html:option value="${sList.id}">${sList.enterYear}��${sList.langthYear}����${sList.name}רҵ</html:option>	
						</logic:iterate>
			  </html:select>   			  </td>
    			<td height="24" bordercolor="#FFFFFF" bgcolor="#FFFFFF" align="center">�ڿν�ʦ������
   			  <html:text property="teacherName" size="8"/></td>
   			  	<td height="24" bordercolor="#FFFFFF" bgcolor="#FFFFFF" align="center">�γ����ƣ�
		      <html:text property="name" size="20" /></td>
   			  	<td height="24" bordercolor="#FFFFFF" bgcolor="#FFFFFF" align="center"><html:submit value="����"/></td>
    		</tr>
   	  </table>
    </html:form>			</td>
		</tr>
		<tr>
			<td colspan="2">
			<p>
    <table border="0" width="100%" align="center" cellpadding="0" cellspacing="0">
   		<tr>
   			<td class="td0">רҵ����</td>
   			<td class="td0">�γ�����</td>
   			<td class="td0">�Ͽ�ʱ��</td>
   			<td class="td0">�Ͽεص�</td>
   			<td class="td0">�γ�ѧ��</td>
   			<td class="td0">�ڿν�ʦ</td>
   			<td class="td0">ѧ���Ƿ��ѡ</td>
   		</tr>
    		<logic:iterate id="cList" name="cList">
    			<tr>
				<td class="td1">${cList[0].enterYear}��${cList[0].langthYear}����${cList[0].name}רҵ</td>
    			<td class="td1"><html:link page="/course.do?method=courseInfo&id=${cList[1].id}">${cList[1].name}</html:link></td>
    			<td class="td1">${cList[1].schooltime}</td>
    			<td class="td1">${cList[1].addr}</td>
    			<td class="td1">${cList[1].credit}</td>
    			<td class="td1">${cList[1].teacherName}</td>
    			<td class="td1">${cList[1].isFinish?"��ѡ":"����ѡ"}</td>
	    		</tr>
			</logic:iterate>
  </table>			</td>
		</tr>
  </table>
  </body>
</html:html>
