<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("��δ��¼�����߳�ʱ�����¼ϵͳ");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
		<title>�޸Ľ�ʦ����</title>
		<link href="css/style.css" rel="stylesheet">
	</head>
	<body>
		<c:if
			test="${sessionScope.loginUser!=null&&sessionScope.loginUser.username=='mr' }">
			<form name="form1" method="post" action="teacherController.htm">
				<table height="450" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr align="center" valign="middle">
						<tr>
		 <td height="44" colspan="6">
			&nbsp;
		 </td>
		</tr>
					
					<tr>
						<td width="79">
							��ʦ����
						</td>
						<td width="193">
							<input name="name" type="text" id="name" maxlength="12"
								value="${doc.name }">
						</td>
						<td width="75">
							����
						</td>
						<td width="208">
							<input name="age" type="text" id="age" maxlength="2"
								value="${doc.age }">
						</td>
					</tr>
					<tr>
						<td>
							�Ա�
						</td>
						<td>
							<table width="110">
								<tr>
									<td>
										<label>

											<input name="sex" type="radio" value="��"
												<c:if test="${doc.sex=='��' }"> checked="yes"</c:if>>
											��
											<input type="radio" name="sex" value="Ů"
												<c:if test="${doc.sex=='Ů' }">checked="yes"</c:if>>
											Ů
										</label>
									</td>
								</tr>
							</table>
						</td>
						<td>
							���
						</td>
						<td>
							<table width="168">
								<tr>
									<td width="160">
										<label>
											<input name="hunfou" type="radio" value="no"
												<c:if test="${doc.hunfou=='no' }"> checked="yes"</c:if>>
											δ��
											<input type="radio" name="hunfou" value="yes"
												<c:if test="${doc.hunfou=='yes' }"> checked="yes"</c:if>>
											�ѻ�
										</label>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							������ò
						</td>
						<td>
							<input name="zzmm" type="text" id="zzmm" maxlength="20"
								value="${doc.zzmm }">
						</td>
						<td>
							����
						</td>
						<td>
							<input name="minzu" type="text" id="minzu" maxlength="10"
								value="${doc.minzu }">
						</td>
					</tr>
					<tr>
						<td>
							ѧ��
						</td>
						<td>
							<input name="xueli" type="text" id="xueli" value="${doc.xueli }">
						</td>
						<td>
							��������
						</td>
						<td>
							<input name="csrq" type="text" id="csrq" value="${doc.csrq }"
								readonly="yes">
						</td>
					</tr>
					<tr>
						<td>
							���֤��
						</td>
						<td>
							<input name="sfzh" type="text" id="sfzh" maxlength="18"
								value="${doc.sfzh }" readonly="yes">
						</td>
						<td>
							��ϵ�绰
						</td>
						<td>
							<input name="lxdh" type="text" id="lxdh" maxlength="15"
								value="${doc.lxdh }">
						</td>
					</tr>
					<tr>
						<td>
							��������
						</td>
						<td>
							<input name="gzrq" type="text" id="gzrq" value="${doc.gzrq }">
						</td>
						<td>
							�ڿ�רҵ
						</td>
						<td>
							<select name="skzy">
								<c:forEach var="spinfo" items="${list }">

									<option value="${spinfo.spCode }"
										<c:if test="${spinfo.spCode==doc.systemSpecialtyCode.spCode }"> selected="yes"</c:if>>
										${spinfo.name }
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							��ʦ��ţ�
						</td>
						<td>
							<input name="teaId" type="text" id="teaId" maxlength="18"
								value="${doc.teaId }" readonly="yes">
						</td>
						<td>
						</td>
						<td>
						</td>
					</tr>
					<tr>
						<td>
							�������
						</td>
						<td colspan="3">
							<textarea name="gzjj" cols="50" rows="5" id="gzjj">${doc.gzjj }</textarea>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;

						</td>
						<td>
							&nbsp;

						</td>
						<td>
							<input type="submit" name="Submit" value="�޸�">
						</td>
						<td>
							<input name="Reset" type="reset" value="����">
						</td>
					</tr>
				</table>
			</form>
		</c:if>
		<c:if
			test="${sessionScope.loginUser==null||sessionScope.loginUser.username!='mr' }">
			<p>
				&nbsp;
			</p>
			<p>
				&nbsp;
			</p>
			<p>
				&nbsp;
			</p>
			<p>
				&nbsp;
			</p>
			<p align="center">
				��δ��¼��Ȩ�޲����������µ�¼ϵͳ��
			</p>
		</c:if>
	</body>
</html>
