<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html> 
	<head>
		<title>��д������Ϣ</title>
		<link rel="stylesheet" type="text/css" href="images/style.css">
<style type="text/css"> 
.STYLE3 {color: #FF0000}
</style>
<script type="text/javascript"> 
			function checkInput(){ 
				if(document.stuUserForm.stuName.value==null||document.stuUserForm.stuName.value==""){
					alert("��������Ϊ�գ�");
					document.stuUserForm.stuName.focus();
					return false;
				}
				if(document.stuUserForm.stuNo.value==null||document.stuUserForm.stuNo.value==""){
					alert("ѧ�Ų���Ϊ�գ�");
					document.stuUserForm.stuNo.focus();
					return false;
				}
				if(document.stuUserForm.birthday.value==null||document.stuUserForm.birthday.value==""){
					alert("�������ڲ���Ϊ�գ�");
					document.stuUserForm.birthday.focus();
					return false;
				}
				if(document.stuUserForm.homeAddr.value==null||document.stuUserForm.homeAddr.value==""){
					alert("��ͥסַ����Ϊ�գ�");
					document.stuUserForm.homeAddr.focus();
					return false;  
				}
				if(document.stuUserForm.addr.value==null||document.stuUserForm.addr.value==""){
					alert("��סַ����Ϊ�գ�");
					document.stuUserForm.addr.focus();
					return false; 
				}
				if(document.stuUserForm.tel.value==null||document.stuUserForm.tel.value==""){
					alert("��ϵ�绰����Ϊ�գ�");
					document.stuUserForm.tel.focus();
					return false;
				} 
				return true;
			}
		</script> 
</head>
	<body>
	<table width="845" align="center" cellspacing="0" bgcolor="#f6f9f2">
		<tr>
			<td background="images/topU.gif" height="124"></td>
		</tr>
		<tr>
		  <td>
			<table cellspacing="0" width="600px" align="center">
			<tr>
				<td height="20" colspan="2"></td> 
			</tr> 
			<tr>
				<td width="13" background="images/jiantou.jpg">&nbsp;</td>
				<td width="585"><span class="STYLE2">��ǰλ�ã�</span>��дѧ��������Ϣ</td>
			</tr>
			<tr> 
				<td height="8" colspan="2"></td>
			</tr>

			<tr>
				<td height="3" colspan="2" bgcolor="#b1de69"></td>
			</tr>
			<tr> 
				<td height="40" colspan="2" valign="middle">
				<p class="STYLE3">
					ע�⣺ѧ�����ȷ�ϣ������沢��ʵ��д������Ϣ���������Ϣ������ȷ��ѧ����ݣ�<br>
					�����д�����Ϣ����޷�����ѡ�Σ�����Ը���</p></td>
			</tr>  
		</table>
				<html:form action="/stuUser.do?method=insert"  onsubmit="return checkInput()" >
			<table width="500" align="center" cellspacing="1" bgcolor="#c2d3b0">
				<tr>
					<td width="64" height="24" align="right" bgcolor="#f8fcf3">������</td> 
					<td width="313" bgcolor="#F6F9F2">&nbsp;<html:text property="stuName" /> 
						<html:hidden property="id" value="${id}"/>
				  </td>
					<td width="111" bgcolor="#F6F9F2">&nbsp;����ѧ������</td> 
				</tr>
				<tr>
					<td height="24" align="right" bgcolor="#f8fcf3">ѧ�ţ�</td>
				  <td bgcolor="#F6F9F2">&nbsp;<html:text property="stuNo"/></td>
					<td bgcolor="#F6F9F2">&nbsp;����ѧ��֤����</td>
				</tr>
				<tr>
					<td height="24" align="right" bgcolor="#f8fcf3">רҵ��</td>
					<td bgcolor="#F6F9F2">&nbsp;<html:select property="specialtyId"> 
							<logic:iterate id="list" name="list">
								<html:option value="${list.id}">${list.enterYear}��${list.langthYear}����${list.name}רҵ</html:option>								</logic:iterate>
						</html:select>
				  </td>
					<td bgcolor="#F6F9F2">&nbsp;ѡ��רҵ</td>
				</tr>
				<tr>
					<td height="24" align="right" bgcolor="#f8fcf3">�Ա�</td>
					<td bgcolor="#F6F9F2">&nbsp;<html:radio property="stuSex" value="��">��</html:radio>
						<html:radio property="stuSex" value="Ů">Ů</html:radio>
				  <td bgcolor="#F6F9F2">&nbsp;ѡ���Ա�</td>
				</tr>
				<tr>
					<td height="24" align="right" bgcolor="#f8fcf3">���գ�</td>
				  <td bgcolor="#F6F9F2">&nbsp;<html:text property="birthday"/></td>
					<td bgcolor="#F6F9F2">&nbsp;�����������</td>
				</tr> 
				<tr>
					<td height="24" align="right" bgcolor="#f8fcf3">��ͥ��ַ��</td>
				  <td bgcolor="#F6F9F2">&nbsp;<html:text property="homeAddr"/></td>
					<td bgcolor="#F6F9F2">&nbsp;�����ͥסַ</td>
				</tr>
				<tr>
					<td height="24" align="right" bgcolor="#f8fcf3">��סַ��</td>
				  <td bgcolor="#F6F9F2">&nbsp;<html:text property="addr"/></td>
					<td bgcolor="#F6F9F2">&nbsp;���뵱ǰ��ס��ַ</td>
				</tr>
				<tr>
					<td height="24" align="right" bgcolor="#f8fcf3">��ϵ�绰��</td>
				  <td bgcolor="#F6F9F2">&nbsp;<html:text property="tel"/></td>
					<td bgcolor="#F6F9F2">&nbsp;������ϵ�绰</td>
				</tr>  
				<tr>
				  <td height="24" colspan="3" align="center" bgcolor="#F6F9F2"><html:submit value="ȷ��"/>&nbsp;&nbsp;&nbsp;&nbsp;
				  <html:reset value="����"/></td>
				</tr>   
			</table> 
		</html:form> 
		  </td>
		</tr>
		<tr>
			<td background="images/bottomU.gif" height="85"></td>
		</tr>
	</table>
	</body>
</html>

