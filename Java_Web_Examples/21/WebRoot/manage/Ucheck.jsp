<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="com.bwm.db.Condb"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�û����</title>
</head>
<body>
<%
	Condb con=new Condb();
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String office=request.getParameter("office");
	String name=request.getParameter("name");
	String popedom=request.getParameter("popedom");
	String str="select * from tb_Person where Username='"+username+"'";
	ResultSet rs=con.executeQuery(str);
	int temp=0;
	if(rs.next()){
%>
<script language="javascript">
	alert("��������û����Ѿ���ռ��");
	history.back();
</script>	
<%	
	}else{
		String sql="insert into tb_Person(Username,Password,Office,Name,Popedom) values('"+username+"','"+password+"','"+office+"','"+name+"','"+popedom+"')";
		temp=con.executeUpdate(sql);
		if(temp>0){
%>
<script language="javascript">
	alert("��ӳɹ�");
	history.back();
</script>
<%
		}if(temp==0){
%>
<script language="javascript">
	alert("��Ӳ��ɹ�");
</script>
<%
		}if(temp<0){
%>
<script language="javascript">
	alert("���ݿ����");
</script>

<%
	}
	}
%>
</body>
</html>
