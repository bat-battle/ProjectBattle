<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.persistence.*"/>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 <style type="text/css">
<!--
 body {
	margin-left: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
 }
 .STYLE1 {font-size: 9pt}
  a:link {
	text-decoration: none;
  }
  a:visited {
	text-decoration: none;
  }
  a:hover {
	text-decoration: none;
  }
  a:active {
	 text-decoration: none;
  }
 .style2 {font-size: 9pt; color: #000000; }
 -->
</style>
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
            <td class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/isexists.gif" width="16" height="16"/>&nbsp;<b>����Ǽ�</b></td>
			 <td width="71" valign="middle">
          <p><a href="#" class="STYLE1" onClick="Javascript:window.open('waichu_add.jsp','','width=580,height=360');return false">�Ǽ�</a></p></td>
          </tr>
        </table></td>
        
      </tr>
      <tr>
        <td height="451" colspan="2" valign="top"><br><br>
			
		<table width="724" height="109" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
		  <td height="39" colspan="6" background="../Images/tiao.jpg"><table width="720" height="26" border="0">

<tr>
                <td width="87"><div align="center" class="STYLE1">����</div></td>
                <td width="110"><div align="center" class="STYLE1">��������</div></td>
                <td width="136"><div align="center" class="STYLE1">��ʼʱ��</div></td>
                <td width="121"><div align="center" class="STYLE1">��ֹʱ��</div></td>
                <td width="152"><div align="center" class="STYLE1">���ԭ��</div></td>
                <td width="88"><div align="center" class="STYLE1">�Ƿ�����</div></td>
                </tr>
            </table>
			</td>
          </tr>
        <%		
          int iCurrPage = 1 ;
          int pages = 1 ;
          int allRecCount = 0 ;
          int recPerPage = 5 ;
          allRecCount = HibernateUtil.findWaichuCount();         //��ѯ���ܵļ�¼��
          pages = (allRecCount - 1)/recPerPage + 1 ;             //������ܵ�ҳ��
          if(pages == 0){                                        //��ҳ��������Ч�Դ���,ʹҳ������Сֵ��1
         	pages = 1;
            }
          String currPage = request.getParameter("currPage");
          if(currPage != null && !currPage.equalsIgnoreCase("")){
         	iCurrPage = Integer.parseInt(currPage);
              }
          List listWaichu =HibernateUtil.finWaichu((iCurrPage - 1) * recPerPage, recPerPage);
			          if(listWaichu.isEmpty()){
			               out.println("������Ϣ");
			            }
			          if(!listWaichu.isEmpty() && listWaichu.size()>0){
			        	  for(int i= 0;i<listWaichu.size();i++){
			        		 Waichu waichu = (Waichu)listWaichu.get(i);
			        		 session.setAttribute("Waichu",waichu);
		%>
			<tr>
            <td width="93" height="31"><div align="center" class="STYLE1"><%=waichu.getName1()%></div></td>
            <td width="111" ><div align="center" class="STYLE1"><%=waichu.getDepartment()%></div></td>
            <td width="142"><div align="center" class="STYLE1"><%=waichu.getTime1()%></div></td>
            <td width="125"><div align="center" class="STYLE1"><%=waichu.getTime2()%></div></td>
            <td width="160" class="STYLE1">
            <div align="center" class="STYLE1">
            <a href="#" onClick="javascript:window.open('waichu_xianshi.jsp?ID=<%=waichu.getId()%>','','width=456,height=300');return false;" ><%=waichu.getContent()%></a>
        </div>
            </td>
            <td width="93"><div align="center" class="STYLE1">
		   <%if(waichu.getState()==1){%>  <!-- ���waichu�����state���Ե�ֵΪ��������ҳ������ʾ�������٣� -->
                ������
           <%}%>
          <%if (waichu.getState()==0){    
            if(waichu.getName1().equals(application.getAttribute("un"))){
            %>��������������������������       <!-- ���waichu�����state���Ե�ֵΪ������������name����ֵ�͵�ǰ�û�����ͬ������¿��Խ������� -->
          <a href="waichuCenter.jsp?currPage=<%=iCurrPage%>&&id=<%=waichu.getId()%>" onClick="return confirm('ȷ��������');return false;">����</a>
          <%}else{%>
              ����	
           <%}%>
	   </div></td>
          </tr>
	        <%}}}%>
	   <tr>
         
            <td height="39" colspan="6" background="../Images/tiao.jpg"><table width="719" border="0" cellpadding="0" cellspacing="0">
              <tr>
        <td>
        <div align="right" class="STYLE1">
            <% if(recPerPage < allRecCount){
               String href = "&nbsp;&nbsp;<a href='waichu.jsp?currPage=";
               StringBuffer sbf = new StringBuffer();           //������ҳ��
               if(iCurrPage > 1){
              	sbf.append(href+(iCurrPage - 1)+"'>��һҳ</a>"); //������һҳ
               }
               for(int i = 1 ; i <= pages ; i ++){
                 if(i == iCurrPage){
                		sbf.append(href+i+"'>["+i+"]</a>");     //׷�Ӵ�
                	}
              	else{
              		sbf.append(href+i+"'>"+i+"</a>");
              	}
              }
                if(iCurrPage < pages){
              	sbf.append(href+(iCurrPage + 1)+"'>��һҳ</a>"); //������һҳ
              }
                %>
               <%out.print("��ǰҳ��:["+iCurrPage+"/"+pages+"]");%>
               <%=sbf.toString()%>
              <%} %>
           </table>
          </td>
          </tr>
        </table>
		
		</td>
      </tr>
    </table></td>
  </tr>
  
</table>
</body>




