<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%
String path = request.getContextPath();
if(null==session.getAttribute("admin")){
	 out.print("<script language=javascript>alert('���Ѿ���������Ͽ��������µ�¼��');window.location.href='"+path+"/admin/index.jsp';</script>");
}
%>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<table width="900" height="98" border="0" align="center" cellpadding="0" cellspacing="0" background="images/a_top.gif">
  <tr>
    <td width="450">&nbsp;</td>
    <td width="450" valign="top"><table width="446" height="91" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="446" height="91" valign="bottom">
			<a href="userInfo_queryUser.htm" class="a2">�û�����</a>&nbsp;&nbsp;&nbsp; 
	<a href="articleInfo_admin_articleQuery.htm" class="a2">���¹���</a>&nbsp;&nbsp;&nbsp;
	 <a href="photoInfo_admin_photoQuery.htm" class="a2">ͼƬ����</a>&nbsp;&nbsp;&nbsp; 
	 <a href="admin/admin/admin_passwordUpdate.jsp" class="a2">�޸Ĺ���Ա����</a>&nbsp;&nbsp;&nbsp; 	
	 <a href="adminInfo_landOutAdmin.htm" class="a2">�˳���̨</a>
		
		</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_b_top2.gif">
  <tr>
    <td height="32">&nbsp;&nbsp;<font color="#FFFFFF"><b>��ǰ��¼����Ա��${sessionScope.admin}</b></font></td>
  </tr>
</table>

