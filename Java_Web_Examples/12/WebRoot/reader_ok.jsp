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
		alert("������Ϣ��ӳɹ�!");
		window.location.href="reader?action=readerQuery";
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("������Ϣ�޸ĳɹ�!");
		window.location.href="reader?action=readerQuery";
		</script>		
	<%	break;
	case 3:
	%>
		<script language="javascript">
		alert("������Ϣɾ���ɹ�!");
		window.location.href="reader?action=readerQuery";
		</script>		
	<%	break;
}
%>
</body>
</html>