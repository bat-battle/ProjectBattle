<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("��δ��¼�����߳�ʱ�����¼ϵͳ");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<script type="text/javascript" src="js/checkform.js"></script>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
		<title>Insert title here</title>
		<link href="css/style.css" rel="stylesheet">
	</head>
	<script src="js/function.js">
	</script>
	<body>
		<c:if
			test="${sessionScope.loginUser!=null&&sessionScope.loginUser.username=='mr' }">
			<form name="form1" method="post" action="teacherController.htm" onsubmit="return checkTea(form1)">
				<table height="400" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr align="center" valign="middle">
						<td height="51" colspan="6">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td width="79">
							��ʦ����
						</td>
						<td width="193">
							<input name="name" type="text" id="name" maxlength="12">
						</td>
						<td width="75">
							����
						</td>
						<td width="208">
							<input name="age" type="text" id="age">
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
											<input name="sex" type="radio" value="��" checked>
											��
											<input type="radio" name="sex" value="Ů">
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
											<input name="hunfou" type="radio" value="no" checked>
											δ��
											<input type="radio" name="hunfou" value="yes">
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
							<input name="zzmm" type="text" id="zzmm" maxlength="20">
						</td>
						<td>
							����
						</td>
						<td>
							<input name="minzu" type="text" id="minzu" maxlength="10">
						</td>
					</tr>
					<tr>
						<td>
							ѧ��
						</td>
						<td>
							<input name="xueli" type="text" id="xueli">
						</td>
						<td>
							��������
						</td>
						<td>
							<input name="csrq" type="text" id="csrq">
						</td>
					</tr>
					<tr>
						<td>
							���֤��
						</td>
						<td>
							<input name="sfzh" type="text" id="sfzh" maxlength="18">
						</td>
						<td>
							��ϵ�绰
						</td>
						<td>
							<input name="lxdh" type="text" id="lxdh" maxlength="15">
						</td>
					</tr>
					<tr>
						<td>
							��������
						</td>
						<td>
							<input name="gzrq" type="text" id="gzrq">
						</td>
						<td>
							�ڿ�רҵ
						</td>
						<td>
							<select name="skzy">
								<c:forEach var="spinfo" items="${list }">
									<option value="${spinfo.spCode }">
										${spinfo.name }
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							�������
						</td>
						<td colspan="3">
							<textarea name="gzjj" cols="50" rows="5" id="gzjj"> </textarea>
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
							<input type="submit" name="Submit" value="�ύ">
						</td>
						<td>
							<input name="Reset" type="reset" value="����">
						</td>
					</tr>
				</table>
			</form>
			<c:if test="${info!=null }">
				<CENTER>
					��ʦ����${info.name }��&nbsp;��ӳɹ���
					��ʦ���Ϊ��${info.teaId }
				</CENTER>
			</c:if>
			<c:if test="${alert!=null }">
				<h3 align="center">
					���棺${alert }
				</h3>
			</c:if>
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
