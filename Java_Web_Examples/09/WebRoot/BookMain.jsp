<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script language="javascript">
	function openHref(main,child){					
		parent.topMenuFrame.location.href=main;
	}
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
                <title>Centered Sliding Doors Navigation at exploding-boy.com</title>
                <link href="css/main.css" rel="stylesheet">
        </head>

        <body>
                <div id="navigation">
                        <ul>
                        <c:if test="${sessionScope.loginUser!=null}">
                                <!-- CSS Tabs -->
<li <c:if test="${param.action=='br'}"> id="current" </c:if>>
<a href="bookReg.htm" target="mainFrame"
onClick="openHref('BookMain.jsp?action=br')">
<span>ͼ��Ǽ�</span></a></li>

<li <c:if test="${param.action=='listBook'}"> id="current" </c:if>>
<a href="listBookOperation.htm" target="mainFrame"
onClick="openHref('BookMain.jsp?action=listBook')">
<span>ͼ��ά��</span></a></li>

<li <c:if test="${param.action=='bb'}"> id="current" </c:if>>
<a href="bookBorrow.htm" target="mainFrame"
onClick="openHref('BookMain.jsp?action=bb')">
<span>ͼ�����</span></a></li>

<li <c:if test="${param.action=='brr'}"> id="current" </c:if>>
<a href="bookReturn.htm" target="mainFrame"
onClick="openHref('BookMain.jsp?action=brr')">
<span>ͼ��黹</span></a></li>

<li <c:if test="${param.action=='bs'}"> id="current" </c:if>>
<a href="borrowService.htm" target="mainFrame"
onClick="openHref('BookMain.jsp?action=bs')">
<span>���Ĳ�ѯ</span></a></li>
                        </c:if>
                        <c:if test="${sessionScope.loginUser==null}">
                        	<li><a href="Content.jsp" target="mainFrame"><span>��δ��¼�����߳�ʱ�����¼ϵͳ��</span></a></li>
                        </c:if>
                        </ul>
                </div>
        </body>
</html>