<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<script language="javascript">
	function openHref(main,left){					
		parent.topMenuFrame.location.href=main;
		parent.mainFrame.location.href="Content.jsp";
		parent.leftFrame.location.href=left;
	}
</script>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title>��˵�</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="author" content="Ian Main" />
		<meta name="Copyright"
			content="Creative Commons - http://creativecommons.org/licenses/by/2.0/" />
		<link href="css/left.css" rel="stylesheet"> 
</head>
	<body>
	<center>
		<div id="menu3">
			<ul>
				<!-- CSS Tabs -->
				

				<li>
					<a <c:if test="${param.action=='Doc'}"> id="current" </c:if>
					href="#" onClick="openHref('DocMain.jsp','left.jsp?action=Doc')">��������</a>
				</li>
				<li>
					<a <c:if test="${param.action=='CJ'}"> id="current" </c:if>
					href="#" onClick="openHref('ChengjiMain.jsp', 'left.jsp?action=CJ')">�ɼ�����</a>
				</li>
				<li>
					<a <c:if test="${param.action=='jzg'}"> id="current" </c:if>
					 href="#" onClick="openHref('JzgMain.jsp','left.jsp?action=jzg')">��ְ������</a>
				</li>
				<li>
					<a <c:if test="${param.action=='book'}"> id="current" </c:if>
					href="#" onClick="openHref('BookMain.jsp','left.jsp?action=book')">ͼ��ݹ���</a>
				</li>
				<li>
					<a <c:if test="${param.action=='sm'}"> id="current" </c:if>
					href="#" onClick="openHref('SysMain.jsp','left.jsp?action=sm')">����ά��</a>
				</li>
				<li>
					<a <c:if test="${param.action=='um'}"> id="current" </c:if>
					href="#" onClick="openHref('UserManager.jsp','left.jsp?action=um')">�û�ά��</a>
				</li>
				<li>
					<a <c:if test="${param.action=='si'}"> id="current" </c:if>
					href="#" onClick="openHref('SysInfo.jsp','left.jsp?action=si')">ϵͳ��Ϣ</a>
				</li>
			</ul>
			<jsp:include flush="true" page="Login.jsp"></jsp:include>
		</div>
		</center>
	</body>
</html>
