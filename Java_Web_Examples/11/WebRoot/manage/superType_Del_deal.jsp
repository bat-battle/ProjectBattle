<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
String ID[]=request.getParameterValues("delid");
String superTypeID="";
if (ID.length>0){
	for(int i=0;i<ID.length;i++){
		superTypeID=superTypeID+ID[i]+",";
	}
	superTypeID=superTypeID.substring(0,superTypeID.length()-1);
	int ret=-1;
	String sql="Delete From tb_superType Where ID in("+superTypeID+")";
	ret=conn.executeUpdate(sql);
	if(ret==0){
		out.println("<script lanuage='javascript'>alert('�÷����Ѿ������ӷ�����Ϣ������ɾ��С������Ϣ���ٽ���ɾ��!');window.location.href='superType.jsp';</script>");
	}else{
		out.println("<script lanuage='javascript'>alert('�������Ϣɾ���ɹ�!');window.location.href='superType.jsp';</script>");
	}
}else{
	out.println("<script lanuage='javascript'>alert('���Ĳ�������!');window.location.href='superType.jsp';</script>");
}
%>
