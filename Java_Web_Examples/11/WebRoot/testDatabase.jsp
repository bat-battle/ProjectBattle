<%@ page contentType="text/html;charset=gb2312"%>   
<%@ page import="java.sql.*"%> 
<html>   
<body>   
<%Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();   
String url="jdbc:sqlserver://localhost:1433;DatabaseName=db_test"; 
//String url="jdbc:sqlserver://LLL-FJMTD6CSEGT\\LLL2005;1433 DatabaseName=db_test";
//String url="jdbc:sqlserver://LLL-FJMTD6CSEGT\\LLL2005;DatabaseName=db_test";  
//pubsΪҪ���ӵ����ݿ�
String user="sa"; 
String password=""; 
Connection conn= DriverManager.getConnection(url,user,password);   
Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);   
String sql="select top 2 * from tb_test";   
ResultSet rs=stmt.executeQuery(sql);   
while(rs.next()) {%>   
��һ���ֶ�����Ϊ��<%=rs.getString(1)%> <br/>  
�ڶ����ֶ�����Ϊ��<%=rs.getString(2)%> <br/>  
<%}%>   
<%out.print("���ݿ�����ɹ���ף����");%> 
<%rs.close();   
stmt.close();   
conn.close();   
%>   
</body> 
</html>
