<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<html>
	<head>
		<title>ͼ��ά��</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link href="css/style.css" rel="stylesheet">
	</head>
	<body>
		<table width="777" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tableBorder_LTR">
						<tr>
							<td height="30" align="center">
								<div align="center">
									
									<span class="word_grey"></span>
								</div>
							</td>
						</tr>
					</table>
					<form action="modifyBookOperation.htm" method="post"
						name="form1">
						<table width="84%" border="0" align="center" cellpadding="-2"
							cellspacing="-2">
						  <!--DWLayoutTable-->
							<tr>
								<td width="14%" height="27">
									&nbsp;�� �ţ�
								</td>
								<td height="41">
									&nbsp;
									<input name="book_id" type="text" id="bookID2"
										value="${result.bookId }" readonly="yes">
								</td>
								<td height="27">
									&nbsp;�� ����
								</td>
								<td height="27">
									&nbsp;
									<input name="book_name" type="text" id="bookname2"
										value="${result.bookName }">
								</td>
							</tr>
							<tr>
								<td height="27">
									&nbsp;�� �ߣ�
								</td>
								<td height="41">
									&nbsp;
									<input name="writer" type="text" id="writer"
										value="${result.writer }">
								</td>
								<td width="15%" height="27">
									&nbsp;������ƣ�
								</td>
								<td width="38%" height="27">
									&nbsp;
									<input name="book_type" type="text" id="zishu2"
										value="${result.bookType }">
								</td>
							</tr>
							<tr>
								<td height="27">
									&nbsp;��&nbsp;��&nbsp;�磺
								</td>
								<td height="41">
									&nbsp;
									<input name="book_concern" type="text" id="book_concern"
										value="${result.bookConcern }">
								</td>
								<td height="27">
									&nbsp;�������ڣ�
								</td>
								<td height="41">
									&nbsp;
									<input name="publish_date" type="text" id="publish_date"
										value="${result.publishDate }">
								</td>
							</tr>
							<tr>
								<td height="41">
									&nbsp;�� �� Ա��
								</td>
								<td height="41">
									&nbsp;
									<input name="czy" type="text" id="czy" value="${result.czy }">
								</td>
								<td height="41">
									&nbsp;�� ��
								</td>
								<td height="41">
									&nbsp;
									<input name="price" type="text" id="price"
										value="${result.price }">
									(Ԫ)
								</td>
							</tr>
							<tr>
								<td height="41">
									&nbsp;���������
								</td>
								<td height="41">
									&nbsp;
									<input name="book_count" type="text" id="book_count" value="${result.bookCount }">
								</td>
								<td height="41">
									&nbsp;���ʱ�䣺
								</td>
								<td height="41">
									&nbsp;
									<input name="reg_date" type="text" id="reg_date"
										value="${result.regDate }"
										readonly="yes">
								</td>
							</tr>
							<tr>
								<td height="103">
									&nbsp;ͼ���飺
								</td>
								<td colspan="3">
									<span class="style5">&nbsp; </span>
									<textarea name="remark" cols="65" rows="5" id="remark">${result.remark}</textarea>
								</td>
							</tr>
							<tr>
								<td height="38" colspan="4" align="center">
									<input name="Button" type="submit" value="����">
									&nbsp;
									<input name="Submit2" type="reset" value="����">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>
