<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>

<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="trans" scope="page" class="com.mingri.chinese.ToChinese"/>
<html>
  <title>����Ա����</title>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
  <body>
<%
   //��ֹ�Ƿ��û��ƹ���¼ҳ�棬ֱ�ӽ���ϵͳ�ڲ�
   boolean isLog=false;
   try{
     //����û��Ƿ��¼����Ϣ
     isLog=((String)session.getAttribute("isLog")).equals("1");
     }catch(Exception e){}
   if(!isLog){
     out.println("<script language='javascript'>alert('����û�е�¼');"+
                  "parent.location.href='../index.jsp';</script>");
     }
%>
<table width="584" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" colspan="6" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> ��ǰλ�ã�ϵͳ����> </span>����Ա���� &gt;&gt;&gt;</td>
  </tr>
  <tr><td height="40"></td></tr>
    <tr><td valign="top" height="83">
    <table width="100%" height="112"  border="0" cellpadding="0" cellspacing="0">
      <form name="form1" method="post" action="updateUser.jsp">
        <tr><td align="center">����Ա������
          <input type="text" name="username">
          </td></tr><tr><td align="center">
          ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�룺
          <input type="password" name="newpw1">
          </td></tr><tr><td align="center">
          ȷ�������룺
          <input type="password" name="newpw2">
         
        </td></tr>
      
        <tr><td align="center">
            <input name="submit1" type="button" class="btn_grey" value="ȷ��ע��" onClick="check()">
            &nbsp;
            <input type="reset" class="btn_grey" value="������д">
            <a href="userexit.jsp">�˳�ϵͳ</a>
          </td></tr></form>
	  </table>
		  </td></tr>
    </table>
  </body>
</html>
<script language="javascript">
function check()
{
  if(form1.username.value==""){
    alert("�������û���");form1.username.focus();return;
  }
  if(form1.newpw1.value==""){
    alert("����������");form1.newpw1.focus();return;
  }
  if(form1.newpw2.value==""){
    alert("���ٴ���������");form1.newpw2.focus();return;
  }
  if(form1.newpw1.value!=form1.newpw2.value){
    alert("�����������벻һ��,���������");
    form1.newpw1.value="";
    form1.newpw2.value="";
    form1.newpw1.focus();
    return;
  }
  form1.submit();
}
</script>







