<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<link rel="stylesheet" type="text/css" href="images/css.css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>

<body>
	<table width="90%" align="center" cellspacing="0">
		<tr>
			<td height="20" colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td width="25" valign="middle">&nbsp;<img src="images/jiantou.jpg" width="15" height="17" /></td>
		    <td colspan="3" valign="middle"><span class="STYLE1">��ǰλ�ã�</span>�γ̹���->����¿γ�</td>
		</tr>
		<tr>
			<td height="20" colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td height="20">&nbsp;</td>
			<td width="65" height="20">&nbsp;</td>
			<td width="663" height="20">
	<html:form action="/course.do?method=insert">
		<table cellspacing="1" bgcolor="#c2d3b0">
			<tr>
				<td width="78" bgcolor="#FFFFFF" class="td0">ѡ��רҵ��</td>
				<td width="355" bgcolor="#FFFFFF">&nbsp;
					<html:select property="specialtyId">
						<logic:iterate id="list" name="list">
							<html:option value="${list.id}">${list.enterYear}��${list.langthYear}����${list.name}רҵ</html:option>	
						</logic:iterate>
					</html:select>
			  </td>
				<td width="137" bgcolor="#FFFFFF" class="STYLE2">&nbsp;��ѡ��רҵ</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" class="td0">�γ����ƣ�</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:text property="name" size="30" maxlength="30"/></td>
				<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;����γ�����</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" class="td0">�Ͽ�ʱ�䣺</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:text property="schooltime"/></td>
				<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;�����Ͽ�ʱ��</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" class="td0">�Ͽεص㣺</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:text property="addr" size="30" maxlength="30"/></td>
				<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;�����Ͽεص�</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" class="td0">�γ�ѧ�֣�</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:text property="credit"/></td>
				<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;����γ�ѧ��</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" class="td0">�γ̽��ܣ�</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:textarea property="courseInfo" rows="3" cols="50"></html:textarea></td>
				<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;����γ̽���</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" class="td0">�ڿν�ʦ��</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:text property="teacherName"/></td>
				<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;���뽲��ʦ����</td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" class="td0">��ʦ���ܣ�</td>
				<td bgcolor="#FFFFFF">&nbsp;&nbsp;<html:textarea property="teacherInfo" rows="3" cols="50"></html:textarea></td>
				<td bgcolor="#FFFFFF" class="STYLE2">&nbsp;�����ڿν�ʦ���</td>
			</tr> 
			<tr>
				<td height="24" colspan="3" align="center" bgcolor="#FFFFFF">
					<html:submit value="ȷ��"/>&nbsp;&nbsp;&nbsp;&nbsp;<html:reset value="����"/>
			  </td>
			</tr>
	  </table>
	</html:form>
		  </td>
			<td width="192" height="20">&nbsp;</td>
		</tr>
	</table>
	<br>

</body>
</html:html>
