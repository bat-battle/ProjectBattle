<%@ page contentType="text/html;charset=gb2312"%>
<html>
  <title>��Ӧ����Ϣ��ѯ</title>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
  <style type="text/css">
<!--
.style1 {color: #333333}
-->
  </style>
<body bgcolor="#FFFFFF" text="#000000" >
<script language='JavaScript'>
function listall()
{window.location.reload();
form1.ccif.value="ALL";

form1.submit();}
function  aa()
{
  window.location.reload();
  form1.submit();
}
</script>
<%
   session.removeAttribute("gysqu");
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" colspan="6" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> ��ǰλ�ã�������Ϣ����> </span>��Ӧ����Ϣ��ѯ &gt;&gt;&gt;</td>
  </tr>
     <tr><td valign="top" height="83">
      <table width="98%" height="50" border="0" cellpadding="-2" cellspacing="-2">
        <tr><td width="550" height="43" align="Top">
          <form name="form1" method="POST" action="gysquest.jsp" target="MainFrame">
            <div align="center">��ѡ���ѯ����:
              <select name="cif">
                <option value="gysname" selected>��Ӧ��ȫ��</option>
                <option value="jc">���</option>
              </select>
              <select name="ccif">
                <option value="=" selected> ����</option>
                <option value="LIKE">LIKE</option>
                <option value="ALL">ALL</option>
              </select>
              <%request.setCharacterEncoding("gb2312");%>
              <input type="text" name="qvalue">
              <input name="submit1" type="submit" class="btn_grey" value="��ѯ" onClick="aa()">
              <input name="submit2" type="submit" class="btn_grey" value="��ʾȫ������" onClick="listall()">
            </div>
          </form>
        </td></tr>
      </table>
    </td></tr>
</table>
</body>
</html>
