<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.form.LogForm"%>
<link href="css/style.css" type="text/css" rel="stylesheet">
<jsp:directive.page import="java.util.List"/>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���������������Դ��Ϣ��ѯ</title>
</head>
<jsp:useBean id="goodsAndLogDao" scope="page" class="com.dao.GoodsAndLogDao"/>
<jsp:useBean id="pagination" class="com.tools.MyPagination" scope="session"/>
<%
String str=(String)request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=(List)request.getAttribute("list");
	int pagesize=5;      //ָ��ÿҳ��ʾ�ļ�¼��
	list=pagination.getInitPage(list,Page,pagesize);     //��ʼ����ҳ��Ϣ
}else{
	Page=pagination.getPage(str);
	list=pagination.getAppointPage(Page);     //��ȡָ��ҳ������
}
request.setAttribute("list1",list);
%>


<s:set name="list" value="#request.list1"/>
<body>
<jsp:include page="main_top.jsp"/>


<table border="0" cellpadding="0" cellspacing="0">
  <tr>
  <td width="57">&nbsp;</td>
    <td width="637" valign="top" align="center">
	<table width="615"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="25" valign="top">��ǰλ�ã���ҳ  >>  ��Դ��Ϣ��ѯ</td>
      </tr>
    </table>  
     
              

    <table border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="E4ECEF">
      <tr align="center">
        <td width="61" height="30">���ƺ���</td>
        <td width="131">·��</td>
        <td width="148">��������</td>
        <td width="127">ʹ����־</td>
        <td width="79">�Ƿ�ʹ��</td>
      </tr>
      <s:iterator value="list" status="carList" id="car"> 
        <s:set name="car_id" value="%{#car.id}" scope="request"/>   
        <s:set name="car_number" value="%{#car.car_number}" scope="request"/>  
      <tr bgcolor="#FFFFFF" align="center">
        <td height="40"><s:property value="car_number"/></td>
        <td><s:property value="car_road"/></td>
        <td><s:property value="car_content"/></td>
        <td>
        <%
         Integer car=  (Integer)request.getAttribute("car_id");      
          LogForm logForm=goodsAndLogDao.queryCarLogForm(car);
        System.out.println("ddddddddd "+(logForm==null));
        if(logForm!=null){  
    	  out.print("����ʱ�䣺"+logForm.getStartTime()+"<br>");
       out.print("�ջ�ʱ�䣺"+logForm.getEndTime()+"<br>");
      	 }else{
         out.print("&nbsp;");	 
       }
      	 %>
        </td>
        <td>
        <%
       String information="�Ѿ�ʹ��";
    
       if(logForm==null){    	
     information="<a href='goods_insertGoods.jsp?car_id="+car+"&car_number="+request.getAttribute("car_number")+"'>δ��ʹ��</a>";
      }
       out.print(information);
	  
        %>
        </td>
      </tr>
      </s:iterator>
    </table>
	
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
