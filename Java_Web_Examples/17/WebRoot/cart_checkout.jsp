<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<%
if(session.getAttribute("cart")==""){
	out.println("<script language='javascript'>alert('����û�й���!');window.location.href='index.jsp';</script>");
}
String Username="";
Username=(String)session.getAttribute("UserName");
if (Username!=""){
try{
ResultSet rs_user=connDB.executeQuery("select * from tb_Member where username='"+Username+"'");
if(!rs_user.next()){
	session.invalidate();
	out.println("<script language='javascript'>alert('���ȵ�¼���ٽ��й���!');window.location.href='index.jsp';</script>");
	return;
}else{
	String Truename=rs_user.getString("Truename");
	String address=rs_user.getString("address");
	String postcode=rs_user.getString("postcode");
	String tel=rs_user.getString("tel");
	String email=rs_user.getString("email");
%>
<html>
<head>
<title>����ͼ�鳬��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
function check(form){
	if(form.truename.value==""){
		alert("������������ʵ����!");form.truename.focus();return;	
	}
	if(form.address.value==""){
		alert("������������ϵ��ַ!");form.address.focus();return;	
	}	
	if(form.postcode.value==""){
		alert("������������������!");form.postcode.focus();return;	
	}	
	if(form.tel.value==""){
		alert("������������ϵ�绰!");form.tel.focus();return;	
	}
	if(form.email.value==""){
		alert("����������Email��ַ!");form.email.focus();return;	
	}
	var i=form.email.value.indexOf("@");
	var j=form.email.value.indexOf(".");
	if((i<0)||(i-j>0)||(j<0)){
		alert("�������Email��ַ����ȷ�����������룡");form.email.value="";form.email.focus();return;
	}
	form.submit();
}
</script>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" background="Images/bg.gif">
  <tr>
    <td>
<table width="777" height="768"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td valign="top">
	<jsp:include page="Top.jsp"/>
	<table width="100%" height="330"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="26%" valign="top">
		 <jsp:include page="left.jsp"/> 
		</td>
          <td width="5" valign="top" background="Images/Cen_separate.gif"></td>
          <td width="73%" valign="top"><table width="100%" height="272"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="97%" height="220" valign="top">
			   <table width="100%" height="126"  border="0" cellpadding="0" cellspacing="0">

			    <tr>
                  <td valign="top"><table width="100%" height="59"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="86%" height="61" class="tableBorder_B"><img src="Images/checkout.GIF" width="176" height="61"></td>
                    </tr>
                  </table>
<form method="post" action="cart_order.jsp" name="form1">
                    <table width="100%" height="339"  border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="7%" height="26">&nbsp; </td>
                        <td height="26" colspan="2" class="word_deepgrey">ע�⣺������Ҫ�����Ƿ��ύ����������ɲ���Ҫ���鷳��</td>
                        </tr>
                      <tr>
                        <td height="26" colspan="2" align="center">�� �� ����</td>
                        <td width="74%"><input name="username" type="text" id="username" value="<%=Username%>" readonly="yes">
                          *</td>
                      </tr>
                      <tr>
                        <td height="26" colspan="2" align="center">��ʵ������</td>
                        <td><input name="truename" type="text" id="truename" value="<%=Truename%>">
                          *</td>
                      </tr>
                      <tr>
                        <td height="26" colspan="2" align="center">��ϵ��ַ��</td>
                        <td><input name="address" type="text" id="address" value="<%=address%>">
                          *</td>
                      </tr>
                      <tr>
                        <td height="26" colspan="2" align="center">�������룺</td>
                        <td><input name="postcode" type="text" id="postcode" value="<%=postcode%>">
                          *</td>
                      </tr>
                      <tr>
                        <td height="26" colspan="2" align="center">��ϵ�绰��</td>
                        <td><input name="tel" type="text" id="tel" value="<%=tel%>">
                          *</td>
                      </tr>
                      <tr>
                        <td height="26" colspan="2" align="center">���ʽ��</td>
                        <td><select name="pay" class="textarea">
      <option>���и���</option>
      <option>��������</option>
      <option>�ֽ�֧��</option>
    </select>
                          *</td>
                      </tr>
                      <tr>
                        <td height="26" colspan="2" align="center">���ͷ�ʽ��</td>
                        <td><select name="carry" class="textarea">
      <option>��ͨ�ʼ�</option>
      <option>�ؿ�ר��</option>
      <option>EMSר�ݷ�ʽ</option>
    </select>
                          *</td>
                      </tr>
                      <tr>
                        <td height="26" colspan="2" align="center">Email��ַ��</td>
                        <td><input name="email" type="text" id="email" value="<%=email%>" size="50">
                          *</td>
                      </tr>
                      <tr>
                        <td height="101" colspan="2" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
                        <td><textarea name="bz" cols="50" rows="5" class="textarea" id="bz"></textarea></td>
                      </tr>
                      <tr align="center">
                        <td colspan="3"><input name="Button" type="button" class="btn_grey" value="�ύ" onClick="check(form1)">
                           &nbsp;
                           <input name="Submit2" type="button" class="btn_grey" value="����" onClick="history.back(1);"></td>
                        </tr>
                    </table>
</form>					
					</td>
			     </tr>
              </table>
					  </td>
              <td width="3%" valign="top">&nbsp;</td>
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
<%}
}catch(Exception e){
out.println(e.toString());
}
}else{
	session.invalidate();
	out.println("<script language='javascript'>alert('���ȵ�¼���ٽ��й���!');window.location.href='index.jsp';</script>");
}
%>