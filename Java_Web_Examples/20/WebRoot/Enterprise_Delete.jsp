<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
</head>
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<body>
<%! String sql;%>
<%sql="delete tb_Enterprise where ID="+Integer.parseInt(request.getParameter("id"));
int i=data.getint(sql);
if(i>0){%>
<script language="javascript">
	alert("��ҵ����ɾ���ɹ�");
	window.close();
	opener.location.reload();
</script>
<%}%>
</body>
</html>
