<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
ResultSet rs=connDB.executeQuery("select * from tb_poll");
%>
<html>
<head>
<title>����ͼ�鳬��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
<script src="../JS/check.jsp"></script>
</head>

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
        <td height="30" align="center" bgcolor="#eeeeee">�ԡԡ� <span class="word_grey"><a href="poll_add.jsp">���ͶƱ��Ŀ��Ϣ</a></span> �ԡԡ�</td>
      </tr>
    </table>
	<table width="100%" height="396"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LBR">
        <tr>
          <td width="26%" height="395" valign="top"><table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="55%" height="82" align="center" class="word_grey">&nbsp;<img src="../Images/reg.gif" width="84" height="54"></td>
              <td width="45%" align="left" class="word_grey">ͶƱ����</td>
            </tr>
            <tr>
              <td height="112" colspan="2" valign="top" class="word_grey"><ul><li>ͶƱ��Ŀ�����޸ģ�ֻ����Ӻ�ɾ����Ŀ��</li>
                <li> ���ͶƱ��Ŀ����������ͶƱ��Ŀ��Ϣ�������ӿ��Խ���ͶƱ��Ŀ����ӡ�</li>
                <li>ɾ��ͶƱ��Ŀ�����ÿ��ͶƱ��Ŀ��Ϣ����ġ�ɾ������ť����ɾ��ͶƱ��Ŀ��</li>
                </ul></td>
            </tr>
            <tr align="center">
              <td colspan="2" valign="middle" class="word_grey"></td>
            </tr>
          </table></td>
          <td width="5" valign="top" background="../Images/Cen_separate.gif"></td>
          <td width="73%" valign="top"><table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="13" align="center">&nbsp;</td>
            </tr>
          </table>
            <table width="100%" height="48"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
              <tr>
                <td height="27" align="center">ͶƱ��Ŀ</td>
                <td align="center">Ʊ��</td>
                <td width="6%" align="center">ɾ��</td>
              </tr>
<%
int ID=0;
String optionName="";
int poll=0;
while(rs.next()){
	ID=rs.getInt("ID");
	optionName=rs.getString("optionName");
	poll=rs.getInt("poll");
%>
              <tr style="padding:5px;">
                <td height="24" align="center"><%=optionName%></td>
                <td height="24" align="center"><%=poll%></td>
                <td align="center"><a href="poll_del.jsp?ID=<%=ID%>"><img src="../Images/del.gif" width="16" height="16"></a></td>
              </tr>
<%
}
%>
            </table>
		</td>
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
