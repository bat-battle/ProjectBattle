<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="trans" scope="page" class="com.mingri.chinese.ToChinese"/>
<html>
  <title>�û���������</title>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
  <head>
  	<script language="javascript" >
		function check(){
			var pwd = document.getElementById("pwd");
			var newpwd1 = document.getElementById("newpwd1");
			var newpwd2 = document.getElementById("newpwd2");
		  if(pwd.value==""){
		    alert("����������");
		    document.getElementById("pwd").focus();
		    return false;
		  }
		  if(newpwd1.value==""){
		    alert("������������");
		   document.getElementById("newpwd1").focus();
		    return false;
		  }
		  if(newpwd2.value==""){
		    alert("���ٴ�����������");
		    document.getElementById("newpwd2").focus();
		    return false;
		  }
		  if(newpwd1.value!=newpwd2.value){
		    alert("�������������벻һ��,���������");
		    document.getElementById("newpwd1").value="";
		    document.getElementById("newpwd2").value="";
		    document.getElementById("newpwd1").focus();
		    return false ;
		  }
			return true;
		}
		function modify()
		{
			if(check()){
				 document.getElementById("modify_form").action="usermodify.jsp";
				 document.getElementById("modify_form").method="post";
				 document.getElementById("modify_form").submit();
			}
		}
		function reset()
		{
		   document.getElementById("modify_form").reset();
		}
</script>
  </head>
  <body>
<%
    request.setCharacterEncoding("gb2312");//���ַ���ͳһ���������ύ�е�������������
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
    &nbsp;<span  class="word_deepgrey"> ��ǰλ�ã�ϵͳ���� > </span>���������޸� &gt;&gt;&gt;</td>
  </tr>
    <tr><td valign="top" height="83">
    <form  id="modify_form"  method="post" action="usermodify.jsp">
    <table width="100%" height="163"  border="0" cellpadding="0" cellspacing="0">
	<tr><td  height="27"></td></tr>
      
        <tr>
        	<td height="25" align="center">
        		����Ա������
          		<input type="text" name="username"
             		value="<%=session.getAttribute("username")%>" readonly />
          	</td>
         </tr>
         <tr>
         	<td height="25" align="center">ԭ&nbsp;&nbsp;��&nbsp;&nbsp;�룺
          		<input type="password" name="password" id="pwd" />
          	</td>
         </tr>
         <tr>
         <td height="25" align="center">��&nbsp;&nbsp;��&nbsp;&nbsp;�룺
          		<input type="password" name="newpw1" id="newpwd1" />
          </td>
          </tr>
          <tr>
          	<td height="25" align="center">ȷ�������룺
          		<input type="password" name="newpw2" id="newpwd2" />
          </td>
          </tr>
        <tr>
        	<td height="36" align="center">
          		<input type="button" class="btn_grey" value="ȷ���޸�" onClick="modify()">
            	<input type="reset" class="btn_grey" value="ȡ���޸�" onClick="reset()">
           		<a href="userexit.jsp">�˳�ϵͳ</a>
          	</td>
          </tr>
          
    </table>
    </form>
	</td></tr></table>
  </body>
</html>








