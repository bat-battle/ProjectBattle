<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="com.actionForm.UserForm" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator"%>
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
          <td width="70%" valign="bottom">��ǰλ�ã�ϵͳ���� &gt; �û����� &gt;&gt;&gt;</td>
        </tr>
      </table>
<table width="100%" height="385" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td width="5" valign="top" background="images/left.gif">&nbsp;</td>
        <td align="center" valign="top">&nbsp;
        <table width="96%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="right"><a href="userAdd.jsp">����û�</a></td>
          </tr>
        </table>
<%
List list=(List)request.getAttribute("userList");
		if(list.size()<=0){%>
        <table width="96%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td  height="40" align="center" >�����û���Ϣ!</td>
          </tr>
		  </table>
		<%}else{%>
        <table width="96%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#DDDDDA">
          <tr>
            <td align="center" bgcolor="#D7F6FB">�û�����</td>
            <td width="10%" align="center" bgcolor="#D7F6FB">������</td>
            <td width="10%" align="center" bgcolor="#D7F6FB">�������</td>
            <td width="10%" align="center" bgcolor="#D7F6FB">���ʴ���</td>
            <td width="10%" align="center" bgcolor="#D7F6FB">��ѯͳ��</td>
            <td width="10%" align="center" bgcolor="#D7F6FB">������Ϣ</td>
            <td width="10%" align="center" bgcolor="#D7F6FB">ϵͳ����</td>
            <td width="6%" align="center" bgcolor="#D7F6FB">�޸�</td>
            <td width="6%" align="center" bgcolor="#D7F6FB">ɾ��</td>
          </tr>
        <%
Iterator it=list.iterator();
int id=-1;
String name="";
Byte setInstorage=new Byte("0");
Byte setOutstorage=new Byte("0");
Byte setDeal=new Byte("0");
Byte setQuery=new Byte("0");
Byte setBasic=new Byte("0");
Byte setSys=new Byte("0");
while(it.hasNext()){
	UserForm userForm=(UserForm)it.next();
        id=userForm.getId();
        name=userForm.getName();
        setInstorage=userForm.getSetInstorage();
        setOutstorage=userForm.getSetOutstorage();
        setDeal=userForm.getSetDeal();
        setQuery=userForm.getSetQuery();
        setBasic=userForm.getSetBasic();
        setSys=userForm.getSetSys();
        if(!name.equals("mr")){
%>
          <tr>
            <td>&nbsp;<%=name %></td>
            <td align="center">&nbsp;
              <input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled="disabled" <%if(setInstorage.equals(new Byte("1"))){out.println("checked");}%>></td>
            <td align="center">&nbsp;
              <input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled="disabled" <%if(setOutstorage.equals(new Byte("1"))){out.println("checked");}%>></td>
            <td align="center">&nbsp;
              <input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled="disabled" <%if(setDeal.equals(new Byte("1"))){out.println("checked");}%>></td>
            <td align="center">&nbsp;
              <input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled="disabled" <%if(setQuery.equals(new Byte("1"))){out.println("checked");}%>></td>
            <td align="center">&nbsp;
              <input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled="disabled" <%if(setBasic.equals(new Byte("1"))){out.println("checked");}%>></td>
            <td align="center">&nbsp;
              <input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled="disabled" <%if(setSys.equals(new Byte("1"))){out.println("checked");}%>></td>
            <td>&nbsp;<a href="user.do?action=userMQuery&id=<%=id%>">�޸�</a></td>
            <td align="center">
            <a href="user.do?action=userdel&id=<%=id%>&val=1">ɾ��</a>            </td>
          </tr>
		  <%}
}%>
        </table>
		<%}%>
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
