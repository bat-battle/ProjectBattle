<%@ page language="java"  pageEncoding="gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("��δ��¼�����߳�ʱ�����¼ϵͳ");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<html> 
<link href="css/style.css" rel="stylesheet">  
  <body>
  		<form action="listStuRegSerach.htm" name="form1" method="post">
			<br>
  		    <div align="center">
				<tr>
					<td width="154">��ѯ�ֶ�:					
					  <select name="select1">					  
					    <option value="stuId">ѧ�����</option>
					    <option value="djrq">��ѧ����</option>
					    <option value="lqfs">¼ȡ����</option>
				      </select>
				      </td>
				      <td width="154">�����:					
					  <select name="select2">					  
					    <option value="DY">����</option>
					    <option value="XY">С��</option>
					    <option value="DEY">����</option>
					    <option value="LIKE">����</option>
				      </select>
				      </td>
					  <td width="190"><input type="text" width="185" name="strvalue" value="" /></td>
					  <td width="113"><input type="submit" name="query" value="��ѯ"></td>
				</tr>
			</div>
	
		</form>   
		<table width="600" border="1" align="center" cellpadding="0" cellspacing="0">	
			<tr>
	     		<c:forEach var="name" items="${tname}">				
					<td height="28" align="center">
						<div align="center">
						    <c:out value="${name}" />
						</div>
				    </td>
    			</c:forEach>
			</tr>
		</table>
</body>
  
</html>
