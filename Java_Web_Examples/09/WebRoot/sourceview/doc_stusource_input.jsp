<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("��δ��¼�����߳�ʱ�����¼ϵͳ");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<html>
<script type="text/javascript" src="js/checkform.js"></script>

<link href="css/style.css" rel="stylesheet">
	<body onLoad="myform.stuId.focus();">
	     <tr>
			<td height="44" colspan="6">
				&nbsp;
			</td>
		</tr>
		<form name="myform" method="post" action="CjReg.htm" onsubmit="return stusourcevalid(myform)">
			<table width="59%" height="99" border="0" align="center">				
				<tr>
				  <td width="17%">ѧ�����</td>
				  <td >
				   <input type="text" name="stuId" onchange="window.location.href='regCjInfo.htm?stuId='+this.value" 
							value="${stuInfo.stuId }">
				 </td>
				  <td width="14%">ѧ������</td>
				  <td>
				   <input type="text" name="stuName" value="${stuInfo.name}">
				 </td>
			  </tr>
				 <tr>
				<td width="17%">�������</td>
				<td width="33%">
				   <input type="text" name="examType" value="">					
				 </td>
				<td width="14%">��������</td>
				<td width="36%">
					<input type="text" name="examDate" value="">
				</td>
				</tr>
				<tr>
				   <td><div align="center">����Ա</div></td>
			      <td width="33%">
				    <input type="text" name="czy" value="${sessionScope.loginUser.name}" readonly="readonly">
				  </td>
				  <td>&nbsp;</td>
				   <td>						
				     <div align="left">
				       <input type="submit" name="Submit" value="�ύ" >&nbsp;
				       <input type="reset" name="Submit2" value="����">
		             </div>
		           </td>
				</tr>
		  </table>
			
			<table width="59%" border="1" align="center" cellpadding="0" cellspacing="0">
				
				<tr>
				  <td width="52%" height="35"><div align="center">���Կ�Ŀ</div></td>									
					<td width="48%"><div align="center">���Գɼ�</div></td>	
							
				</tr>	
				<hr size="2"/>
				<c:forEach var="list" items="${list}">
					<tr>
						<td><div align="center" width='40'>${list.subject} </div></td>
						<td>
							<div align="center">
							  <label>
							  <input type="hidden" name="code${list.code}" value="${list.code}"/>
							  <input type="text" name="grade${list.code}" size="40" value="0.00"/>
							  </label>
							</div>	
                        </td>
					</tr>
				</c:forEach>			
			</table>
		</form>
		<center><font color="red" size="4">${message}</font></center>
	</body>
</html>
