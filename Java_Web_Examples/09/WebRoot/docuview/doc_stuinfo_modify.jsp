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
        <tr>
		 <td height="44" colspan="6">
			&nbsp;
		 </td>
		</tr>
  		<form action="listStuModi.htm" name="form1" method="post">
			<br>
  		    <div align="center">
				<tr>
					<td width="154">��ѯ����:					
					  <select name="select">					  
					    <option value="stuId" ${selectStr=='stuId'?'selected':'' }>ѧ�����</option>
					    <option value="name" ${selectStr=='name'?'selected':'' }>ѧ������</option>
					    <option value="sfzhm" ${selectStr=='sfzhm'?'selected':'' }>���֤��</option>
				      </select></td>
					  <td width="190"><input type="text" width="185" name="strvalue" value="${conValue }" /></td>
					  <td width="113"><input type="submit" name="query" value="��ѯ"></td>
				</tr>
			</div>
		
		</form>   
		<table width="600" border="1" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td><div align="center">ѧ�����</div></td>
				<td><div align="center">ѧ������</div></td>				
			    <td><div align="center">���֤��</div></td>
			    <td><div align="center">�������� </div></td>		    
			    <td><div align="center">��ͥ��ַ</div></td>
				<td><div align="center">�û�ѡ�� </div></td>			   
			</tr>

			<c:forEach var="stuinf" items="${messages}">
				<tr>
					<td height="28" align="center">
						<div align="center">
						    <c:out value="${stuinf.stuId}" />
						</div>
				    </td>
					<td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf.name}" />
						</div>
					</td>
					<td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf.sfzhm}" />
						</div>
					</td>
					<td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf.csrq}" />
						</div>
					</td>				
					<td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf.jtdz}" />
						</div>
					</td>
					<td width="52" height="18" align="center" class="button_03">	
						<a class="hand" onclick="window.location.href('listStuModiSave.htm?id=${stuinf.stuId}')">ά��</a>
					</td>					
				</tr>
			</c:forEach>
		</table>
</body>
  
</html>
