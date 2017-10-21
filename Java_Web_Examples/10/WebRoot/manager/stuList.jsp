<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
	<link rel="stylesheet" type="text/css" href="images/css.css">
    <style type="text/css">
<!--
.STYLE1 {font-size: 14px}
.STYLE3 {
	font-size: 16pt;
	font-weight: bold;
	color: #666666;
}
.STYLE5 {
	font-size: 12pt;
	color: #333333;
}
.STYLE6 {font-size: 14pt}
-->
    </style>
  </head>
  
  <body>
   	<table width="90%" align="center" cellspacing="1">
		<tr>
			<td width="30" height="32" valign="middle">&nbsp;
				<span class="STYLE1"><img src="images/jiantou.jpg" width="15" height="17" /></span></td>
		    <td width="916" valign="middle"><span class="STYLE1">��ǰλ�ã�</span>רҵ����</td>
		</tr>
		<tr>
			<td align="right" colspan="2">
			<html:link page="/statInfo.do?method=exPDF&courseId=${course.id}&specialtyId=${specialty.id}">����PDF�ĵ�</html:link>
  			<html:link page="/statInfo.do?method=exExcel&courseId=${course.id}&specialtyId=${specialty.id}">����Excel�ĵ�</html:link>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			
			  	<table align="center" width="860">
  		<tr>
  			<td height="36" align="center"><span class="STYLE3">${specialty.enterYear}��${specialty.langthYear}����${specialty.name}רҵ</span></td>
  		</tr>
  		<tr>
  			<td height="30" align="center"><span class="STYLE5">${course.name} �γ�������Ա����</span></td>
  		</tr>
  		<tr class="STYLE5">
  			<td height="30" align="center"><span class="STYLE6">�ڿν�ʦ��${course.teacherName}</span></td>
  		</tr>
  	</table>
    <table align="center" cellspacing="0" width="650px">
    <tr>
    	<td class="td0">ѧ������</td>
    	<td class="td0">ѧ��ѧ��</td>
    	<td class="td0">ѧ���Ա�</td>
    	<td class="td0">��ϵ�绰</td>
    </tr>
    <logic:iterate id="stuList" name="stuList">
    <tr>
    	<td class="td1">${stuList[0].stuName}</td>
    	<td class="td1">${stuList[0].stuNo}</td>
    	<td class="td1">${stuList[0].stuSex}</td>
    	<td class="td1">${stuList[0].tel}</td>
    </tr>		
    </logic:iterate>
    </table>
			</td>
		</tr>
  </table>

  </body>
</html:html>