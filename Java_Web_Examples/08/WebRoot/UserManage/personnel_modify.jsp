<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<%@page import="com.hiernate.persistence.*"%>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<head>
	<html:base />
	<title>�޸�Ա����Ϣ</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
.style1 {color: #C60001}
.style2 {color: #669999}
.STYLE4 {
	font-size: 9pt;
	color: #FFFFFF;
}
.STYLE6 {
	font-size: 9pt;
	color: #000000;
}
-->
</style>
<script language="javascript">
function Mycheck()
{
if (form1.name.value=="")
{ alert("������Ա��������");form1.name.focus();return;}
if (form1.PWD.value=="")
{ alert("���������룡");form1.PWD.focus();return;}
if (form1.tel.value=="")
{ alert("������Ա������ϵ�绰��");form1.tel.focus();return;}
if(form1.email.value!="" && (form1.email.value.indexOf('@',0)==-1|| form1.email.value.indexOf('.',0)==-1))
{alert("�������E-mail��ַ���ԣ�");form1.email.focus();return;}
if (form1.address.value=="")
{ alert("������Ա����סַ��");form1.address.focus();return;}
form1.submit();
}
</script>
<body>
<table width="460" height="403" border="0" cellpadding="-2" cellspacing="-2" background="../Images/noword.jpg">
  <tr>
    <td width="817" height="349" valign="top"><table width="100%" height="102"  border="0" cellpadding="-2" cellspacing="-2">
      <tr>
        <td height="102"><table width="434" height="84" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="19" valign="bottom">&nbsp;&nbsp;&nbsp;&nbsp;<br><span class="STYLE6">&nbsp;&nbsp;�޸�Ա����Ϣ</span></td>
          </tr>
          <tr>
            <td height="59">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table>     
    <%
      String strid = request.getParameter("ID");
      session.setAttribute("idd",strid);
      List listUser = HibernateUtil.findUserId(Integer.parseInt(strid));
        if(!listUser.isEmpty()&&listUser.size()>0){
           for(int i=0;i<listUser.size();i++){
        	   User user = (User)listUser.get(i);
    %> 
      <br>
      <form ACTION="personnel_update.jsp" METHOD="POST" name="form1">
        <table width="95%" height="222"  border="0" align="center" cellpadding="-2" cellspacing="-2">
          <tr>
            <td colspan="2"><span class="STYLE6">&nbsp;�û�����<%=user.getUserName()%></span></td>
            <td class="STYLE6" align="center">���룺</td>
            <td colspan="3"><span class="style1">
              <input name="PWD" type="password" class="Sytle_text" id="name" value="<%=user.getPwd()%>">
            </span></td>
          </tr>
		  <tr>
            <td width="11%" height="27"><div align="center" class="STYLE6">������</div></td>
            <td width="25%" height="27"><span class="style1">
              <input name="name" type="text" class="Sytle_text" id="username2" value="<%=user.getName()%>" size="15">
            </span> </td>
            <td width="10%" height="27" class="style1"><div align="center" class="STYLE6">Ȩ�ޣ�</div></td>
            <td height="27"><select name="purview" id="purview">
             <%
              String strPurview = user.getPurview();
                 String[] s={"ϵͳ","��д","ֻ��"};
                 for(int j=0;j<s.length;j++){
        	if(strPurview.equals(s[j]))
        		{out.println("<option value='"+s[j]+"' selected='selected'>"+s[j]+"</option>");}
        	else
            	{out.println("<option value='"+s[j]+"'>"+s[j]+"</option>");}
        }
        %>
              
            </select></td>
            <td width="9%" height="27" class="style1"><div align="center" class="STYLE6">�Ա�</div></td>
            <td width="29%" height="27"><span class="style1">
              <select name="sex" id="select">
                 <%
               String strSex = user.getSex();
                 String[] sex={"��","Ů"};
                 for(int k=0;k<sex.length;k++){
        	 if(strSex.equalsIgnoreCase(sex[k]))
        		{out.println("<option value='"+sex[k]+"' selected='selected'>"+sex[k]+"</option>");}
        	 else
            	{out.println("<option value='"+sex[k]+"'>"+sex[k]+"</option>");}
        }
        %>
            </select>
</span></td>
          </tr>
          <tr>
            <td height="27"><div align="center" class="STYLE6">�绰��</div></td>
            <td height="27"><input name="tel" type="text" class="Sytle_text" id="tel" value="<%=user.getTel()%>" size="15"></td>
            <td width="10%" height="27" class="style1"><div align="center" class="STYLE6">���ţ�</div></td>
            <td width="16%" height="27"><select name="branch" id="branch">
             <%
              String strBarch = user.getBranch();
                 String[] b={"���²�","���۲�","�ۺ����","�߻���","��沿"};
              
                 for(int ii=0;ii<b.length;ii++){
        	if(strBarch.equalsIgnoreCase(b[ii]))
        		{out.println("<option value='"+b[ii]+"' selected='selected'>"+b[ii]+"</option>");}
        	else
            	{out.println("<option value='"+b[ii]+"'>"+b[ii]+"</option>");}
           }
            %>
             
            </select></td>
            <td width="9%" height="27"><div align="center"><span class="STYLE6">ְ��</span></div></td>
            <td height="27"><span class="style1">              <select name="job" id="job">
             <%
              String strjob = user.getJob();
                 String[] job={"����","���ž���","������Դ����","����","��������","��ͨԱ��","����Ա"};
                 for(int jj=0;jj<job.length;jj++){
        	if(strjob.equalsIgnoreCase(job[jj]))
        		{out.println("<option value='"+job[jj]+"' selected='selected'>"+job[jj]+"</option>");}
        	else
            	{out.println("<option value='"+job[jj]+"'>"+job[jj]+"</option>");}
        }
        %>
               
              </select>
</span></td>
          </tr>
          <tr>
            <td height="27" class="style1"><div align="center" class="STYLE6">E-mail��</div></td>
            <td height="27" colspan="5"><input name="email" type="text" class="Style_subject" id="email" value="<%=user.getEmail()%>" size="15"></td>
          </tr>
          <tr>
            <td height="27" class="style1"><div align="center" class="STYLE6">��ַ��</div></td>
            <td height="27" colspan="5"><input name="address" type="text"
			 class="Style_subject" id="address" value="<%=user.getAddress()%>"></td>
          </tr>
          <%}} %>
          <tr>
            <td colspan="6"><div align="center">
                <br>
                <input name="Button" type="button" class="btn_grey" value="�޸�" onClick="Mycheck()">
				&nbsp;&nbsp;
                <input name="Submit2" type="reset" class="btn_grey" value="����">
                </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>




