<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<%@page import="com.hiernate.persistence.Chuchai"%>
<jsp:directive.page import="com.hiernate.util.HibernateUtil"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<%
  List listChuchai = HibernateUtil.findchuchai(Integer.parseInt(request.getParameter("id"))); //���ó����������ѯ����
    if(!listChuchai.isEmpty() && listChuchai.size()>0){
  	  for(int j=0;j<listChuchai.size();j++){
  		  Chuchai chuchai = (Chuchai)listChuchai.get(j);
  		  chuchai.setState("1");
          HibernateUtil.updateChuchai(chuchai);          //�����޸ķ���
            }
    }
    response.sendRedirect("chuchai_index.jsp?currPage="+request.getParameter("currPage"));  //�ض���chuchai_index.jspҳ��
	%>
</head>




