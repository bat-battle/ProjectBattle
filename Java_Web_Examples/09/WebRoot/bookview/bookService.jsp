<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
	<head>
		<title>����ͼ�鳬��</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link href="css/style.css" rel="stylesheet">
	</head>
	<body>
		<table width="90%" border="0" cellpadding="0" cellspacing="0"
						class="tableBorder_LTR">
          <tr>
            <td height="40" align="center">
              <div align="center">
                <p><span></span></p>
            </div></td>
          </tr>
        </table>
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td width="100%" height="49" align="center">
		<form name="form1" method="post" action="searchBookOperation.htm">�������ѯ������
		 <select name="condition" id="condition" tabindex="2">
		  <option selected="true">���</option>
		  <option>����</option>
		  <option>������</option></select> <input name="conditionContent" type="text" id="conditionContent"> <input type="submit" name="Submit" value="�ύ"> </form></td></tr></table>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0"><!--DWLayoutTable-->
	<tr>
	  <td width="100%" height="362" valign="top">
		<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"><!--DWLayoutTable-->
			<tr>
			  <td><div align="center">���</div></td>
			  <td><div align="center">����</div></td>
			  <td><div align="center">������</div></td>
			  <td><div align="center">����</div></td>
		      <td><div align="center">�������</div></td>
			  <td><div align="center">ά��</div></td></tr>
			<c:forEach var="book" items="${result}">
			<tr>
			  <td><div align="center">${book.bookId }&nbsp;</div></td>
			  <td><div align="center">${book.bookName }&nbsp;</div></td>
			  <td><div align="center">${book.bookConcern }&nbsp;</div></td>
			  <td><div align="center">${book.price }&nbsp;</div></td>
		      <td><div align="center">${book.bookCount }&nbsp;</div></td>
		      <td class="button_03" align="middle"><div align="center"><a href="detailBookOperation.htm?bookID='${book.bookId }'" target="mainFrame">����</a></div></td></tr></c:forEach></table></td></tr></table></body>
</html>
