<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
	<head>
		<title>ͼ��黹</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link href="css/style.css" rel="stylesheet">
		<script language="javascript" src="js/checkform.js"></script>
	</head>
	<body>
		<table width="90%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tableBorder_LTR">
						<tr>
							<td height="30" align="center">
								<div align="center">
									<p>
										
										<span class="word_grey"></span>
									</p>
								</div>
							</td>
						</tr>
					</table>
					<form action="returnBookOperation.htm" method="post" name="form1">
						<table width="84%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<!--DWLayoutTable-->
							<tr>
								<td width="14%" height="27">
									&nbsp;ѧ �ţ�
								</td>
								<td height="41">
									&nbsp;
									<input name="stu_id" type="text" id="bookID2"
										value="${info.stu.stuId }"
										onchange="if(stu_id.value==''||isNaN(stu_id.value))alert('�������ָ�ʽ����ѧ��!');else window.location.href='returnBookOperation.htm?stu_id='+stu_id.value+'&book_id='+book_id.value">
								</td>
								<td height="27">
									&nbsp;ѧ��������
								</td>
								<td height="27">
									&nbsp;
									<input name="stu_name" type="text" id="bookname2"
										value="${info.stu.name }" readonly="yes">
								</td>
							</tr>
							<tr>
								<td width="14%" height="27">
									&nbsp;�� �ţ�
								</td>
								<td height="41">
									&nbsp;
									<input name="book_id" type="text" id="bookID2"
										value="${info.borrow.bookReginster.bookId }"
										onblur="if(book_id.value=='')alert('���������!');else window.location.href='returnBookOperation.htm?stu_id='+stu_id.value+'&book_id='+book_id.value">
								</td>
								<td height="27">
									&nbsp;�� ����
								</td>
								<td height="27">
									&nbsp;
									<input name="book_name" type="text" id="book_name"
										readonly="yes" value="${info.borrow.bookName }">
								</td>
							</tr>
							<tr>
								<td height="41">
									&nbsp;�������ڣ�
								</td>
								<td height="41">
									&nbsp;&nbsp;
									<input name="borrow_date" type="text" id="borrow_date"
										value="${info.borrow.borrowDate }" readonly="yes">
								</td>
							</tr>
							<tr>
								<td height="38" colspan="4" align="center">
									<input name="return" type="submit" value="�黹" onclick="return checkBorrow(form1)">
									&nbsp;
									<input name="reset" type="reset" value="����">
								</td>
							</tr>
						</table>
						<hr>
						<table width="90%" border="1" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td>
									<div align="center">
										ѧ��
									</div>
								</td>
								<td>
									<div align="center">
										����
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
										��������
									</div>
								</td>
							</tr>
							<c:forEach var="list" items="${info['list']}">
								<tr>
									<td>
										<div align="center">
											${list.docuStuInfo.stuId}
										</div>
									</td>
									<td>
										<div align="center">
											${info.stu.name }
										</div>
									</td>
									<td>
										<div align="center">
											${list.bookReginster.bookId }
										</div>
									</td>
									<td>
										<div align="center">
											${list.bookName }
										</div>
									</td>
									<td>
										<div align="center">
											${list.borrowDate }
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>
