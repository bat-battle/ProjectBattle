<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.db.Condb"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ɹ�ɾ��ҳ��</title>
</head>

<body>
<%
	Condb con=new Condb();
	String str=request.getParameter("te");
	if(str!=null){
		String sql="delete from tb_Result where Resultname='"+str+"'";
		String te="delete from tb_Con where TaskRname='"+str+"'";
		con.executeUpdate(te);
		int temp=con.executeUpdate(sql);
		if(temp<1){
			out.println("ɾ��ʧ��");
		}else{
			response.sendRedirect("lackresult.jsp");
		}
	}
%>
</body>
</html>
