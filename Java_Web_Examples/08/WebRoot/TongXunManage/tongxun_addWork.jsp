<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<head>
	<%
	  String strName = request.getParameter("name1");
	  Tongxun tongxun = new Tongxun();
	  tongxun.setName1(strName);
	  HibernateUtil.saveTx(tongxun);
	%>
	<script language="javascript">
     alert("ͨѶ��������ӳɹ�!!")
     opener.location.reload();
     window.close();
    </script>
	
</head>