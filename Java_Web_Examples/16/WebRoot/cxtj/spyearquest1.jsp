<%@ page contentType="text/html;charset=gb2312" language="java"%>
<html>
  <title>��Ʒ��������</title>
  <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
    <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <body>
  <table width="590" border="0" cellspacing="-2" cellpadding="-2">
    <tr height="6"><td>
        </td>
    </tr>
    <tr><td valign="top" height="83">
      <table width="99%" border="0" cellspacing="0" cellpadding="0">
<tr bgcolor="#FF9933">
    <td height="27" colspan="6" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> ��ǰλ�ã���ѯͳ��></span>�����۶���� &gt;&gt;&gt;</td>
  </tr>
      <form name="form2" method="post" action="spyearquest.jsp" target="MainFrame">
  <tr>
    <td height="30" colspan="6">&nbsp;��ѡ��Ҫ���з�������ݣ�
      <select name="year" id="year" >
        <%for(int i=2000;i<=2049;i++){%>
        <option value="<%=i%>" ><%=i%>��</option>
	<%}%>
      </select>
        <input name="Submit" type="submit" class="btn_grey" value="ȷ������"></td>
  </tr>
  </form>
  </table>
    </td></tr></table>
</body>
</html>
  </body>
</html>
