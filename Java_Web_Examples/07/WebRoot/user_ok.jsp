<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>�����ɹ�!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%int para=Integer.parseInt(request.getParameter("para"));
switch(para){
	case 1:
	%>
		<script language="javascript">
		alert("�û���Ϣ��ӳɹ�!");
		window.location.href="user.do?action=userQuery";
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("�û�Ȩ�����óɹ�!");
		window.location.href="user.do?action=userQuery";
		</script>		
	<%	break;
	case 3:
	%>
		<script language="javascript">
		alert("�û���Ϣɾ���ɹ�!");
		window.location.href="user.do?action=userQuery";
		</script>		
	<%	break;
	case 4:
	%>
	<script language="javascript">
		alert("�û������޸ĳɹ�!");
		window.location.href="main.jsp";
		</script>		
	<%
}
%>
</body>
</html>