<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<jsp:include page="safe.jsp"/>
<html>
<head>
<title>����ͼ�鳬��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
<script src="../JS/check.jsp"></script>
</head>
<script language="javascript">
function mycheck(){
	if (form1.ISBN.value==""){
		alert("��������ţ�");form1.ISBN.focus();return;
	}
	if (form1.bookname.value==""){
		alert("������ͼ�����ƣ�");form1.bookname.focus();return;
	}
	if (form1.writer.value==""){
		alert("���������ߣ�");form1.writer.focus();return;
	}
	if (form1.type.value==""){
		alert("���������");form1.type.focus();return;
	}	
	if (form1.TPI.value==""){
		alert("����������磡");form1.TPI.focus();return;
	}	
	if (form1.pDate.value==""){
		alert("�����뷢�����ڣ�");form1.pDate.focus();return;
	}
	if (form1.price.value==""){
		alert("�����붨�ۣ�");form1.price.focus();return;
	}	
	if (isNaN(form1.price.value)){
		alert("������Ķ��۴������������룡");form1.price.value="";form1.price.focus();return;
	}		
	form1.submit();
}
</script>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" background="../Images/bg.gif">
  <tr>
    <td>
<table width="777" height="609"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td valign="top">
	<jsp:include page="Top.jsp"/>
	<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="tableBorder_LTR">
      <tr>
        <td height="30" align="center" bgcolor="#eeeeee">�ԡԡ� <a href="index.jsp">ͼ�����</a> �ԡԡ�</td>
      </tr>
    </table>
	<table width="100%" height="396"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LBR">
        <tr>
          <td width="26%" height="395" valign="top"><table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="55%" height="82" align="center" class="word_grey">&nbsp;<img src="../Images/reg.gif" width="84" height="54"></td>
              <td width="45%" align="left" class="word_grey">���ͼ����Ϣ</td>
            </tr>
            <tr>
              <td height="112" colspan="2" valign="top" class="word_grey"><ul>
                  <li> ��ţ�ͼ���ISBN�������������ȷ��������޸ġ�</li>
                  <li>�������ڣ�����������״η��е����ڣ���2005��10�¡�</li>
                  <li>�����ļ������Ƚ�ͼ��ķ����ļ����浽վ���manage\cover�ļ����£��������ļ������ɣ�������չ�����磺JSPxxxtkfaljx.jpg��</li>
                  <li>�Ƿ��Ƽ���ѡ���ǡ���ͼ����Ϣ����ʾ����վ����ҳ�С�</li>
                  <li>�Ƿ����飺ѡ���ǡ���ͼ����Ϣ����ʾ�ڡ������ϼܡ��С�</li>
                  </ul></td>
            </tr>
            <tr align="center">
              <td colspan="2" valign="middle" class="word_grey"></td>
            </tr>
          </table></td>
          <td width="5" valign="top" background="../Images/Cen_separate.gif"></td>
          <td width="73%" valign="top"><table width="100%" height="56"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">&nbsp;</td>
            </tr>
            <tr>
              <td align="center">
			  <form action="book_add_deal.jsp" method="post" name="form1">
			    <table width="100%"  border="0" align="center" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                  <tr>
                    <td width="14%" height="27">&nbsp;�顡���ţ�</td>
                    <td height="27">&nbsp;
                      <input name="ISBN" type="text" class="Sytle_text" id="bookID2">
</td>
                    <td height="27">&nbsp;�顡������</td>
                    <td height="27">&nbsp;
                          <input name="bookname" type="text" class="Style_upload" id="bookname2">
                    </td>
                  </tr>
                  <tr>
                    <td height="27">&nbsp;�������ߣ�</td>
                    <td width="25%" height="27">&nbsp;
                          <input name="writer" type="text" class="Style_upload" id="writer">
                    </td>
                    <td width="15%" height="27"> &nbsp;������ƣ�</td>
                    <td width="46%" height="27">&nbsp;
                          <input name="type" type="text" class="Sytle_text" id="zishu2">
                    </td>
                  </tr>
                  <tr>
                    <td height="27">&nbsp;��&nbsp;��&nbsp;�磺</td>
                    <td height="27">&nbsp;
                          <input name="TPI" type="text" class="Style_upload" id="TPI">
                    </td>
                    <td height="27">&nbsp;�������ڣ�</td>
                    <td height="27">&nbsp;
                          <input name="pDate" type="text" class="Sytle_text" id="pDate">
                   </td>
                  </tr>
                  <tr>
                    <td height="41">&nbsp;�����ļ���</td>
                    <td height="41">&nbsp;
                          <input name="cover" type="text" class="Style_upload" id="cover">
                    </td>
                    <td height="41">&nbsp;�ۡ�����</td>
                    <td height="41">&nbsp;
                          <input name="price" type="text" class="Sytle_text" id="price">
      (Ԫ)</td>
                  </tr>
                  <tr>
                    <td height="45">&nbsp;�Ƿ��Ƽ���</td>
                    <td>&nbsp; <input name="commend" type="radio" class="noborder" value="1" checked>
��
  <input name="commend" type="radio" class="noborder" value="0">
��</td>
                    <td>&nbsp;�Ƿ����飺</td>
                    <td><input name="newbook" type="radio" class="noborder" value="1" checked>
��
  <input name="newbook" type="radio" class="noborder" value="0">
��</td>
                  </tr>
                  <tr>
                    <td height="103">&nbsp;ͼ���飺</td>
                    <td colspan="3"><span class="style5">&nbsp; </span>
                        <textarea name="introduce" cols="60" rows="5" class="textarea" id="introduce"></textarea></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="4" align="center">
                        <input name="Button" type="button" class="btn_grey" value="����" onClick="mycheck()">
&nbsp;                        
<input name="Submit2" type="reset" class="btn_grey" value="����">
                        &nbsp;
                        <input name="Submit3" type="button" class="btn_grey" value="����" onClick="JScript:history.back()">
                    </td>
                  </tr>
                </table>
			  </form>
			  </td>
            </tr>
          </table></td>
        </tr>
      </table>
      <jsp:include page="copyright.jsp"/>
    </td>
  </tr>
</table>
</td>
  </tr>
</table>
</body>
</html>
