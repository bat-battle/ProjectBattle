<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<%
String manager=chStr.chStr(request.getParameter("manager"));//�˴�������б���ת�����������������û���ʱ����������
try{
	ResultSet rs=connDB.executeQuery("select * from tb_manager where manager='"+manager+"'");
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
