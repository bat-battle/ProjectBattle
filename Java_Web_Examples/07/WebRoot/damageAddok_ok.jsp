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
		alert("���ű�����Ϣ��ӳɹ�!");
		window.location.href="damage.do?action=damageaddquery";
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("���ʽ�������ɹ�!");
		window.location.href="ifDeal.do?action=loanApproveQuery";
		</script>		
	<%	break;
	case 3:
	%>
		<script language="javascript">
		alert("���ʽ���黹�ɹ�!");
		window.location.href="ifDeal.do?action=loanBackQuery";
		</script>		
	<%	break;
}
%>
</body>
</html>