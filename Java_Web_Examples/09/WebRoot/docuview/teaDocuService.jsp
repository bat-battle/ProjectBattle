<%@ page contentType="text/html; charset=gb2312" language="java"
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
		<title>����ͼ�鳬��</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link href="css/style.css" rel="stylesheet">
	</head>
	<body>
		<table width="80%" border="0" cellpadding="0" cellspacing="0"
			class="tableBorder_LTR">
			<tr>								
				 <td height="44" colspan="6">
					&nbsp;
				 </td>		
			</tr>
		</table>
		<table width="80%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="80%" height="49" align="center">
					<form name="form1" method="post" action="searchTeacherInfo.htm">
						�������ѯ������
						<select name="condition" id="condition" tabindex="2">
							<option selected="true">
								����
							</option>
							<option>
								���֤
							</option>
							<option>
								��ʦ���
							</option>
						</select>
						<input name="conditionContent" type="text" id="conditionContent">
						<input type="submit" name="Submit" value="�ύ">
					</form>
				</td>
			</tr>
		</table>
		<table width="90%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<!--DWLayoutTable-->
			<tr>
				<td width="100%" height="362" valign="top">
					<table width="100%" border="1" align="center" cellpadding="0"
						cellspacing="0">
						<!--DWLayoutTable-->
						<tr>
							<td>
								<div align="center">
									��ʦ���
								</div>
							</td>
							<td>
								<div align="center">
									����
								</div>
							</td>
							<td>
								<div align="center">
									�Ա�
								</div>
							</td>
							<td>
								<div align="center">
									���֤
								</div>
							</td>
							<td>
								<div align="center">
									�ڿ�רҵ
								</div>
							</td>
							<td>
								<div align="center">
									ά��
								</div>
							</td>
						</tr>
						<c:forEach var="tea" items="${list}">
							<tr>
								<td>
									<div align="center">
										${tea.teaId }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${tea.name }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${tea.sex }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${tea.sfzh }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${tea.systemSpecialtyCode.name }&nbsp;
									</div>
								</td>
								<td class="button_03">
									<div align="center">
										<a href="serviceTeacherInfo.htm?teaId='${tea.teaId }'"
											target="mainFrame">����</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
