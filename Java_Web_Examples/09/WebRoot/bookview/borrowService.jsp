<%@ page contentType="text/html; charset=gb2312" language="java"
	pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
	<head>
		<title>����ͼ�鳬��</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link href="css/style.css" rel="stylesheet">
		<script language="javascript" src="js/checkform.js"></script>
	</head>
	<body>
		<p>
			&nbsp;
		</p>
		<p align="center">
		<span></span>
		</p>
		<table width="90%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="100%" height="49" align="center">
					<form name="form1" method="post"
						action="borrowSearchBookOperation.htm" onsubmit="return checkBorrowService(form1)">
						�������ѯ������
						<select name="condition" id="condition" tabindex="2">
							<option selected="true">
								ѧ��
							</option>
							<option>
								���
							</option>
							<option value="��������">
								��������
							</option>
						</select>
						<input name="conditionContent" type="text" id="conditionContent">
						<input name="Submit" type="submit" class="button" value="�ύ">
						<input name="ShowAll" type="submit" id="showAll" value="ȫ����ʾ">
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
									ѧ��
								</div>
							</td>
							<td>
								<div align="center">
									���
								</div>
							</td>
							<td>
								<div align="center">
									����
								</div>
							</td>
							<td>
								<div align="center">
									����
								</div>
							</td>
							<td>
								<div align="center">
									��������
								</div>
							</td>
							<td>
								<div align="center">
									����Ա
								</div>
							</td>
						</tr>
						<c:forEach var="list" items="${list}">
							<tr>
								<td>
									<div align="center">
										${list.docuStuInfo.stuId }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${list.bookReginster.bookId }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${list.bookName }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${list.price }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${list.borrowDate }&nbsp;
									</div>
								</td>
								<td>
									<div align="center">
										${list.czy }&nbsp;
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
