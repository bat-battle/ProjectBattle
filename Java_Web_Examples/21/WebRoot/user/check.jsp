<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.page.Show"%> 
<%@ page import="com.bwm.db.Condb"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
</head>

<body>
<%
	Condb con=new Condb();
	//Connection conn=con.getConnection();
	Show show=new Show();
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	String sql="select * from tb_Person where Username='"+name+"' and Password='"+password+"'";
	ResultSet rs=con.executeQuery(sql);
	if(rs.next()){
	String strsql=rs.getString(1);
		session.setAttribute("name",name);
		session.setAttribute("password",password);
		session.setAttribute("groupid",strsql);
		response.sendRedirect("index.htm");
	}else{
		out.print(show.errorBox("��������û�������������","������Ϣ"));
		out.close();
}	
//if(conn!=null){
//	conn.close();
//}
con.close();
%>

</body>
</html>
