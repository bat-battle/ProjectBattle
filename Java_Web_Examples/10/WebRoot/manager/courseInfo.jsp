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
  	<table width="955px" align="center" cellspacing="0">
		<tr>
			<td height="20" colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td width="31" valign="middle">&nbsp;<img src="images/jiantou.jpg" width="15" height="17" /></td>
		    <td width="918" valign="middle"><span class="STYLE1">��ǰλ�ã�</span>�γ̹���-&gt;�γ���ϸ��Ϣ</td>
		</tr>
		<tr>
			<td height="20" colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">
	 		<table width="700" align="center" cellspacing="0">
			<tr>
				<td colspan="6" class="td0">רҵ��Ϣ</td>
			</tr>
    		<tr>
    			<td width="65" class="td1">��ʼ��ݣ�</td>	
				<td width="189" align="left" class="td2">&nbsp;${specialty.enterYear} ��</td>
				<td width="69" class="td1">רҵ���ƣ�</td>
				<td width="127" align="left" class="td2">&nbsp;${specialty.name}</td>
				<td width="41" class="td1">ѧ�ƣ�</td>
				<td width="195" align="left" class="td2">&nbsp;${specialty.langthYear} ��</td>			
			</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
			<table width="700" align="center" cellspacing="0">
				<tr>
					<td colspan="4" class="td0">�γ���Ϣ</td>
				</tr>
				<tr>
					<td width="100" class="td1">�γ����ƣ�</td>
					<td width="200" class="td2">&nbsp;${course.name}</td>
					<td width="100"  class="td1">�γ�ѧ�֣�</td>
					<td class="td2">&nbsp;${course.credit} ��</td>
				</tr>
				<tr>
					<td width="100"  class="td1">�Ͽ�ʱ�䣺</td>
					<td width="200" class="td2">&nbsp;${course.schooltime}</td>
					<td width="100"  class="td1">�Ͽεص㣺</td>
					<td class="td2">&nbsp;${course.addr}</td>
				</tr>
				<tr>
					<td class="td1" width="100">�γ̽��ܣ�</td>
					<td colspan="3" class="td2">&nbsp;${course.courseInfo}</td>
				</tr>
				<tr>
					<td colspan="4" class="td0">�ڿν�ʦ��Ϣ</td>
				</tr>
				<tr>
					<td width="100" class="td1">��ʦ������</td>
					<td colspan="3" class="td2">&nbsp;${course.teacherName}</td>
				</tr>
				<tr>
					<td width="100" class="td1">��ʦ��飺</td>
					<td colspan="3" class="td2">&nbsp;${course.teacherInfo}</td>
				</tr>
    			<tr>
    				<td width="100" class="td1">�γ��Ƿ��ѡ��</td>
					<td width="200" class="td2">&nbsp;��</td>
			    	<logic:equal name="course"  value="false" property="isFinish">
    					<td colspan="2" class="td1"></td>
    				</logic:equal>
    				<logic:equal name="course"  value="true" property="isFinish">
    					<td width="100" class="td1">����Ϊ����ѡ��</td>
    					<td width="100" class="td1">
				  			<html:link page="/course.do?method=updateIsFinish&id=${course.id}">����Ϊ����ѡ</html:link>
				  		</td>
    				</logic:equal>
    			</tr>
    		</table>
	  		</td>
		</tr>
	</table>	
  </body>
</html:html>
