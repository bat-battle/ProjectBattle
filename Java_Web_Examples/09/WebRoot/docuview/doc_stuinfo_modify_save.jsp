<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("��δ��¼�����߳�ʱ�����¼ϵͳ");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<script language="javascript">
	function deal(){
		if(confirm("�Ƿ����ѧ����Ϣ���ݴ��̲�����")){
			form1.submit();	
			//window.history(-1);		
		}
	}
</script>
<html>
<link href="css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<head>
		<title>ѧ��������Ϣ��¼���</title>
	</head>
	<body>
	<tr>
			 <td height="44" colspan="6">
				&nbsp;
			 </td>
		   </tr>
		<form method="POST" action="stuInfoInsert.htm?ctname=dsim" name="form1">
		&nbsp;

<table width="600" height="266" border="0" align="center" cellpadding="0" cellspacing="0">
				
				<tr>
				
					<td width="94" ><font color="red">ѧ�����</font></td>
					<td width="188">
						<input type="text" name="stuId" value="${messages.stuId}" width="188" readonly="readonly"></td>
					<td width="96">ѧ������</td>
					<td width="196">
						<input type="text" name="name"width="188" value="${messages.name}"></td>
				</tr>
				<tr>
					<td>ѧ���Ա�</td>
					<td>
					
					<input name="sex" type="radio" value="��" <c:if test="${messages.sex=='��' }"> checked="yes"</c:if>>��					
					 <input name="sex" type="radio" value="Ů" <c:if test="${messages.sex=='Ů' }"> checked="yes"</c:if>>Ů</td>
					<td>ѧ������</td>
					<td>
						<input type="text" name="age"width="188" value="${messages.age}"></td>
						
				</tr>
				<tr>
					<td>���֤��</td>
					<td>
						<input type="text" name="sfzhm"width="188" value="${messages.sfzhm}"></td>
					<td>��������</td>
					<td>
						<input type="text" name="csrq"width="188" value="${messages.csrq}"></td>
				</tr>
				<tr>
					<td>��ͥ��ַ</td>
					<td>
						<input type="text" name="jtdz"width="188" value="${messages.jtdz}">					</td>
					<td>��ͥ�绰</td>
					<td>
						<input type="text" name="jtdh"width="188" value="${messages.jtdh}">					</td>
				</tr>
				<tr>
				<td colspan="3">������ò
                  <select name="zzmm">
                    <option value="��Ա" <c:if test="${messages.zzmm=='��Ա' }"> selected="yes"</c:if>>��Ա</option>
                    <option value="��Ա" <c:if test="${messages.zzmm=='��Ա' }">selected="yes"</c:if>>��Ա</option>
                  </select>
                
                   ����״��		  
                   <select name="jkzk">
                    <option value="��" <c:if test="${messages.jkzk=='��' }"> selected="yes"</c:if>>��</option>
                    <option value="��" <c:if test="${messages.jkzk=='��' }"> selected="yes"</c:if>>��</option>
                  </select></td>
				   <td> 				     
		             <div align="center">
		               <input type="reset" name="add" value="����" />		               	               
		               <input type="button" name="save" value="�ύ" onClick="form1.submit();"/>
		             
                     </div>                   
                    </td>
				</tr>
		  </table>
		
			
		</form>
		 <div align="center" class="style1" >${msg}</div>