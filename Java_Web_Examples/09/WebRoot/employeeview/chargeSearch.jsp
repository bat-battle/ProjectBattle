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
		<table width="90%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="40" align="center">
					<div align="center">
						<p>
							
						</p>
					</div>
				</td>
			</tr>
		</table>
		<table width="90%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="100%" height="49" align="center">
					<form name="form1" method="post"
						action="searchChargeEmployeeLoader.htm">
						�������ѯ������
						<select name="condition" id="condition" tabindex="2">
							<option value="systemClassInfo.systemSpecialtyCode.name"
								<c:if test="${condition=='systemClassInfo.systemSpecialtyCode.name' }"> selected="yes"</c:if>>
								רҵ
							</option>
							<option value="systemClassInfo.systemGradeCode.grName"
								<c:if test="${condition=='systemClassInfo.systemGradeCode.grName' }"> selected="yes"</c:if>>
								�꼶
							</option>
						</select>
						<input name="conditionContent" type="text" id="conditionContent"
							value="${conditionContent }">
						<input type="submit" name="Submit" value="�ύ">
						<input type="checkbox" name="history" value="yes"
							<c:if test="${history!=null }"> checked="yes"</c:if>>
						��ѯ��ʷ��¼
					</form>
				</td>
			</tr>
		</table>
		
		<table width="90%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<!--DWLayoutTable-->
			<tr>
				<td width="100%" valign="top">
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
									��ʦ����
								</div>
							</td>
							<td>
								<div align="center">
									��ʦ�Ա�
								</div>
							</td>
							<td>
								<div align="center">
									�༶����
								</div>
							</td>
							<td>
								<div align="center">
									�꼶
								</div>
							</td>
							<td>
								<div align="center">
									�༶רҵ
								</div>
							</td>
							<td>
								<div align="center">
									��ְ����
								</div>
							</td>
							<c:if test="${history==null }">
								<td>
									<div align="center">
										ά��
									</div>
								</td>
							</c:if>
							<c:if test="${history!=null }">
								<td>
									<div align="center">
										��ְ����
									</div>
								</td>
							</c:if>
						</tr>
						<c:forEach var="list" items="${list}">
							<tr>
								<td>
									<div align="center">
										${list.docuTeaInfo.teaId }
									</div>
								</td>
								<td>
									<div align="center">
										${list.docuTeaInfo.name }
									</div>
								</td>
								<td>
									<div align="center">
										${list.docuTeaInfo.sex }
									</div>
								</td>
								<td>
									<div align="center">
										${list.systemClassInfo.classmc }
									</div>
								</td>
								<td>
									<div align="center">
										${list.systemClassInfo.systemGradeCode.grName }
									</div>
								</td>
								<td>
									<div align="center">
										${list.systemClassInfo.systemSpecialtyCode.name }
									</div>
								</td>
								<td>
									<div align="center">
										${list.rzrq }
									</div>
								</td>
								<c:if test="${history==null }">
									<td class="button_03" align="middle">
										<div align="center">
											<a href="searchChargeEmployeeLoader.htm?lsh=${list.lsh }">��ְ</a>
										</div>
									</td>
								</c:if>
								<c:if test="${history!=null }">
									<td>
										<div align="center">
											${list.lizhiDate }
										</div>
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
