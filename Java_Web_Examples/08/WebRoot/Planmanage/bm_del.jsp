<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<html:base />
	<title>��ҵ�ƻ�����ҳ��</title>
<%
      
    int link=Integer.parseInt(request.getParameter("link"));
    int currPage=Integer.parseInt(request.getParameter("currPage"));
   
    if(link==1){
   				 if(currPage!=1){
  				  currPage=currPage-1;
  			
   			 }}
  String strid = request.getParameter("id");
  List listbm = HibernateUtil.findbmid(Integer.parseInt(strid));  //�����������ҷ������Ҳ��Ŷ���
	  if(!listbm.isEmpty()&&listbm.size()>0){
		  for(int i=0; i<listbm.size();i++){
			  Bm bm = (Bm)listbm.get(i);
			  HibernateUtil.deleBm(bm);         //����ɾ������
		  }
	}
%>
 <script language="javascript">
 opener.location.reload();
{alert("���żƻ���Ϣɾ���ɹ�!")}
</script>
<%
  response.sendRedirect("bm_index.jsp?currPage="+currPage); //�ض����²��żƻ���ҳ
%>
</head>