<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<%@page import="com.hiernate.persistence.*"%>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<head>
	<html:base />
	<title>���°�Ǽ�</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body background="../Images/main_center.jpg">
  <table width="801" height="505" border="0" cellpadding="0" cellspacing="0" background="../Images/main_center.jpg">
  <tr>
    <td width="801" height="100%" valign="top"> 
		<table width="100%" height="514" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="100%" height="40" valign="bottom" background="../Images/main_top.JPG"><table width="100%" height="100%" border="0">
          <tr>
            <td class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/isexists.gif" width="16" height="16"/>&nbsp;<b>���°�Ǽ�</b></td>
			 <td width="71" valign="middle">
          <p><a href="#" class="STYLE1" onClick="Javascript:window.open('onduty_add.jsp','','width=580,height=350');return false">�Ǽ�</a></p></td>
          </tr>
        
	 </table>
      <tr>
        <td height="451" colspan="2" valign="top"><br><br>
		  <% String currPage = request.getParameter("currPage");
             int iCurrPage = 1 ;
             int pages = 1 ;
             int allRecCount = 0 ;
             int recPerPage = 5 ;
             allRecCount = HibernateUtil.findOndutyCount();          //��ѯ�����°��¼��������
             pages = (allRecCount - 1)/recPerPage + 1 ;              //������ܵ�ҳ��
             if(pages == 0){                                         //��ҳ��������Ч�Դ���,ʹҳ������Сֵ��1
           	       pages = 1;
               }
             if(currPage != null && !currPage.equalsIgnoreCase("")){
             	iCurrPage = Integer.parseInt(currPage);
              }
             List listOnduty =HibernateUtil.findOnduty((iCurrPage - 1) * recPerPage, recPerPage);
			          if(listOnduty.isEmpty()){
			               out.println("������Ϣ");
			            }
			  %>
		<table width="724" height="109" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
		  <td height="39" colspan="7" background="../Images/tiao.jpg"><table width="720" height="26" border="0">

<tr>

                <td width="67"><div align="center" class="STYLE7">�Ǽ�����</div></td>
                <td width="68"><div align="center" class="STYLE7">��������</div></td>
                <td width="92"><div align="center" class="STYLE7">�Ǽ�����</div></td>
                <td width="151"><div align="center" class="STYLE7">�涨ʱ��</div></td>
                <td width="122"><div align="center" class="STYLE7">�Ǽ�ʱ��</div></td>
                <td width="125"><div align="center" class="STYLE7">�ǼǱ�ע</div></td>
                <td width="65"><div align="center" class="STYLE7">�Ǽ��ܽ�</div></td>
                </tr>
            </table>	
      <% 
      if(!listOnduty.isEmpty()&& listOnduty.size()>0){        
	        for(int i=0;i<listOnduty.size();i++){
	           Onduty onduty =(Onduty) listOnduty.get(i);
	    %>
          </td>
     </tr>
		<tr>
            <td width="71" height="31" class="STYLE7"><div align="center" class="STYLE7"><%=onduty.getName1()%></div></td>
            <td width="69" class="STYLE7"><div align="center" class="STYLE7"><%=onduty.getDepartment()%></div></td>
            <td width="97"><div align="center" class="STYLE7"><%=onduty.getEnroltype()%></div></td>
            <td width="156" class="STYLE7"><div align="center" class="STYLE7"><%=onduty.getDefinetime()%></div></td>
            <td width="129"><div align="center" class="STYLE7"><%=onduty.getEnroltime()%>&nbsp;</div></td>
            <td width="129" class="STYLE7"><div align="center" class="STYLE7">
			<a href="#" onClick="Javascript:window.open('onduty_xianshi.jsp?ID=<%=onduty.getId()%>','','width=456,height=300')"></a>
            <a href="#" onClick="Javascript:window.open('onduty_xianshi.jsp?ID=<%=onduty.getId()%>','','width=456,height=310');return false"><%=onduty.getEnrolremark()%></a>
                                         <!-- ��onduty�����id����Ϊ��������������ӵ���ʾ�ı�Ϊonduty����ĵǼǱ�ע���� -->
            </div></td>
            <td width="73" class="STYLE7"><div align="center"><%=onduty.getState()%></div></td>
          </tr>
	 <%}}%>
          <tr>
            <td height="39" colspan="7" background="../Images/tiao.jpg"><table width="719" border="0" cellpadding="0" cellspacing="0">
            
              <tr>
                <td><div align="right" class="STYLE7">
                <%
                if(recPerPage < allRecCount){
                String href = "&nbsp;&nbsp;<a href='onduty_index.jsp?currPage=";
                StringBuffer sbf = new StringBuffer();              //������ҳ��
                if(iCurrPage > 1){                                  //������һҳ
              	sbf.append(href+(iCurrPage - 1)+"'>��һҳ</a>");
                 }
               for(int i = 1 ; i <= pages ; i ++){
            	  if(i == iCurrPage){
                		sbf.append(href+i+"'>["+i+"]</a>");         //׷�Ӵ�
                	}
               	else{
              		sbf.append(href+i+"'>"+i+"</a>");
              	}
              }
              if(iCurrPage < pages){                               //������һҳ
              	sbf.append(href+(iCurrPage + 1)+"'>��һҳ</a>");
              }
                %>
               <%out.print("��ǰҳ��:["+iCurrPage+"/"+pages+"]");%>
               <%=sbf.toString()%>
               <%} %>
                </div>
               </td>
              </tr>
          </table>
      </body>




