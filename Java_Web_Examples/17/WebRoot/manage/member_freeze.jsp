<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.lang.*"%>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>

<%
if(request.getParameter("ID")!=""){
	int ID=Integer.parseInt(request.getParameter("ID"));
	String sql="update tb_member set freeze=1 where ID="+ID;
	int ret=0;
	ret=connDB.executeUpdate(sql);
	if (ret!=0){
		out.println("<script language='javascript'>alert('�û�Ա��Ϣ�Ѿ������ᣡ');window.location.href='memberManage.jsp';</script>");
		}else{
		out.println("<script language='javascript'>alert('����ʧ�ܣ�');window.location.href='memberManage.jsp';</script>");
	}
}
%>
