<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="trans" scope="page" class="com.mingri.chinese.ToChinese"/>
<jsp:useBean id="calendar" scope="page" class="com.mingri.showtime.ShowTime"/>
<%
   request.setCharacterEncoding("gb2312");
   String username=request.getParameter("username");
   String password=request.getParameter("newpw1");
   String strSql="select * from tb_user where username='"+username+"'";
   String strAdd="";
   ResultSet rs=rst.getResult(strSql);
   if(rs.next()){
         out.println("<script language='javascript'>alert('���û����Ѵ���');"+
                   "window.location.href='addUser.jsp';</script>");
   }
   else{
     String strLast=calendar.getDate();
     strAdd="insert into tb_user values ('"+username+"','"+password+"','"+strLast+"')";
     rst.doExecute(strAdd);
     out.println("<script language='javascript'>alert('ע��ɹ�');"+
                   "window.location.href='addUser.jsp';</script>");
   }
%>
