<%@ page contentType="text/html;charset=gb2312"%>
<%request.setCharacterEncoding("gb2312");%>
<html>
  <title>�����˻�����</title>
  <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
  <link href="../../CSS/style.css" rel="stylesheet" type="text/css">
  <style type="text/css">
<!--
.style1 {color: #FF3535}
.style2 {color: #333333}
-->
  </style>
<body >
<script language='JavaScript'>
function  check()
{
  if(form1.qvalue.value==0){
    alert("�������ѯ�ؼ���");form1.qvalue.focus();return;}
  form1.submit();
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> ��ǰλ�ã���������> </span> �����˻����� &gt;&gt;&gt;</td>
  </tr>
    <tr><td valign="top" height="83">
      <table width="98%" height="50" border="0" cellpadding="0" cellspacing="0">
        <tr><td width="581" height="42" align="Top">
          <form name="form1" method="POST" action="xsthjz.jsp" target="MainFrame">
            <div align="center">��ѡ���ѯ����:
              <select name="cif">
                <option value="khname" selected>�ͻ�����</option>
                <option value="thph">�����˻�Ʊ��</option>
              </select>
              <select name="ccif">
                <option value="=" selected> ����</option>
                <option value="LIKE">LIKE</option>
              </select>
              <input type="text" name="qvalue">
              <input name="submit1" type="button" class="btn_grey" value="��ѯ" onClick="check()">
            </div>
          </form>
        </td></tr>
      </table>
    </td></tr>
</table>
</body>
</html>

