<%@ page contentType="text/html;charset=gb2312"%>
<html>
  <title>�ͻ���Ϣ��ѯ</title>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <style type="text/css">
<!--
.style2 {color: #333333}
-->
  </style>
<body bgcolor="#FFFFFF" text="#000000" >
<script language='JavaScript'>
function listall()
{
form1.ccif.value="ALL";//��ccif��ֵ����Ϊ"ALL"
form1.submit();}//�ύ��
function check()
{
  if(form1.qvalue.value==0){
    alert('������ѯ�ؼ���');form1.qvalue.focus();return;
  }
  form1.submit();
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> ��ǰλ�ã�������Ϣ���� > </span> �ͻ���Ϣ��ѯ &gt;&gt;&gt;</td>
  </tr>
    <tr><td valign="top" height="83">
      <table width="98%" height="70" border="0" cellpadding="0" cellspacing="0">
        <tr><td width="550" height="43" align="Top">
          <form name="form1" method="POST" action="khquest.jsp" target="MainFrame">
            <div align="center"> &nbsp;&nbsp; &nbsp;&nbsp;��ѡ���ѯ����:
              <select name="cif">
                <option value="khname" selected>�ͻ�����</option>
                <option value="khjc">�ͻ����</option>
              </select>
              <select name="ccif">
                <option value="=" selected> ����</option>
                <option value="LIKE">LIKE</option>
                <option value="ALL">ALL</option>
              </select>
              <%request.setCharacterEncoding("gb2312");%>
              <input type="text" name="qvalue">
              <input name="submit1" type="button" class="btn_grey" value="��ѯ" onClick="check()">
              <input name="submit2" type="submit" class="btn_grey" value="��ʾȫ������" onClick="listall()">
            </div>
          </form>
        </td></tr>
      </table>
    </td></tr>
</table>
</body>
</html>

