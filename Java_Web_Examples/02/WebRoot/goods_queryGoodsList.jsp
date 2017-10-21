<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.form.GoodsForm"%>
<%@page import="com.form.CarForm"%>
<%@page import="com.form.CustomerForm"%>
<%@page import="com.form.LogForm"%>
<%@page import="java.util.List"%>

<link href="css/style.css" type="text/css" rel="stylesheet">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���������������������ѯ</title>
</head>
<script language="javascript" type="text/javascript">
function checkEmpty(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
alert(form.elements[i].title);
return false;
}
}
}
</script>

<jsp:useBean id="carDao" class="com.dao.CarDao" scope="page"/>
<jsp:useBean id="customerDao" class="com.dao.CustomerDao" scope="page"/>
<jsp:useBean id="goodsAndLogDao" class="com.dao.GoodsAndLogDao" scope="page"/>
<jsp:useBean id="pagination" class="com.tools.MyPagination" scope="session"/>	

<body>
<jsp:include page="main_top.jsp"/>


<table border="0" cellpadding="0" cellspacing="0">
  <tr>
  <td width="57">&nbsp;</td>
    <td width="637" valign="top" align="center">
	<table width="615"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="25" valign="top">��ǰλ�ã���ҳ  >>  ��������ѯ</td>
      </tr>
    </table>  
<%
String str=(String)request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=(List)request.getAttribute("list");
	System.out.println("ssssss "+list.size());
	int pagesize=2;      //ָ��ÿҳ��ʾ�ļ�¼��
	list=pagination.getInitPage(list,Page,pagesize);     //��ʼ����ҳ��Ϣ
}else{
	Page=pagination.getPage(str);
	list=pagination.getAppointPage(Page);     //��ȡָ��ҳ������
}




for(int i=0;i<list.size();i++){
GoodsForm goodsForm=(GoodsForm)list.get(i);

CarForm carForm=carDao.queryCarForm(goodsForm.getCar_id());	

CustomerForm customerForm=customerDao.queryCustomerForm(Integer.valueOf(goodsForm.customer_id));

LogForm logForm=goodsAndLogDao.queryCarLogForm(Integer.valueOf(goodsForm.getCar_id()));	

%>

<%if(carForm==null){out.print("�ó����Ѿ�������Աɾ��<br>");}else{ %>

    <table border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="E4ECEF">
      <tr>
        <td width="120" height="20"><div align="center">��������</div></td>
        <td width="120"><div align="center">���ƺ���</div></td>
        <td width="120"><div align="center">������ַ</div></td>
        <td width="120"><div align="center">�����绰</div></td>
        <td width="120"><div align="center">����·��</div></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td height="20"><div align="center"><%=carForm.getUsername()%></div></td>
        <td><div align="center"><%=carForm.getCar_number()%></div></td>
        <td><div align="center"><%=carForm.getAddress()%></div></td>
        <td><div align="center"><%=carForm.getTel()%></div></td>
        <td><div align="center"><%=carForm.getCar_road()%></div></td>
      </tr>
    </table>
<%} %>

<%if(customerForm==null){out.print("�ÿͻ��Ѿ�������Աɾ��<br>");}else{ %>

    <table border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="E4ECEF">
      <tr>
        <td width="200" height="20">       <div align="center">����������</div></td>
        <td width="200"><div align="center">�����˵绰</div></td>
        <td width="200">       <div align="center">�����˵�ַ</div></td>
        </tr>
      <tr bgcolor="#FFFFFF">
        <td height="20"><div align="center"><%=customerForm.getCustomer_user()%></div></td>
        <td><div align="center"><%=customerForm.getCustomer_tel()%></div></td>
        <td><div align="center"><%=customerForm.getCustomer_address()%></div></td>
        </tr>
    </table>   
<%} %>
	  <table border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="E4ECEF">
      <tr>
        <td width="150"><div align="center">�������</div></td>
        <td width="150" height="20"><div align="center">�ջ�������</div></td>
        <td width="150"><div align="center">�ջ��˵绰</div></td>
        <td width="150"><div align="center">�ջ��˵�ַ</div></td>
        </tr>
      <tr bgcolor="#FFFFFF">
       <td><div align="center"><%=goodsForm.getGoods_id()%></div></td>
        <td height="20"><div align="center"><%=goodsForm.getGoods_name()%></div></td>
        <td><div align="center"><%=goodsForm.getGoods_tel()%></div></td>
        <td><div align="center"><%=goodsForm.getGoods_address()%></div></td>
        </tr>
    </table>   
	<%
	if(goodsForm.getGoods_sure().equals("0")){
	%>
	<table width="255" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="E4ECEF">   
      <tr bgcolor="#FFFFFF">  
        <td height="20"><div align="center">�Ѿ�ȷ�����</div></td>
        <td><div align="center"><a href="goods_deleteGoods.action?id=<%=goodsForm.getId()%>">ɾ��������</a></div></td>
       </tr>
    </table>  
	 <%}else{ %>
	 <table border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="E4ECEF">
      <tr>
        <td width="200" height="20">       <div align="center">����ʱ��</div></td>
        <td width="200"><div align="center">�ջ�ʱ��</div></td>
        <td width="200">       <div align="center">��������</div></td>
        </tr>
      <tr bgcolor="#FFFFFF">
        <td height="20"><div align="center"><%=logForm.getStartTime()%></div></td>
        <td><div align="center"><%=logForm.getEndTime()%></div></td>
        <td><div align="center"><%=logForm.getDescribe()%></div></td>
        </tr>
    </table>
	 
	 <%} %>
	 <hr>
    <%}%>
	<%=pagination.printCtrl(Page)%>
    </td>
    <td width="115" valign="top">
	
	<jsp:include page="main_right.jsp"/>
	
	</td>
  </tr>
</table>
<jsp:include page="main_down.jsp"/>
</body>
</html>
