<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
if(request.getParameter("content")!="" && request.getParameter("content")!=null){
	String content=chStr.chStr(request.getParameter("content"));
	int ret=connDB.executeUpdate("insert into tb_BBS (content) values('"+content+"')");
	if (ret!=0){
		out.println("<script language='javascript'>alert('������Ϣ��ӳɹ���');window.location.href='BBSManage.jsp';</script>");
		}else{
		out.println("<script language='javascript'>alert('������Ϣ���ʧ�ܣ�');window.location.href='BBSManage.jsp';</script>");
	}
}
%>
<html>
<head>
<title>�������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
function mycheck(){
	if (form1.content.value==""){
		alert("�����빫�����ݣ�");form1.content.focus();return;
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
        <td height="30" align="center" bgcolor="#eeeeee">�ԡԡ� <a href="BBSManage.jsp">�������</a> �ԡԡ�</td>
      </tr>
    </table>
	<table width="100%" height="396"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LBR">
        <tr>
          <td width="26%" height="395" valign="top"><table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="55%" height="82" align="center" class="word_grey">&nbsp;<img src="../Images/reg.gif" width="84" height="54"></td>
              <td width="45%" align="left" class="word_grey">��ӹ�����Ϣ</td>
            </tr>
            <tr>
              <td height="112" colspan="2" valign="top" class="word_grey"><ul>
                  <li>������Ϣ�����޸ģ�ֻ����Ӻ�ɾ����</li>
                  <li> ��ӹ�����Ϣ���������ӹ�����Ϣ�������ӿ��Խ��й�����Ϣ����ӡ�</li>
                  <li>ɾ��ͼ����Ϣ�����ÿ��ͼ����Ϣ����ġ�ɾ������ť����ɾ��ͼ����Ϣ��</li>
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
			  <form action="BBS_add.jsp" method="post" name="form1">
			    <table width="100%"  border="0" align="center" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                  <tr>
                    <td width="14%" height="272">&nbsp;�������ݣ�</td>
                    <td width="86%">
                        <textarea name="content" cols="60" rows="15" class="textarea"></textarea></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="2" align="center">
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
