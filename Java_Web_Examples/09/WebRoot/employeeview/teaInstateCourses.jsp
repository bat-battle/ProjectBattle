<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("��δ��¼�����߳�ʱ�����¼ϵͳ");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<html>
	<head>
		<title>��ְ�ο�</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="css/style.css" rel="stylesheet">
	</head>
	<script src="js/checkform.js"></script>
	<body>
	<tr>
			 <td height="44" colspan="6">
				&nbsp;
			 </td>
		   </tr>
		<form name="form1" method="post" action="courseEmployeeLoader.htm" onsubmit="return checkCourse(form1)">
			<table width="80%" height="123" border="0" align="center">
				<tr>
					<td height="44" colspan="6">
						<div align="center">
							�ԡԡ�
							<span class="word_grey">��ְ�ο� </span>�ԡԡ�
						</div>
					</td>
				</tr>
				<tr>
					<td height="73">
						��ʦ��ţ�
					</td>
					<td>
						<input type="text" name="teaId" maxlength="4" size="6"
							value="${teaInfo.teaId }"
							onchange="window.location.href='courseEmployeeLoader.htm?teaId='+this.value">
						<div align="right">
						</div>
					</td>
					<td>
						�οο�Ŀ��
					</td>
					<td>
						<select name="code">
							<c:forEach var="courses" items="${list }">
								<option value="${courses.code }">
									${courses.subject }
								</option>
							</c:forEach>
						</select>
					</td>
					<td>
						��ְ����
					</td>
					<td>
						<input type="text" name="rkrq" size="12">
					</td>
				</tr>
			</table>
			<br>
			<table width="80%" height="99" border="1" align="center"
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
			<br>
			
			<table width="70%" height="55" border="0" align="center">
				<tr>
					<td height="51">
						<div align="right">
							<input type="submit" name="Submit" value="�ύ">
						</div>
					</td>
					<td>
						&nbsp;
					</td>
					<td>
						<input type="reset" name="Submit2" value="����">
					</td>
				</tr>
				<tr>
					<td colspan="6" align="center">
						${message }&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
