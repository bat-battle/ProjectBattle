<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>��¼</title>
	</head>
	<body>
		<div align="center">
			<c:if test="${sessionScope.loginUser==null }">
				<form name="form1" method="post" action="login.htm">
					<p>
						<span class="word_orange">�û�����</span>
						<input name="username" type="text" size="10">
					</p>
					<p>
						<span class="word_orange">��&nbsp;&nbsp;&nbsp;&nbsp;�룺</span>
						<input name="password" type="password" size="10">
					</p>
					<p>
						&nbsp;&nbsp;
						<input type="submit" name="Submit" value="��¼">
						&nbsp;&nbsp;
						<input type="reset" name="Submit2" value="ȡ��">
					</p>
					<p align="center">
						${message }
					</p>
				</form>
			</c:if>
			<c:if test="${sessionScope.loginUser!=null }">
		
				<p align="center">
					<span class="word_orange">
						��ǰ�û���${sessionScope.loginUser.name } </span>
				</p>
				<p align="center" class="button_03">
					<a href="login.htm?action=logout">�˳�</a>
				</p>
				<p align="center">
						${message }
				</p>
			</c:if>
		</div>
	</body>
</html>
