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
		alert("�����Ϣ��ӳɹ�!");
		//parent.window.location.href="bookCase?action=bookCaseQuery";
		opener.location.reload();
		window.close();
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("�����Ϣ�޸ĳɹ�!");
		opener.location.reload();
		window.close();
		</script>		
	<%	break;
	case 3:
	%>
		<script language="javascript">
		alert("�����Ϣɾ���ɹ�!");
		window.location.href="bookCase?action=bookCaseQuery";
		</script>		
	<%	break;
}
%>
</body>
</html>