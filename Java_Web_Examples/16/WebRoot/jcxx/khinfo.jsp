<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<% request.setCharacterEncoding("gb2312");%>
<jsp:useBean id="khinfo" scope="page" class="com.mingri.info.KhinfoBean">
<jsp:setProperty name="khinfo" property="*"/>
</jsp:useBean>
<jsp:useBean  id="regist" scope="page" class="com.mingri.info.KhRegist"/>
<%
   regist.setKhinfo(khinfo);
   regist.regist();//����regist()�����������ݿ����
   out.println("<script language='javascript'>alert('�Ǽǳɹ�');"+
     "window.location.href='khinfo.html';</script>");
%>
