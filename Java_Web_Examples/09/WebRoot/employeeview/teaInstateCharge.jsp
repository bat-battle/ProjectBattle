<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<jsp:directive.page import="java.sql.Date" />
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("��δ��¼�����߳�ʱ�����¼ϵͳ");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>����������</title>
		<link href="css/style.css" rel="stylesheet">
	<script src="js/checkform.js"></script>
	</head>
	<body>
	<tr>
			 <td height="44" colspan="6">
				&nbsp;
			 </td>
		   </tr>
		<form name="form1" method="post" action="chargeEmployeeLoader.htm" onsubmit="return checkCharge(form1)">
			<table width="80%" height="98" border="0" align="center">
				
				<tr>
					<td height="48">
						&nbsp;
					</td>
					<td colspan="2">
						<div align="right">
							�������ʦ��ţ�
						</div>
					</td>
					<td>
						<div align="left">
							<input type="text" name="teaId" value="${teaInfo.teaId }"
								onchange="window.location.href='chargeEmployeeLoader.htm?changeTeaId='+teaId.value+'&changeClassId='+classid.value">
						</div>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
			<br>
			<table width="80%" height="69" border="1" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<div align="center">
							��ʦ����
						</div>
					</td>
					<td>
						<div align="center">
							�Ա�
						</div>
					</td>
					<td>
						<div align="center">
							����
						</div>
					</td>
					<td>
						<div align="center">
							ѧ��
						</div>
					</td>
					<td>
						<div align="center">
							�ڿ�רҵ
						</div>
					</td>
					<td>
						<div align="center">
							���
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center">
							${teaInfo.name }&nbsp;
						</div>
					</td>
					<td>
						<div align="center">
							${teaInfo.sex }&nbsp;
						</div>
					</td>
					<td>
						<div align="center">
							${teaInfo.age }&nbsp;
						</div>
					</td>
					<td>
						<div align="center">
							${teaInfo.xueli }&nbsp;
						</div>
					</td>
					<td>
						<div align="center">
							${teaInfo.systemSpecialtyCode.name }&nbsp;
						</div>
					</td>
					<td>
						<div align="center">
							${teaInfo.hunfou }&nbsp;
						</div>
					</td>
				</tr>
			</table>
			
			<table width="68%" height="125" border="0" align="center">
				<tr>
					<td width="15%">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<div align="left">
							�༶����
						</div>
					</td>
					<td width="36%">
						<select name="classid"
							onchange="window.location.href='chargeEmployeeLoader.htm?changeTeaId='+teaId.value+'&changeClassId='+classid.value">
							<c:forEach var="list" items="${classInfo}">
								<option value="${list.classid }"
									<c:if test="${list.classid==rowInfo.classid}"> selected="yes"</c:if>>
									${list.classmc }
								</option>
							</c:forEach>
						</select>
					</td>
					<td width="11%">
						<div align="left">
							רҵ
						</div>
					</td>
					<td width="38%">
						<input type="text" name="name" readonly="yes"
							value="${rowInfo.systemSpecialtyCode.name }">
					</td>
				</tr>
				<tr>
					<td>
						<div align="left">
							�꼶
						</div>
					</td>
					<td>
						<input type="text" name="grade" readonly="yes"
							value="${rowInfo.systemGradeCode.grName }">
					</td>
					<td>
						<div align="left">
							��ְ����
						</div>
					</td>
					<td>
						<input type="text" name="rzrq">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div align="center">
							<input type="submit" name="Submit" value="�ύ">
							&nbsp;&nbsp;&nbsp;
							<input type="reset" name="Submit2" value="����">
						</div>
					</td>
				</tr>
			</table>
			<center>
				<br>
				<c:if test="${message==null }">
					�������ύ����ť������ʦ��ְΪ�����Ρ�
				</c:if>
				<c:if test="${message!=null }">
					${message }
				</c:if>
			</center>
		</form>
	</body>
</html>
