<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String manager=chStr.chStr(request.getParameter("manager"));//�˴�������б���ת�����������������û���ʱ����������
try{
	ResultSet rs=conn.executeQuery("select * from tb_manager where manager='"+manager+"'");
	if(rs.next()){
		String PWD=request.getParameter("PWD");
		if(PWD.equals(rs.getString("PWD"))){
			session.setAttribute("manager",manager);
			response.sendRedirect("index.jsp");
		}else{
			out.println("<script language='javascript'>alert('������Ĺ���Ա���������!');window.location.href='../index.jsp';</script>");
		}
	}else{
			out.println("<script language='javascript'>alert('������Ĺ���Ա���������!');window.location.href='../index.jsp';</script>");
	}
}catch(Exception e){
	out.println("<script language='javascript'>alert('���Ĳ�������!');window.location.href='../index.jsp';</script>");
}
%>
