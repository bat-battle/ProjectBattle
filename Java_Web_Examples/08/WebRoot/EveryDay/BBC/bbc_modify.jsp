<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*,com.hiernate.util.*"%>
<jsp:directive.page import="com.hiernate.persistence.Placard;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>������ϸ��Ϣ</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
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
 function mymodify()
 {
 if (form1.subject.value=="")
 {
 alert("�����빫�����⣡");form1.subject.focus();return;}
 if (form1.content.value=="")
 { alert("�����빫�����ݣ�");form1.content.focus();return;}
 form1.submit();
}
</script>
	<link href="../../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
         <%
            String strid= request.getParameter("ID");                               //����������
            List listPlacard = HibernateUtil.finplacardId(Integer.parseInt(strid)); //����HibernateUtil��������id���ҹ���
             if(!listPlacard.isEmpty()&&listPlacard.size()>0){                      //�ж�listPlacard�Ƿ�Ϊ��
            	 for(int i=0;i<listPlacard.size();i++){
            	  Placard placard =(Placard) listPlacard.get(i);
            	  session.setAttribute("placard",placard);                           //���õ���Placard����session��
          %>
    <table width="576" height="461" border="0" cellpadding="-2" cellspacing="-2"
     background="../../Images/noword.jpg">
  <tr>
    <td width="817" height="250" valign="top"><table width="100%" height="20"
	 border="0" cellpadding="-2" cellspacing="-2">
      <tr><br><br>
        <td height="22" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE6">&nbsp;�޸Ĺ�����Ϣ</span></td>
      </tr>
	  <tr>
	  </tr>
    </table>      
      <form ACTION="bbc_modifyCenter.jsp" METHOD="POST" name="form1"> <!-- ���ύ��bbc_modifyCenter.jsp -->
        <table width="80%" height="224"  border="0" align="center" cellpadding="-2" cellspacing="-2">
          <tr>
            <td height="27" colspan="2" align="left"><span class="style1">&nbsp;<span class="STYLE6">�����ˣ�</span></span>
			<span class="STYLE6"><%=placard.getPerson()%></span></td>      <!-- �����ҳ��Ĺ��淢������ʾ���ı����� -->
            <td width="19%"><div align="center" class="STYLE6">�������ڣ�</div></td>
            <td width="30%"><span class="STYLE6"><%=placard.getDDate()%></span></td> <!-- ������������ʾ���ı����� -->
          </tr>
          <tr>
            <td width="14%" height="29"><div align="center">
			<span class="STYLE6">���⣺</span></div></td>
            <td colspan="3"><input name="subject" type="text" class="Style_subject"
			 id="subject2" value="<%=placard.getSubject()%>"></td>               <!-- ������������ʾ���ı����� -->
          </tr>
          <tr>
            <td height="129" valign="top"><div align="center" class="STYLE6">���ݣ�</div></td>
            <td colspan="3"><textarea name="content" cols="53" rows="6"
			 class="Style_content" id="content"><%=placard.getContent()%></textarea></td> <!-- ������������ʾ���ı����� -->
          </tr>
          <tr>
            <td colspan="4"><div align="center">
                <input name="but_midify" type="button" class="btn_grey" id="midify"
				 onClick="mymodify()" value="�޸�">                                <!-- ����޸İ�ť -->
                <input name="myclose" type="button" class="btn_grey" id="myclose"
				 value="�ر�" onClick="javascrip:window.close()">����������������������<!-- ��ӹرհ�ť,�������رմ��壬ϵͳ�����������޸Ĳ��� -->
			</div></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
<%}} %>
</body>




