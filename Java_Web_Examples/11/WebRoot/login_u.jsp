<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%String username=(String)session.getAttribute("username");
if (username==null || username==""){%>
<script src="JS/check.js"></script>
<table width="788" height="34" border="0" align="center" cellpadding="0" cellspacing="0">
<form name="form1" method="post" action="login_U_deal.jsp">
  <tr>
    <td width="68" align="right" bgcolor="#DCE6F2"><img src="images/login_ico.GIF" width="24" height="18" />&nbsp;&nbsp;</td>
    <td width="720" bgcolor="#DCE6F2" class="word_darkBlue">��Ա����
      <input name="username" type="text" class="txt_grey" id="username" size="16" />
    &nbsp;��&nbsp;&nbsp;�룺
    <input name="PWD" type="password" class="txt_grey" id="PWD" size="16" onkeydown="if(event.keyCode==13) form1.submit();" />
    &nbsp;
    <input name="Submit2" type="button" value="��¼" onclick="checkU(form1)" class="btn_bg_login" />
    <input name="Submit3" type="reset" value="����" class="btn_bg_login" />
    &nbsp;<a href="register.jsp" class="word_orange">ע��</a></td>
  </tr>
</form>  
</table>

 <%}else{%>
<table width="788" height="34" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="68" align="right" bgcolor="#DCE6F2"><img src="images/login_ico.GIF" width="24" height="18" />&nbsp;&nbsp;</td>
    <td width="720" bgcolor="#DCE6F2" class="word_darkBlue">[<%=username%>]���ã���ӭ����MR���繺�����ģ����ڿ��Թ����ˣ�ϣ�����ڱ��������Ĺ����죡
    
    &nbsp;
    <input name="Submit2" type="button" value="�޸�����" onClick="window.location.href='modifyMember.jsp';" class="btn_bg_long" />
    <input name="Submit3" type="button" value="�˳���¼" class="btn_bg_long" onClick="window.location.href='logout.jsp';"/></td>
  </tr>
</table>
<%}%>
