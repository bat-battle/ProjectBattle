<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("��δ��¼�����߳�ʱ�����¼ϵͳ");
		window.location.href="Content.jsp";		
	</script>  
</c:if>

<script src="js/checkform.js"></script>  
  <link href="css/style.css" rel="stylesheet">	
	<body>
	<tr>
			 <td height="44" colspan="6">
				&nbsp;
			 </td>
		   </tr>
		<form method="POST" action="stuInfoInsert.htm?ctname=dsi" name="myform" onSubmit="return stuinfovalid(myform)">
			<p align="center">
    <p>&nbsp;</p>		
<table width="600" height="266" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
				<td>
				 <font color="red">ѧ���༶</font>				 </td>
				 <td>
				 <select name="select" onChange="window.location.href='createStuid.htm?id='+this.value ">
			        <option>��ѡ��༶</option>
			        <c:forEach var="cs" items="${messages['classinfo']}">
			        	<option value="${cs.classid}" ${cs.classid eq messages.classid?'selected':'' }>${cs.classmc}</option>
			        </c:forEach>
	               </select>				
	             </td>
				</tr>
				<tr>
				
					<td width="94">ѧ�����</td>
					<td width="188">
						<input type="text" name="stuId" value="${messages['newstuid']}" width="188" readonly="readonly">					</td>
					<td width="96">ѧ������</td>
					<td width="196">
						<input type="text" name="name"width="188">					</td>
				</tr>
				<tr>
					<td>ѧ���Ա�</td>
					<td>
					<input name="sex" type="radio" value="��" checked="yes">��
					
					 <input name="sex" type="radio" value="Ů">Ů					</td>
					<td>ѧ������</td>
					<td>
						<input type="text" name="age"width="188">					</td>
				</tr>
				<tr>
					<td>���֤��</td>
					<td>
						<input type="text" name="sfzhm"width="188">					</td>
					<td>��������</td>
					<td>
						<input type="text" name="csrq"width="188">					</td>
				</tr>
				<tr>
					<td>��ͥ��ַ</td>
					<td>
						<input type="text" name="jtdz"width="188">					</td>
					<td>��ͥ�绰</td>
					<td>
						<input type="text" name="jtdh"width="188">					</td>
				</tr>
				<tr>
				<td colspan="3">������ò
                  <select name="zzmm">
                    <option value="��Ա">��Ա</option>
                    <option value="��Ա">��Ա</option>
                  </select>
                
                   ����״��		  
                   <select name="jkzk">
                    <option value="��">��</option>
                    <option value="��">��</option>
                  </select></td>
				   <td> 				     
		             <div align="left">
		               <input type="submit" name="save" value="�ύ" >		               
		               &nbsp;&nbsp;&nbsp;
		               <input type="reset" name="add" value="����" >
                     </div>
                   </td>
				</tr>
		  </table>
		</form>
		 <div align="center"><font color="red" size="4">${messages['msg']}</font></div>
		 
	</body>
</html>
