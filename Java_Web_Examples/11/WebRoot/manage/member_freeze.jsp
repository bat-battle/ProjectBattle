<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
if(request.getParameter("ID")!=""){
	int ID=Integer.parseInt(request.getParameter("ID"));
	String sql="update tb_member set freeze=1 where ID="+ID;
	int ret=0;
	ret=conn.executeUpdate(sql);
	if (ret!=0){
		out.println("<script language='javascript'>alert('�û�Ա��Ϣ�Ѿ������ᣡ');window.location.href='membermanage.jsp';</script>");
		}else{
		out.println("<script language='javascript'>alert('����ʧ�ܣ�');window.location.href='membermanage.jsp';</script>");
	}
}
%>
