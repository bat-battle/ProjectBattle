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
		alert("����������Ϣ��ӳɹ�!");
		window.location.href="getUse.do?action=getuseaddquery";
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("��Ӧ����Ϣ�޸ĳɹ�!");
		window.location.href="provider.do?action=providerQuery";
		</script>		
	<%	break;
	case 3:
	%>
		<script language="javascript">
		alert("��Ӧ����Ϣɾ���ɹ�!");
		window.location.href="provider.do?action=providerQuery";
		</script>		
	<%	break;
}
%>
</body>
</html>