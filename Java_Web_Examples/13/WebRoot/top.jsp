<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table width="753" height="237" border="0" align="center" cellpadding="0" cellspacing="0" background="images/9.jpg">
  <tr>
    <td valign="top"><table width="681" height="222" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="222" valign="bottom">
		<font color="EDE6BC"><a href="index.jsp" class="a1">�����ҳ</a>&nbsp; <b>|</b> &nbsp;
		
		                    <c:if test="${sessionScope.userInfo==null}">
                               <a href="#" onclick="javascript:checkUserInfo()" title="�����ȵ�¼" class="a1">�ҵ����</a>
                            </c:if>
                            <c:if test="${sessionScope.userInfo!=null}">
                                <a href="photoServlet?info=userQueryPhoto" class="a1">�ҵ����</a>
                            </c:if>
								&nbsp; <b>|</b> &nbsp;
											 
								<a href="#" class="a1">�������</a> &nbsp;<b>|</b>&nbsp;
											 
		  <a href="#" class="a1">�ֻ����</a></font>	
		</td>
      </tr>
    </table></td>
  </tr>
</table>