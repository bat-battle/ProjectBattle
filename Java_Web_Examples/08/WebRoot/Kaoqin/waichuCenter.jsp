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
	<%
	List listWai = HibernateUtil.finwaichuId(Integer.parseInt(request.getParameter("id"))); //��������ѯ����Ǽ���Ա
    if(!listWai.isEmpty() && listWai.size()>0){       //�жϼ����Ƿ�Ϊ��              
  	  for(int j=0;j<listWai.size();j++){                                                  
  		  Waichu waichu = (Waichu)listWai.get(j);      //����list��ָ��λ��Ԫ��
  		  waichu.setState(1);                          //��state��������Ϊ1
          HibernateUtil.updateWaichu(waichu);          //�����޸ķ���������Ǽǽ����޸�.
            }
    }
    response.sendRedirect("waichu.jsp?currPage="+request.getParameter("currPage")); //��Ϣ�޸ĺ��ض�����waichu.jspҳ��
	%>
</head>