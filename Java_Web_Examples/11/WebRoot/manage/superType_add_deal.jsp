<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page import="com.dao.SuperTypeDaoImpl"%>
<jsp:useBean id="SuperType" scope="page" class="com.model.SuperType">
<jsp:setProperty name="SuperType" property="*"/>
</jsp:useBean>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
String typename=chStr.chStr(SuperType.gettypename());
ResultSet rs=conn.executeQuery("select * from tb_superType where typename='"+typename+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('�ô������Ϣ�Ѿ���ӣ�������µĴ������Ϣ��');window.location.href='super_add.jsp';</script>");
}else{
	int ret=0;
        SuperTypeDaoImpl ins_SuperType=new SuperTypeDaoImpl();
        ret=ins_SuperType.insert(SuperType);
	if (ret!=0){
          out.println("<script language='javascript'>alert('�������Ϣ��ӳɹ���');window.location.href='superType.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('�������Ϣ���ʧ�ܣ�');window.location.href='super_add.jsp';</script>");
        }
}
%>