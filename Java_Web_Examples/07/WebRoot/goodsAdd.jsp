<%@ page contentType="text/html; charset=gb2312" language="java" %>
<script language="javascript">
function mycheck(form1){
	if(form1.name.value==""){
		alert("����д��Ʒ����!");form1.name.focus();return false;
	}
	if(form1.spec.value==""){
		alert("����д��Ʒ���!");form1.spec.focus();return false;
	}
	if(form1.unit.value==""){
		alert("����д��λ��Ϣ!");form1.unit.focus();return false;
	}
	if(form1.price.value==""){
		alert("����д��Ʒ����!");form1.price.focus();return false;
	}
	if(isNaN(form1.price.value)){
		alert("������ĵ�����Ϣ��������������!");form1.price.focus();return false;
	}
	if(form1.producer.value==""){
		alert("����д��������!");form1.producer.focus();return false;
	}	
}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���ʹ���ϵͳ</title>
<link rel="stylesheet" href="Css/style.css">
</head>

<body>
<table width="757" height="174" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="133" align="center" valign="top"><%@ include file="top.jsp"%></td>
  </tr>
  <tr>
    <td>
      <table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" background="images/area_bg.jpg">
        <tr>
          <td width="26%" align="center" class='word_white'>��ǰ��¼�û���<%=session.getAttribute("username")%></td>
          <td width="4%">&nbsp;</td>
          <td width="70%" valign="bottom">��ǰλ�ã�������Ϣ &gt; ���ʹ��� &gt; ���������Ϣ &gt;&gt;&gt;</td>
        </tr>
      </table>
<table width="100%" height="385" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td width="5" valign="top" background="images/left.gif">&nbsp;</td>
        <td align="center" valign="top">&nbsp;
		<form name="form1" method="post" action="goods.do?action=goodsadd" onSubmit="return mycheck(form1)">
        <table width="96%" height="203" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#DDDDDA" bordercolordark="#FFFFFF">
          <tr>
            <td width="31%" align="center">�������ƣ�</td>
            <td width="69%" align="left"><input name="name" type="text" id="name" size="60"></td>
            </tr>
         <tr>
            <td align="center">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
            <td align="left"><input name="spec" type="text" id="spec" size="50"></td>
            </tr>
         <tr>
           <td align="center">��&nbsp;&nbsp;&nbsp;&nbsp;λ��</td>
           <td align="left"><input name="unit" type="text" id="unit"></td>
         </tr>
         <tr>
           <td align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ۣ�</td>
           <td align="left"><input name="price" type="text" id="price">
             (Ԫ)</td>
         </tr>
         <tr>
           <td align="center">�������ң�</td>
           <td align="left">
             <input name="producer" type="text" id="producer" size="50">
             <input name="ifdel" type="hidden" id="ifdel" value="0"></td>
         </tr>
         <tr>
           <td>&nbsp;</td>
           <td>
             <input name="Submit" type="submit" class="btn_grey" value="����">
&nbsp;
<input name="Submit2" type="reset" class="btn_grey" value="����">
&nbsp;
<input name="Submit3" type="button" class="btn_grey" value="����" onClick="window.location.href='goods.do?action=goodsRequest'"></td>
         </tr>
        </table>
		</form>
		</td>
        <td width="10" valign="top" background="images/right.jpg">&nbsp;</td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="55" valign="top" background="images/bottom.jpg"><%@ include file="copyright.jsp"%></td>
  </tr>
</table>
</body>
</html>

