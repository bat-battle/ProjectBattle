<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<html>
<head>
<title>�û�ע��ɹ�!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
request.setCharacterEncoding("gb2312");
String username=request.getParameter("UserName");
String truename=request.getParameter("TrueName");
String PWD=request.getParameter("PWD1");
String cardNO=request.getParameter("cardNO");
String CardType=request.getParameter("CardType");
String tel=request.getParameter("tel");
String city=request.getParameter("city");
String address=request.getParameter("address");
String postcode=request.getParameter("postcode");
String Email=request.getParameter("Email");
ResultSet rs=connDB.executeQuery("select * from tb_Member where username='"+username+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('���û����Ѿ����ڣ�������ע�ᣡ');window.location.href='register.jsp';</script>");
}else{
	String sql="Insert into tb_Member (username,truename,password,city,address,postcode,cardNO,CardType,tel,Email) values('"+username+"','"+truename+"','"+PWD+"','"+city+"','"+address+"','"+postcode+"','"+cardNO+"','"+CardType+"','"+tel+"','"+Email+"')";
	int ret=0;
	ret=connDB.executeUpdate(sql);
	if (ret!=0){
		out.println("<script language='javascript'>alert('�û�ע��ɹ���');window.location.href='index.jsp';</script>");
		}else{
		out.println("<script language='javascript'>alert('�û�ע��ʧ�ܣ�');window.location.href='register.jsp';</script>");
	}
}
%>
</body>
</html>
