<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.persistence.Meeting"/>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<head>
	<html:base />
	<title>�����¼��ʾҳ��</title>
    <style type="text/css">
<!--
@import url("../../CSS/style.css");
-->
    </style>
    
</head>
<body background="../../Images/main_center.jpg">
 <table width="801" border="0" cellpadding="0" cellspacing="0" background="../../Images/main_center.jpg">
  <tr>
    <td height="488" valign="top"><table width="100%" height="84%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top"><table width="100%" height="119" border="0" cellpadding="-2" cellspacing="-2" background="../images/bbs/bbs_01.gif">
          <tr valign="top">
            <td width="100%" height="43" background="../../Images/main_top.JPG"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
			   <tr>
            <td width="5%"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/isexists.gif" width="16" height="16"></td>
           <td width="23%" align="left"><br>&nbsp;<b>�������</b></td>
          <td width="72%" valign="bottom">&nbsp;</td>
      </tr>
            </table></td>
          </tr>
          <tr valign="top">
            <td>&nbsp;</td>
          </tr>
        </table>
          <table width="100%" border="0" cellpadding="-2" cellspacing="-2" background="../../Images/main_center.jpg">
            <tr>
              <td width="817" valign="top">
              <table width="557" height="54"  border="0" cellpadding="-2" cellspacing="-2" background="../Images/meeting/meeting_02.gif">
              
                  <tr>
                    <td width="7%" height="33" align="center" valign="middle">&nbsp;</td>
                    <td width="23%" align="center">&nbsp;</td>
                    <td width="5%" height="33"><div align="center" class="style10">
                    <img src="../../Images/add.gif" width="20" height="18"></div></td>
                    <td width="47%" height="33"><div align="left" class="STYLE11">
                    <%
                      String strpurview = (String)application.getAttribute("Purview");
                       if(strpurview.equalsIgnoreCase("ֻ��")){                            
                     	 %>
                     	<a href="noaddmeeting.jsp">¼�������Ϣ</a>
                       <%}else{ %>
                    <a href="#" onClick="Javascript:window.open('meeting_add.jsp','','width=545,height=350');return false">¼�������Ϣ</a></td>
                    <%} %>
                    <td width="18%" height="33"><div align="center"></div></td>
                  </tr>
                  <tr>
                    <td height="21" colspan="6">&nbsp;</td>
                  </tr>
                </table>
              
                 <table align="center">
                    <tr>
                    </tr>
                </table>
               <table width="75%" height="27"  border="1" align="center" cellpadding="-2" cellspacing="-2">
                 <!-- ���ñ����ʽ -->
                    <tr>
                      <td width="55%"><div align="center" >��������</div></td><!-- ���ñ�ͷ���� -->
                      <td width="13%"><div align="center" >������</div></td>
                      <td width="25%"><div align="center" >����ʱ��</div>
                          <div align="center" class="style3"></div></td>
                      <td width="7%"><div align="center" >ɾ��</div></td>
                    </tr>
                    <%  
                   String currPage = request.getParameter("currPage"); //��õ�ǰҳ��
                   int iCurrPage = 1 ;                                 //����Ŀǰ��ҳ����ע���ʼֵ����Ϊ��0��
                   int pages = 1 ;                                     //������ҳ����
                   int allRecCount = 0 ;                               //��������ܵļ�¼��
                   int recPerPage = 5 ;                                //����ÿҳ��ʾ�ļ�¼��
                   allRecCount = HibernateUtil.findMeetingCount();     //���ù������з�������ѯ���ܵļ�¼��
                   pages = (allRecCount - 1)/recPerPage + 1 ;          //������ܵ�ҳ��
                   if(pages == 0){                                     //��ҳ��������Ч�Դ���,ʹҳ������Сֵ��1
                	pages = 1;
                   }
                  if(currPage != null && !currPage.equalsIgnoreCase("")){ //�ж�currpage�Ƿ�Ϊ��
                  	iCurrPage = Integer.parseInt(currPage);               //��currpage��ֵ��iCurrpage
                  }
                  List listMeeting =HibernateUtil.finMeeting((iCurrPage - 1) * recPerPage, recPerPage);  //���÷�ҳ����
                   if(listMeeting.isEmpty()){
			               out.println("������Ϣ");                         //�����ѯ���Ϊ��ʱ��ҳ�����"������Ϣ"
			            }
                   if(!listMeeting.isEmpty() && listMeeting.size()>0){
           			        	  for(int i= 0;i<listMeeting.size();i++){ //����ѭ�����Ѳ��ҵ����м�¼������ʾ����
           			        		  Meeting meeting = (Meeting)listMeeting.get(i);     
           			        		  session.getAttribute("Meeting");
           			        		  
           			        		  
           			        		  
           			        		%>
           			        		<tr>
                      <td>
                   <a href="#" onClick="JScript:window.open('meeting_detail.jsp?currPage=<%=iCurrPage%>&&ID=<%=meeting.getId() %>','','width=545,height=380');return false"><%=meeting.getSubject()%></a></td>
                      <td><div align="center" class="STYLE11"><%=meeting.getCPerson()%></div></td><!--�����ҳ����Ļ������������ڱ������ʾ-->
                      <td><div align="center" class="STYLE11"><%=meeting.getMTime()%> </div></td>
                      <%  String purview = (String)application.getAttribute("Purview");      //��ý�������application�еĵ�¼�û�Ȩ��
                        if(purview.equalsIgnoreCase("ֻ��")){                                 //����û���Ȩ����"ֻ��"����ת��meeting_delno.jspҳ�棬���ܽ���ɾ��������
                     	 %>
                     	 <td><div align="center">
                     	 <a href="meeting_delno.jsp">                                       
                     	 <img src="../../Images/del.gif" width="16" height="16" border="0"></td>
                    	  <%} %>
                    	  <%if(purview.equalsIgnoreCase("ϵͳ")){ %>                           <!-- �û�Ȩ��Ϊ"ϵͳ",���Խ���ɾ������ -->
                     <td><a href="#" onClick="JScript:window.open('meeting_del_ok.jsp?ID=<%=meeting.getId()%>&link=<%=listMeeting.size()%>&currPage=<%=iCurrPage%>','','width=550,height=350');return false">
                     <img src="../../Images/del.gif" width="16" height="16" border="0"></a>     
                    </td>
                   </tr>
                  <%}}}%>
               </table>
              </td>
            </tr>
        </table>
          <table width="100%" border="0" cellspacing="-2" cellpadding="-2" background="../../Images/main_center.jpg">
            <tr>
              <td height="25" class="STYLE2"><div align="center" class="STYLE11">      
            <%
               if(recPerPage < allRecCount){
                String href = "&nbsp;&nbsp;<a href='meeting_index.jsp?currPage="; //��ҳ��ַ
                StringBuffer sbf = new StringBuffer();                            //������ҳ��
               if(iCurrPage > 1){                                                 //������һҳ
              	sbf.append(href+(iCurrPage - 1)+"'>��һҳ</a>");
              }
               for(int i = 1 ; i <= pages ; i ++){
               if(i == iCurrPage){
                	sbf.append(href+i+"'>["+i+"]</a>");                           //׷�Ӵ�,���ֵ�ǰҳ
                	}
              	else{                                                       
              		sbf.append(href+i+"'>"+i+"</a>");
              	}
              }
               if(iCurrPage < pages){
              	sbf.append(href+(iCurrPage + 1)+"'>��һҳ</a>");                   //������һҳ
              }
                %>
               <%out.print("��ǰҳ��:["+iCurrPage+"/"+pages+"]");%>   <!-- ҳ����ʾ��ǰҳ������ҳ�� -->
               <%=sbf.toString()%>                                  <!-- �������ķ�ҳ����ʾ��ҳ���� -->
              <%}%>
              </div></td>
         </tr>
          </table>
   </body>




