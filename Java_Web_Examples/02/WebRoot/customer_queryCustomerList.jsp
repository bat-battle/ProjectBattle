<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:directive.page import="java.util.List"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���������--�̶��ͻ�����</title>
</head>
<link href="css/style.css" type="text/css" rel="stylesheet">
<jsp:useBean id="pagination" class="com.tools.MyPagination" scope="session"/>
<%
String str=(String)request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=(List)request.getAttribute("list");
	int pagesize=10;      //ָ��ÿҳ��ʾ�ļ�¼��
	list=pagination.getInitPage(list,Page,pagesize);     //��ʼ����ҳ��Ϣ
}else{
	Page=pagination.getPage(str);
	list=pagination.getAppointPage(Page);     //��ȡָ��ҳ������
}
request.setAttribute("list1",list);
%>





<body>
<jsp:include page="main_top.jsp"/>



<table border="0" cellpadding="0" cellspacing="0">
  <tr>
  <td width="57">&nbsp;</td>
    <td width="637" valign="top" align="center">
	<table width="615"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="25" valign="top">��ǰλ�ã��̶��ͻ�����</td>
      </tr>
    </table>  
      <s:set name="customerList" value="#request.list1"/>      <s:if test="#customerList==null||#customerList.size()==0">
        <br>
             ����Ŀǰû�й̶��ͻ���Ϣ����  <br>	    <br>
      </s:if>      <s:else>      
         <table border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="E4ECEF">
          <tr align="center">
            <td width="100" height="20">�ͻ����</td>
            <td width="100">�ͻ�����</td>
            <td width="100">�ͻ��绰</td>
            <td width="100">�ͻ���ַ</td>
            <td width="100">����</td>
          </tr> <s:iterator status="customerListStatus" value="customerList">        
          <tr align="center" bgcolor="#FFFFFF">     
            <td height="20"><s:property value="customer_id"/></td>
            <td><s:property value="customer_user"/></td>
            <td><s:property value="customer_tel"/></td>
            <td><s:property value="customer_address"/></td>
            <td><s:a href="customer_deleteCustomer.action?customer_id=%{customer_id}">ɾ��</s:a></td>
          </tr>
		   </s:iterator>
      </table>   
      <table width="511" border="0" cellpadding="0" cellspacing="0">  
        <tr><td width="501">
       <div align="right"><%=pagination.printCtrl(Page)%></div>
       </td></tr>
      </table>
       </s:else>
	  

 	<table width="511" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td ><hr></td>
  </tr>
</table>
    
 <table width="519"  border="1" bordercolor="#FFFFFF" bgcolor="E4ECEF">
 <s:form action="customer_insertCustomer">	
        <tr>
          <td width="74" height="20">�ͻ�������</td>
          <td width="160" bgcolor="#FFFFFF"><s:textfield name="customer_user"/></td>
          <td width="72">�ͻ��绰��</td>
          <td width="165" bgcolor="#FFFFFF"><s:textfield name="customer_tel"/></td>
        </tr>
        <tr>
          <td height="20">�ͻ���ַ��</td>
          <td colspan="2" bgcolor="#FFFFFF"><s:textfield name="customer_address"/></td>
          <td bgcolor="#FFFFFF" align="center"><s:submit value="���"/>&nbsp;&nbsp;<s:reset value="����"/></td>
        </tr>
</s:form>
 </table><br><br>
		
		
		
        

    </td>
    <td width="115" valign="top">
	
	<jsp:include page="main_right.jsp"/>
	
	</td>
  </tr>
</table>


<jsp:include page="main_down.jsp"/>
</body>
</html>
