<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.lang.*"%>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
if(request.getParameter("hID")!=null){
	int ID=Integer.parseInt(request.getParameter("hID"));
	String sql="delete from tb_BBS where ID="+ID;
	int ret=0;
	ret=connDB.executeUpdate(sql);
	if (ret!=0){
		out.println("<script language='javascript'>alert('������Ϣɾ���ɹ���');window.location.href='BBSManage.jsp';</script>");
		}else{
		out.println("<script language='javascript'>alert('������Ϣɾ��ʧ�ܣ�');window.location.href='BBSManage.jsp';</script>");
	}
}else{
	out.println("<script language='javascript'>alert('���Ĳ�������');window.location.href='BBSManage.jsp';</script>");
}
%>
</body>
</html>
