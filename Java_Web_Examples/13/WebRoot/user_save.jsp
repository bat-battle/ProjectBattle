<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���ᡪ���û�ע��</title>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="js/js.js" type="text/javascript"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>



<body>
<jsp:include page="top.jsp"/>


<table width="753" height="46" border="0" align="center" cellpadding="0" cellspacing="0" background="images/10.jpg">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="753" height="56" border="0" align="center" cellpadding="0" cellspacing="0" background="images/11.jpg">
  <tr>
    <td valign="top"><table width="287" height="33" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <th width="287" height="33" align="center" valign="bottom">���û�ע��</th>
      </tr>
    </table></td>
  </tr>
</table>
<table width="753" height="494" border="0" align="center" cellpadding="0" cellspacing="0" background="images/12.jpg">
  <tr>
    <td height="393" align="center" valign="top">

<br><br>
	<form action="userInfoServlet?info=saveUser" method="post" name="form" onSubmit="return checkUser(form)">
	  <table width="439" border="0" align="center">
      <tr>
        <td width="92" height="30">�û�����</td>
        <td width="337"><input name="username" type="text" maxlength="20" title="�������û�����" class="input2"></td>
      </tr>
      <tr>
        <td height="30">���룺</td>
        <td><input name="password" type="password" maxlength="20" title="���������룡" class="input2" ></td>
      </tr>
      <tr>
        <td height="30">ȷ�����룺</td>
        <td><input name="repassword" type="password" maxlength="20" title="������ȷ�����룡" class="input2"></td>
      </tr>
      <tr>
        <td height="30">��ʵ������</td>
        <td><input name="realname" type="text" maxlength="20" title="�������û���ʵ������" class="input2"></td>
      </tr>
      <tr>
        <td height="30">Email��ַ��</td>
        <td><input name="email" type="text" maxlength="20" title="������Email��ַ��" class="input2"></td>
      </tr>
      <tr>
        <td height="30">���⣺</td>
        <td>
          <select name="question" class="input2">
              <option value="���ĸ��׽�ʲô����">���ĸ��׽�ʲô����</option>
              <option value="����ĸ�׽�ʲô����">����ĸ�׽�ʲô����</option>
              <option value="����ʲô�ط�����">����ʲô�ط�����</option>
              <option value="���������Ƕ��ٺ�">���������Ƕ��ٺ�</option>
          </select>
        </td>
      </tr>
      <tr>
        <td height="30">�𰸣�</td>
        <td><input name="result" type="text" maxlength="20" title="����������𰸣�" class="input2"></td>
      </tr>
      <tr>
        <td height="30">У���룺</td>
        <td><input name="code" type="text" maxlength="20" title="������У����" class="input2"></td>
      </tr>
      <tr>
        <td height="30">&nbsp;</td>
        <td><a href="#" onClick="reload()"><img border=0 src="image.jsp" name="checkCode"></a></td>
      </tr>
	   <tr>
        <td height="50">&nbsp;</td>
        <td>               
            <input name="Submit" type="image" class="cannelBorder"  src="images/21.gif">
        &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:form.reset();"><img src="images/22.gif"></a>
        </td>
      </tr>	
    </table>
	</form>
	<br><br><br>
	<c:if test="${requestScope.information!=null}">
     ${requestScope.information}<br><br>
     <a href="userInfoServlet?info=userLand&username=${requestScope.username}">���Ҫֱ�ӵ�¼���뵥��������</a>
   </c:if>

	
	
	</td>
  </tr>
</table>

<jsp:include page="down.jsp" flush="true" />

</body>
</html>
