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
<li <c:if test="${param.action=='rc'}"> id="current" </c:if>>
<a href="regCjInfo.htm" target="mainFrame" 
onClick="openHref('ChengjiMain.jsp?action=rc')">
<span>�ɼ�¼��</span></a></li>

<li <c:if test="${param.action=='sc'}"> id="current" </c:if>>
<a href="searchCjInfo.htm" target="mainFrame"
onClick="openHref('ChengjiMain.jsp?action=sc')">
<span>�ɼ���ѯ</span></a></li>

<li <c:if test="${param.action=='cs'}"> id="current" </c:if>>
<a href="classSourceList.htm" target="mainFrame"
onClick="openHref('ChengjiMain.jsp?action=cs')">
<span>�༶�ɼ�ͳ��</span></a></li>

<li <c:if test="${param.action=='gs'}"> id="current" </c:if>>
<a href="gradeSourceList.htm" target="mainFrame"
onClick="openHref('ChengjiMain.jsp?action=gs')">
<span>�꼶�ɼ�ͳ��</span></a></li>

						</c:if>
						<c:if test="${sessionScope.loginUser==null}">
                        	<li><a href="Content.jsp" target="mainFrame"><span>��δ��¼�����߳�ʱ�����¼ϵͳ��</span></a></li>
                        </c:if>
                        </ul>
                </div>
        </body>
</html>