<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="ins_member" scope="page" class="com.dao.MemberDaoImpl"/>
<jsp:useBean id="member" scope="request" class="com.model.Member">
<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<html>
<head>
<title>�û�ע��ɹ�!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
request.setCharacterEncoding("gb2312");
String username=member.getUsername();
ResultSet rs=conn.executeQuery("select * from tb_Member where username='"+username+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('���û����Ѿ����ڣ�������ע�ᣡ');window.location.href='register.jsp';</script>");
}else{
	int ret=0;
        ret=ins_member.insert(member);
	if (ret!=0){
          out.println("<script language='javascript'>alert('��Աע��ɹ���');window.location.href='index.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('��Աע��ʧ�ܣ�');window.location.href='register.jsp';</script>");
        }
}

%>
</body>
</html>
