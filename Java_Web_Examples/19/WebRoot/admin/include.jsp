<%@ page import="com.bwm.page.Show" %>
<%
if(session.getAttribute("admin")==null){
	out.print(new Show().errorBox("�㻹û�е�¼","������Ϣ"));
	return;
}
%>