<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" class="com.tools.ConnDB" scope="page"></jsp:useBean>
<%
String str_subID=request.getParameter("subID");
int P_superID=-1;
int superID=-1;
ResultSet rs_sub=null;
//��ѯ����С���Ĭ��ѡ��
if(request.getParameter("superID")=="" || request.getParameter("superID")==null){
	P_superID=superID;
}else{
	P_superID=Integer.parseInt(request.getParameter("superID"));
}
rs_sub=conn.executeQuery("select * from tb_subType where superType="+P_superID);
int subID=-1;
String subName="";
%>
<select name="typeID" class="textarea" id="typeID">
<%while(rs_sub.next()){
	subID=rs_sub.getInt(1);
	subName=rs_sub.getString(3);
	if(str_subID!=null && !"".equals(str_subID)){
		int goodsSubID=Integer.parseInt(str_subID);
%>
   <option value="<%=subID%>" <%if(subID==goodsSubID){out.println(" selected");/*ע��˴��ķֺ�*/}%>><%=subName%></option>
<%}else{%>
   <option value="<%=subID%>"><%=subName%></option>
<%}
}%>
 </select>
