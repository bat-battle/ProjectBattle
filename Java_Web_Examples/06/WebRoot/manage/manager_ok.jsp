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
		alert("����Ա��Ϣ��ӳɹ�!");
		opener.location.reload();
		window.close();
		</script>	
	<%	break;
	case 3:
	%>
		<script language="javascript">
		alert("����Ա��Ϣɾ���ɹ�!");
		window.location.href="manager.do?action=managerQuery";
		</script>		
	<%	break;
}
%>
</body>
</html>