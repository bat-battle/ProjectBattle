<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<head>
	<html:base />
	<title>��ʾͨѶ��</title>
 <style type="text/css">
 <!--
 body {
	margin-left: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
 }
 .STYLE2 {
	font-size: 10pt;
	color: #000000;
}
.style3 {color: #FF0000;}
 -->
</style>
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body background="../Images/main_center.jpg">
<table width="801" height="200" border="0" cellpadding="0" cellspacing="0" background="../Images/main_center.JPG">
  <tr>
    <td height="488" valign="top"><table width="100%" height="84%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top">
			<table width="100%" height="50" border="0" cellpadding="-2" cellspacing="-2" background="../images/bbs/bbs_01.gif">
          <tr valign="top">
            <td width="100%" height="43" background="../Images/main_top.JPG" valign="top" align="center">
			<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
		      <tr>
            <td width="5%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/isexists.gif" width="16" height="16"></td>
           <td width="23%" align="left">&nbsp;<b>��ʾͨѶ��</b></td>
          <td width="72%" valign="top" align="center">&nbsp;</td>
      </tr>
            </table>
      </td>
	 </tr>
	 <tr></tr>
     <tr>
        <td height="46" align="center">&nbsp;&nbsp;&nbsp;
       	 <table width="90%" height="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="5%" background="../Images/tiao.jpg">&nbsp;</td>
            <td width="66%" background="../Images/tiao.jpg">&nbsp;</td>
            <td width="10%" background="../Images/tiao.jpg">&nbsp;</td>
            <td width="4%" background="../Images/tiao.jpg">
			<img src="../Images/add.gif" width="20" height="18" /></td>
            <td width="15%" background="../Images/tiao.jpg" class="STYLE2">
			<%   String strpurview = (String)application.getAttribute("Purview");
                   if(strpurview.equalsIgnoreCase("ֻ��")){                   //����û�Ȩ��Ϊֻ����ת��tongxun_nomodify.jsp��ʾ�û���Ȩ���޸ĺ�ɾ������
                 %>
              <a href="tongxun_noadd.jsp">���ͨѶ�����</a></td>
            <%}%>
            <%if(strpurview.equalsIgnoreCase("ϵͳ")){ %>
            <a href="#" onClick="JScript:window.open('tongxun_add.jsp?','','width=300,height=230');return false">���ͨѶ�����</a>
            <%}%>
   </tr>
</table>
		</td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;
 <table width="709" border="1" align="center" cellpadding="0" cellspacing="0"bordercolor="#ffffff" bordercolorlight="#000000" bordercolordark="#ffffff">
            <tr>
	<%
		String currPage = request.getParameter("currPage");
        int iCurrPage = 1 ;
        int pages = 1 ;
        int allRecCount = 0 ;
        int recPerPage = 6;
        allRecCount = HibernateUtil.findTCount();     //��ѯ���ܵļ�¼��
        pages = (allRecCount - 1)/recPerPage + 1 ;    //������ܵ�ҳ��
       if(pages == 0){                                //��ҳ��������Ч�Դ���,ʹҳ������Сֵ��1
     	pages = 1;
     }
       if(currPage != null && !currPage.equalsIgnoreCase("")){
       	iCurrPage = Integer.parseInt(currPage);
       	
       }
		 %>
         <td height="26"><div align="center" class="STYLE2">ͨѶ������</div></td>
         <td width="212"><div align="center" class="STYLE2">ͨѶ��������</div></td>
          <td colspan="2"><div align="center" class="STYLE2">����ͨѶ��</div></td>
            </tr>
             <%
                List list = HibernateUtil.findT((iCurrPage - 1) * recPerPage, recPerPage); //���÷�ҳ��ѯ����
   		        if(!list.isEmpty()&&list.size()>0){
   		        	for(int j=0;j<list.size();j++){                                        
   		        	     Tongxun tx = (Tongxun)list.get(j);
   			             session.setAttribute("Txun",tx);                                  //��tx������session�з����Ժ����
   			            %>
            <tr>
              
             <td><div class="STYLE2"><span class="style3"> ����������</span>&nbsp;<a href="#" onClick="JScript:window.open('url.jsp?idd=<%=tx.getId()%>','','width=542,height=250');return false;">
              <%=tx.getName1()%>          <!-- �����ҳ���ͨѶ��������ʾ��ҳ���� -->
              </a></div></td>
              <td>
              <div align="center" class="STYLE2">
              <%
                List listTx = HibernateUtil.findTongxun(tx.getId());                       					//��������ѯͨѶ��������.
                   if(!listTx.isEmpty() && listTx.size()>0){                               //������ϲ�Ϊ�ս������²���
                	   for(int k=0;k<listTx.size();k++){
                		   Integer intename1 = (Integer)listTx.get(k);                     //��ü��ϵ�ָ��Ԫ�أ�ע���䷵��ֵ
                		   session.setAttribute("name1",intename1);                        //���õ�����ֵ������session��
                %>
           &nbsp;<%=intename1%>                                                            
		   					<!-- ���õ���ͨѶ����������ʾ��ҳ���� -->
            </div></td>
           <%}}else{                                                                         //�������Ϊ��ҳ������ʾ������
            	  %>
          &nbsp;<%=0%>
            	  <%} %>
              <td width="116"><div align="center" class="STYLE2">
                  <%
				  String purview = (String)application.getAttribute("Purview");
                       if(purview.equalsIgnoreCase("ֻ��")){                               //����û�Ȩ��Ϊֻ����ת��tongxun_nomodify.jsp��ʾ�û���Ȩ���޸ĺ�ɾ������
                     	 %>
                     	 <a href="tongxun_nomodify.jsp">
                     	 <img src="../Images/modify.gif" width="12" height="12" border="0"></td>
                     	 <td>
                     	 <a href="tongxun_nomodify.jsp">
                     	 <img src="../Images/del.gif" width="16" height="16" border="0"></td>
                    	  <%} %>
	                     <%if(purview.equalsIgnoreCase("ϵͳ")){ %>                        
						 <!-- �û�Ȩ��Ϊϵͳ����Խ����޸ĺ�ɾ������ -->
               <a href="#" onClick="JScript:window.open('tongxun_modify.jsp?Idd=<%=tx.getId()%>','','width=300,height=230');return false;">�޸�</a> 
			   			<!-- ���´�����ʽ���޸�ҳ�棬����ͨѶ���id����Ϊ������� -->
              <td width="119"><div align="center" class="STYLE2">
               <a href="tongxun_del.jsp?id=<%=tx.getId()%>&&currPage=<%=iCurrPage%>&link=<%=list.size()%>" onClick="return confirm('ɾ��ͨѶ�齫ɾ������������Ϣ���Ƿ�ȷ��ɾ��?')">ɾ��</a></div></td>                             
			   		<!-- ��ȷ��Ҫɾ����Ϣ���ύ��tongxun_del.jspҳ�沢����ǰҳ����Ϊ������� -->
            </tr>
      <%}}%>
          </table>
		  
		  <table width="709" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="25" class="STYLE2"><div align="right" class="STYLE2">
         <%  
              if(recPerPage < allRecCount){
              String href = "&nbsp;&nbsp;<a href='tongxun_index.jsp?currPage=";
              StringBuffer sbf = new StringBuffer();                   //������ҳ��ʾ��
              if(iCurrPage > 1){                                       //������һҳ
              	sbf.append(href+(iCurrPage - 1)+"'>��һҳ</a>");
              }
              for(int i = 1 ; i <= pages ; i ++){
              	if(i == iCurrPage){
              		sbf.append(href+i+"'>["+i+"]</a>");                //׷�Ӵ�
              	}
              	else{
              		sbf.append(href+i+"'>"+i+"</a>");
              	}
              }
             if(iCurrPage < pages){
              	sbf.append(href+(iCurrPage + 1)+"'>��һҳ</a>");         // ������һҳ
              }
                %>
               <%out.print("��ǰҳ��:["+iCurrPage+"/"+pages+"]");%>
               <%=sbf.toString()%>
               <%}} %>
               </div>
              </td>
      </tr>
    </table>
		</td>
 	</tr>
</table>
</body>




