<%@ page contentType="text/html;charset=gb2312"%>
<html>
  <title>��Ʒ��Ϣ��ѯ</title>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <style type="text/css">
<!--
.style1 {color: #000000}
.style2 {color: #333333}
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
   session.removeAttribute("khqu");
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> ��ǰλ�ã�������Ϣ���� > </span>��Ʒ��Ϣ��ѯ &gt;&gt;&gt;</td>
  </tr>
    <tr><td valign="top" height="83">
      <table width="98%" height="70" border="0" cellpadding="-2" cellspacing="-2">
        <tr><td width="550" height="43" align="Top">
          <form name="form1" method="POST" action="spquest.jsp" target="MainFrame">
            <div align="center">��ѡ���ѯ����:
              <select name="cif">
                <option value="spname" selected>��Ʒ����</option>
                <option value="gysname">��Ӧ��ȫ��</option>
                <option value="jc">���</option>
                <option value="cd">����</option>
                <option value="gg">���</option>
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

