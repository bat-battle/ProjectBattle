<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:directive.page import="java.util.List"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���������������Դ��Ϣ����</title>
</head>
<link href="css/style.css" type="text/css" rel="stylesheet">


<jsp:useBean id="pagination" class="com.tools.MyPagination" scope="session"></jsp:useBean>
<%
String str=(String)request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=(List)request.getAttribute("list");
	int pagesize=4;      //ָ��ÿҳ��ʾ�ļ�¼��
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
        <td height="25" valign="top">��ǰλ�ã���Դ��Ϣ����</td>
      </tr>
    </table>  
      <s:set name="carList" value="#request.list1"/>     
        <s:if test="#carList==null||#carList.size()==0">
        <br>
               ����Ŀǰû�г�����Ϣ����
			   
			<table width="630" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="442" height="21" valign="top">&nbsp;&nbsp;&nbsp;<img src="images/sign.gif" width="16" height="14">&nbsp;<a href="car_insertCar.jsp" class="a2">��ӳ�����Ϣ</a></td>
          <td width="188" valign="top">&nbsp;&nbsp;&nbsp;</td>
        </tr>
      </table>   
			   
			   
        </s:if>  
        <s:else>     <s:iterator status="carListStatus" value="carList">        
      <table width="603" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="E4ECEF">
        <tr align="center">
          <td width="82" height="20">���</td>
          <td width="82">����</td>
          <td width="105">���ƺ�</td>
          <td width="139">��ַ</td>
          <td width="78">�绰</td>
          <td width="119">���֤��</td>
        </tr>
        <tr align="center" bgcolor="#FFFFFF">
     
          <td height="20"><s:property value="id"/></td>
          <td><s:property value="username"/></td>
          <td><s:property value="car_number"/></td>
          <td><s:property value="address"/></td>
          <td><s:property value="tel"/></td>
          <td><s:property value="user_number"/></td>
        </tr>
        <tr align="center">
          <td height="20" colspan="2">����·��</td>
          <td colspan="2">��������</td>
          <td colspan="2">����</td>
        </tr>
        <tr align="center" bgcolor="#FFFFFF">
          <td height="20" colspan="2"><s:property value="car_road"/></td>
          <td colspan="2"><s:property value="car_content"/></td>
          <td colspan="2"><s:a href="car_queryCarForm.action?id=%{id}">�޸�</s:a>&nbsp;&nbsp;&nbsp;<s:a href="car_deleteCar.action?id=%{id}">ɾ��</s:a></td>
        </tr>
    </table>
	
	<table width="603" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td ><hr></td>
  </tr>
</table>
	 </s:iterator>
	 
	 
	 
	 
	 
	
  

      <table width="630" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="442" height="21" valign="top">&nbsp;&nbsp;&nbsp;<img src="images/sign.gif" width="16" height="14">&nbsp;<a href="car_insertCar.jsp" class="a2">��ӳ�Դ��Ϣ</a></td>
          <td width="188" valign="top"><%=pagination.printCtrl(Page) %></td>
        </tr>
      </table>
    </s:else> 

   </td>
    <td width="115" valign="top">
	
	<jsp:include page="main_right.jsp"/>
	
	</td>
  </tr>
</table>
<jsp:include page="main_down.jsp" flush="true"/>
</body>
</html>
