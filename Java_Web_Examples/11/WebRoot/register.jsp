<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>
<head>
<title>MR���繺������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<script src="JS/check.js"></script>
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
          <td height="45" valign="top" background="images/sub_register.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="10" valign="top">&nbsp;</td>
        </tr>
            <tr valign="top">
              <td height="134" align="center">
		  <form action="register_deal.jsp" method="post" name="myform">
		  <table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <script language="javascript">
						   function openwin(UID){
						   if (UID==""){
								alert("�������û���!");
								myform.username.focus();
								return;
						   }
						   var str="checkUserName.jsp?username="+UID;
						   window.showModalDialog(str,"","dialogWidth=300px;dialogHeight=150px;status=no;help=no;scrollbars=no");
						   }
			    </script>
              <td width="18%" height="30" align="center">�� �� ����</td>
              <td width="82%" class="word_grey"><input name="username" type="text" maxlength="20">
                <span class="word_orange">*</span> <span class="word_orange">[</span><a href="#" onClick="openwin(myform.username.value)">����û���</a><span class="word_orange">]</span></td>
            </tr>
            <tr>
              <td height="28" align="center">��ʵ������</td>
              <td height="28"><input name="truename" type="text" maxlength="10">
                <span class="word_orange">*</span></td>
            </tr>
            <tr>
              <td height="28" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�룺</td>
              <td height="28"><input name="pwd" type="password" size="20" maxlength="20">
                <span class="word_orange">*</span></td>
            </tr>
            <tr>
              <td height="28" align="center">ȷ�����룺</td>
              <td height="28"><input name="pwd1" type="password" size="20" maxlength="20">
                <span class="word_orange">*</span> </td>
            </tr>
            <tr>
              <td height="28" align="center">���ڳ��У�</td>
              <td><input name="city" type="text"></td>
            </tr>
            <tr>
              <td height="28" align="center">��ϵ��ַ��</td>
              <td class="word_grey"><input name="address" type="text"size="50"></td>
            </tr>
            <tr>
              <td height="28" align="center">�������룺</td>
              <td class="word_grey"><input name="postcode" type="text" size="20"></td>
            </tr>
            <tr>
              <td height="28" align="center">֤�����룺</td>
              <td><input name="cardno" type="text">
              <span class="word_orange">*</span></td>
            </tr>
            <tr>
              <td height="28" align="center">֤�����</td>
              <td><input name="cardtype" type="radio" class="noborder" value="���֤" checked>
      ���֤&nbsp;
      <input name="cardtype" type="radio" class="noborder" value="����֤">
      ����֤
      <input name="cardtype" type="radio" class="noborder" value="ѧ��֤">
      ѧ��֤</td>
            </tr>
            <tr>
              <td height="28" align="center">��ϵ�绰��</td>
              <td><input name="tel" type="text"></td>
            </tr>
            <tr>
              <td height="28" align="center" style="padding-left:10px">Email��</td>
              <td class="word_grey"><input name="email" type="text" size="50">
                <span class="word_orange">*</span></td>
            </tr>

            <tr>
              <td height="34">&nbsp;</td>
              <td class="word_grey"><input name="Button" type="button" class="btn_bg_long1" value="ȷ������" onClick="check()">
                  <input name="Submit2" type="reset" class="btn_bg_long1" value="������д">
                  <input name="Submit22" type="button" class="btn_bg_short" value="����" onClick="window.location.href='index.jsp'">
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
</body>
</html>