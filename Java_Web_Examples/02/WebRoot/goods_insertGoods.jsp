<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.form.CarForm"%>
<link href="css/style.css" type="text/css" rel="stylesheet">
<jsp:useBean id="currentTime" class="com.tools.CurrentTime" scope="page"/>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="carDao" class="com.dao.CarDao" scope="page"/>
<jsp:useBean id="customerDao" class="com.dao.CustomerDao" scope="page"/>
<title>�������������������</title>
</head>
<script language="javascript" type="text/javascript">
function CheckDate(INDate)
{ if (INDate=="")
    {return true;}
	subYY=INDate.substr(0,4)
	if(isNaN(subYY) || subYY<=0){
		return true;
	}
	//ת���·�
	if(INDate.indexOf('-',0)!=-1){	separate="-"}
	else{
		if(INDate.indexOf('/',0)!=-1){separate="/"}
		else {return true;}
		}
		area=INDate.indexOf(separate,0)
		subMM=INDate.substr(area+1,INDate.indexOf(separate,area+1)-(area+1))
		if(isNaN(subMM) || subMM<=0){
		return true;
	}
		if(subMM.length<2){subMM="0"+subMM}
	//ת����
	area=INDate.lastIndexOf(separate)
	subDD=INDate.substr(area+1,INDate.length-area-1)
	if(isNaN(subDD) || subDD<=0){
		return true;
	}
	if(eval(subDD)<10){subDD="0"+eval(subDD)}
	NewDate=subYY+"-"+subMM+"-"+subDD
	if(NewDate.length!=10){return true;}
    if(NewDate.substr(4,1)!="-"){return true;}
    if(NewDate.substr(7,1)!="-"){return true;}
	var MM=NewDate.substr(5,2);
	var DD=NewDate.substr(8,2);
	if((subYY%4==0 && subYY%100!=0)||subYY%400==0){ //�ж��Ƿ�Ϊ����
		if(parseInt(MM)==2){
			if(DD>29){return true;}
		}
	}else{
		if(parseInt(MM)==2){
			if(DD>28){return true;}
		}	
	}
	var mm=new Array(1,3,5,7,8,10,12); //�ж�ÿ���е��������
	for(i=0;i< mm.length;i++){
		if (parseInt(MM) == mm[i]){
			if(parseInt(DD)>31){
				return true;
			}else{
				return false;
			}
		}
	}
   if(parseInt(DD)>30){return true;}
   if(parseInt(MM)>12){return true;}
   return false;
   }

function checkEmpty(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
alert(form.elements[i].title);
return false;
}
}
if(CheckDate(goods.startTime.value)){	
alert("����ķ���ʱ�䲻�Ϸ�������-��-�գ�");		
return false;
}
if(CheckDate(goods.endTime.value)){	
alert("������ջ�ʱ�䲻�Ϸ�������-��-�գ�");		
return false;
}
}
</script>

<%

request.setCharacterEncoding("gb2312");

String car_number=null;
if(request.getParameter("car_number")!=null){
	car_number=request.getParameter("car_number");	
	car_number=new String(car_number.getBytes("ISO8859_1"), "gb2312");
}
if(request.getParameter("car_id")!=null){
	request.setAttribute("car_id",request.getParameter("car_id"));
}




request.setAttribute("carList",carDao.queryCarList("1"));
request.setAttribute("customerList",customerDao.queryCustomerList());
request.setAttribute("autoNumber",currentTime.autoNumber());
%>

<body>
<jsp:include page="main_top.jsp"/>
<table border="0" cellpadding="0" cellspacing="0">
  <tr>
  <td width="57">&nbsp;</td>
    <td width="637" valign="top" align="center">
	<table width="615"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="25" valign="top">��ǰλ�ã�������</td>
      </tr>
    </table>  
<s:form action="goods_insertGoods" name="goods" onsubmit="return checkEmpty(goods)">     
    <table width="568" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="E4ECEF">
      <tr>
        <td width="98" height="40">
       <%if(car_number==null) {%>  
        ����ѡ��
               <%}else{ %>
        ���ƺ��룺        
        <%} %>   
        </td>
        <td width="166" bgcolor="#FFFFFF">
        <%if(car_number==null) {%>
        <s:select name="car_id" list="#request.carList" listKey="id" listValue="car_number"/>
        <%}else{ out.print(car_number);	 %>
        
         <s:hidden value="%{#request.car_id}" name="car_id"></s:hidden>
        <%}%>
        
       
        
        </td>
        <td width="92">�����ͻ���</td>
        <td width="189" bgcolor="#FFFFFF"><s:select name="customer_id" list="#request.customerList" listKey="customer_id" listValue="customer_user"/></td>
      </tr>
      <tr>
        <td height="40">�������ţ�</td>
        <td bgcolor="#FFFFFF"><s:textfield name="goods_id" title="�����뷢������" value="%{#request.autoNumber}" readonly="true" onclick="alert('���ı�������Ϊֻ�����û����Ʋ����޸ģ���')"/></td>
        <td>�ջ���������</td>
        <td bgcolor="#FFFFFF"><s:textfield name="goods_name" title="�������ջ�������"/></td>
      </tr>
      <tr>
        <td height="40">�ջ��˵绰��</td>
        <td bgcolor="#FFFFFF"><s:textfield name="goods_tel" title="�������ջ��˵绰"/></td>
        <td>�ջ��˵�ַ��</td>
        <td bgcolor="#FFFFFF"><s:textfield name="goods_address" title="�������ջ��˵�ַ"/></td>
      </tr>
      <tr>
        <td height="40">����ʱ�䣺</td>
        <td bgcolor="#FFFFFF"><s:textfield name="startTime" title="�����뷢��ʱ��"/></td>
        <td>�ջ�ʱ�䣺</td>
        <td bgcolor="#FFFFFF"><s:textfield name="endTime" title="�������ջ�ʱ��"/></td>
      </tr>
      <tr>
        <td height="102">����������Ϣ��</td>
        <td colspan="3" bgcolor="#FFFFFF"><s:textarea name="describer" cssClass="textarea" rows="8" cols="63" title="�����뷢��������Ϣ"/></td>
        </tr>
		
		 <tr bgcolor="#FFFFFF">
        <td height="55" colspan="4" align="center"><s:submit value="����"/>&nbsp;&nbsp;&nbsp;<s:reset value="����"/>
		
		
		<s:property value="#request.goodsSuccess" escape="false"/>
		
		</td>
        </tr>		
    </table>
	</s:form>

	
	
	</td>
    <td width="115" valign="top">
	
	<jsp:include page="main_right.jsp"/>
	
	</td>
  </tr>
</table>


























<jsp:include page="main_down.jsp"/>
</body>
</html>
