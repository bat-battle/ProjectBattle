<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
if(session.getAttribute("cart")==""){
	out.println("<script language='javascript'>alert('����û�й���!');window.location.href='index.jsp';</script>");
}
String Username="";
Username=(String)session.getAttribute("username");
if (Username!=""){
try{
ResultSet rs_user=conn.executeQuery("select * from tb_Member where username='"+Username+"'");
if(!rs_user.next()){
	session.invalidate();
	out.println("<script language='javascript'>alert('���ȵ�¼���ٽ��й���!');window.location.href='index.jsp';</script>");
	return;
}else{
	String Truename=rs_user.getString("Truename");
	String address=rs_user.getString("address");
	String postcode=rs_user.getString("postcode");
	String tel=rs_user.getString("tel");
%>
<script language="javascript">
function check_member(form){
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
	form.submit();
}
</script>
<html>
<head>
<title>MR���繺������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>

<body>
<jsp:include page="navigation.jsp"/>
<jsp:include page="login_u.jsp"/>
<jsp:include page="ad.jsp"/>
<table width="788" height="236"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="193" height="182" valign="top" bgcolor="#FFFFFF">
	<jsp:include page="search.jsp"/>
    <jsp:include page="goodsType.jsp"/>
	</td>
    <td valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="45" valign="top" background="images/sub_checkout.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="10" valign="top">&nbsp;</td>
        </tr>
            <tr valign="top">
              <td height="134" align="center">
<form method="post" action="cart_order.jsp" name="form_checkout">
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
                        <td height="101" colspan="2" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
                        <td><textarea name="bz" cols="50" rows="5" class="textarea" id="bz"></textarea></td>
                      </tr>
                      <tr align="center">
                        <td colspan="3"><input name="Button" type="button" class="btn_bg_short" value="�ύ" onClick="check_member(form_checkout)">
                           &nbsp;
                           <input name="Submit2" type="button" class="btn_bg_short" value="����" onClick="history.back(1);"></td>
                        </tr>
                    </table>
</form>
	  
	  
	  </td>
        </tr>
    </table></td>
  </tr>
</table>
 <jsp:include page="copyright.jsp"/>
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