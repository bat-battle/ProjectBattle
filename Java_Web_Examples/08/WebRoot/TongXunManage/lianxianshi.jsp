<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>��ʾְ����Ϣ</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<style type="text/css">
<!--
.style1 {
	font-size: 16px;
	font-weight: bold;
	color: #0000FF;
}
body,td,th {
	font-size: 12px;
}
a:link {
	color: #0000FF;
}
a:visited {
	color: #0000FF;
}
a:hover {
	color: #0000FF;
}
.style2 {color: #000000}
.style3 {
	font-size: 14px;
	color: #000000;
}
.STYLE4 {
	font-size: 10pt;
	color: #FFFFFF;
}
-->
</style>
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
  <form name="form1" method="post" action="">
  <table width="337" height="478" border="0" align="center" cellspacing="1" bgcolor="#E9ECDB">
    <tr>
      <td height="27" colspan="2"><div align="center" class="STYLE2">ͨѶ����ϸ��Ϣ</div></td>
    </tr>
    <tr>
      <td width="74" bgcolor="#FFFFFF"><div align="right">ͨѶ������</div></td>
      <td width="256" bgcolor="#FFFFFF">
	  <%
	      String strId = request.getParameter("IDd");
	      System.out.print(strId);
	      List listTx = HibernateUtil.findTonId(Integer.parseInt(strId));
	        if(!listTx.isEmpty() && listTx.size()>0){
	        	for(int i=0;i<listTx.size();i++){
	        		TongXunAdd txa = (TongXunAdd)listTx.get(i);
	        	
	 %>
	 <%=txa.getDepartment()%>      </td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">��&nbsp;&nbsp;&nbsp;&nbsp;����</div></td>
      <td bgcolor="#FFFFFF"><%=txa.getName11()%></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">�������ڣ�</div></td>
      <td bgcolor="#FFFFFF"><%=txa.getBirthday()%>&nbsp;</td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">��&nbsp;&nbsp;&nbsp;&nbsp;��</div></td>
      <td bgcolor="#FFFFFF"><%=txa.getSex()%>&nbsp;</td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">����״����</div></td>
      <td bgcolor="#FFFFFF"><%=txa.getHy()%>&nbsp;</td>
    </tr>
    
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">�������ţ�</div></td>
      <td bgcolor="#FFFFFF"><%=txa.getDepartment()%>&nbsp;</td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">ְ&nbsp;&nbsp;&nbsp;&nbsp;��</div></td>
      <td bgcolor="#FFFFFF"><%=txa.getZw()%>&nbsp;</td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">����ʡ�ݣ�</div></td>
      <td bgcolor="#FFFFFF"><%=txa.getCf()%>&nbsp;</td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">���ڳ��У�</div></td>
      <td bgcolor="#FFFFFF"><%=txa.getCs()%>&nbsp;</td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">�칫�绰��</div></td>
      <td bgcolor="#FFFFFF"><%=txa.getPhone()%>&nbsp;</td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">�ƶ��绰��</div></td>
      <td bgcolor="#FFFFFF"><%=txa.getPhone1()%></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">��ͥ��ַ��</div></td>
      <td bgcolor="#FFFFFF"><%=txa.getAddress()%></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">OICQ��</div></td>
      <td bgcolor="#FFFFFF"><%=txa.getOICQ()%></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">��ͥ�绰��</div></td>
      <td bgcolor="#FFFFFF"><%=txa.getFamily()%>&nbsp;</td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">�������룺</div></td>
      <td bgcolor="#FFFFFF"><%=txa.getPostcode()%>&nbsp;</td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">email:</div></td>
      <td bgcolor="#FFFFFF"><%=txa.getEmail()%></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</div></td>
      <td bgcolor="#FFFFFF"><textarea name="textarea" cols="30" rows="4"><%=txa.getRemark()%>

</textarea></td>
    </tr>
    <%}} %>
    <tr bgcolor="#F3F3F3">
      <td colspan="2"><div align="center"> <input name="Submit3" type="button" class="btn_grey" onClick="JScript:window.close();" value="�ر�">
      </div></td>
    </tr>
  </table>
</form>
</body>




