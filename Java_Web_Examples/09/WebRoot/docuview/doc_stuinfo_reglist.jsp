<%@ page language="java"  pageEncoding="gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("��δ��¼�����߳�ʱ�����¼ϵͳ");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<html> 
<script src="js/checkform.js"></script>  
<link href="css/style.css" rel="stylesheet">  
  <body>
  <tr>
		 <td height="44" colspan="6">
			&nbsp;
		 </td>
		</tr>
  		<form action="listStuRegSerach.htm" name="form1" method="post" onsubmit="return checkRegList(form1)">
			&nbsp;
  		    <div align="center">
				<tr>
					<td width="154">��ѯ�ֶ�:					
					  <select name="select1">					  
					    <option value="stuId" ${propName=='stuId'?'selected':'' }>ѧ�����</option>
					    <option value="djrq" ${propName=='djrq'?'selected':'' }>��ѧ����</option>
					    <option value="lqfs" ${propName=='lqfs'?'selected':'' }>¼ȡ����</option>
				      </select>
				      </td>
				      <td width="154">�����:					
					  <select name="select2">					  
					    <option value="DY" ${conName=='DY'?'selected':'' }>����</option>
					    <option value="XY" ${conName=='XY'?'selected':'' }>С��</option>
					    <option value="DEY" ${conName=='DEY'?'selected':'' }>����</option>
				      </select>
				      </td>
					  <td width="190"><input type="text" width="185" name="strvalue" value="${strValue }" /></td>
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
			    <td><div align="center">��ѧ����</div></td>
				<td><div align="center">¼ȡ����</div></td>			   
				<td><div align="center">������</div></td>			   
			</tr>
			<c:forEach var="stuinf" items="${messages}">
				<tr>
					<td height="28" align="center">
						<div align="center">
						    <c:out value="${stuinf.docuStuInfo.stuId}" />
						</div>
				    </td>
                    <td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf['docuStuInfo'].name}" />
						</div>
					 </td>
					<td height="28" align="center">
						<div align="center"> 
							<c:out value="${stuinf['docuStuInfo'].sfzhm}"/>
						</div>
					</td>
					<td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf['docuStuInfo'].csrq}" />
						</div>
					</td>
					 <td height="28" align="center">
						<div align="center">
						    <c:out value="${stuinf.djrq}" />
						</div>
				     </td>
								
					<td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf.lqfs}" />
						</div>
					</td>						
					<td height="28" align="center">
						<div align="center">
							<c:out value="${stuinf.jbr}" />
						</div>
					</td>			
				</tr>
			</c:forEach>
		</table>
		<p>&nbsp;</p>
		<center><font color="red" size="4">${msg}</font></center>
</body>
  
</html>
