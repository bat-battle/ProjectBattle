<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<%
   request.setCharacterEncoding("gb2312");
   String username=request.getParameter("username");//�����û���
   String password=request.getParameter("password");//���վ�����
   String newpw1=request.getParameter("newpw1");//����������
   String strSql="select * from tb_user where username='"+
                 username+"'and password='"+password+"'";
   ResultSet rs=rst.getResult(strSql);
   if(rs.next()){
	   //�����û���Ϣ��
     String strUpdate="update tb_user set password='"+newpw1+
                     "' where username='"+username+"'";
     rst.doExecute(strUpdate);
     out.println("<script language='javascript'>alert('�����޸ĳɹ�');"+
                   "window.location.href='usermanager.jsp';</script>");
   }else{
     out.println("<script language='javascript'>alert('�û������������');"+
                   "window.location.href='usermanager.jsp';</script>");
   }
%>
