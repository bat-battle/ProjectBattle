<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.db.Condb"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
</head>

<body>
<%
	Condb con=new Condb();
	String str=request.getParameter("Numbic");
	out.println(str);
	String choose=request.getParameter("choose");
	String sql="";
	if(choose.equals("on")){
		sql="update tb_Task set Whether=1 where Taskname='"+str+"'";
	}
	int temp=con.executeUpdate(sql);
	if(temp>0){
		response.sendRedirect("taskedit.jsp");
	}else{
		out.println("���ݿ������������ϵͳͳ����Ա��ϵ");
	}
%>
</body>
</html>
