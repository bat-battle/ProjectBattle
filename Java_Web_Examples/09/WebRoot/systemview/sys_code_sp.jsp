<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("��δ��¼�����߳�ʱ�����¼ϵͳ");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
<link href="css/style.css" rel="stylesheet">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript">
	function deal(id,name){
		if(confirm("�Ƿ�ɾ��" + name + "רҵ����Ϣ��")){
			window.location.href ='/school/delCode.htm?code=' + id + '&&name=sp';
		}
	}
	function check(){
		if(document.form1.spCode.value==''||isNaN(document.form1.spCode.value)){
			alert("�������ָ�ʽ����רҵ����!!!");
			document.form1.spCode.focus();
			return false;
		}
		if(document.form1.name.value==''){
			alert("רҵ���Ʋ�����Ϊ�գ����������!!!");
			document.form1.name.focus();
			return false;
		}
	}
</script>

</head>
<body onload="document.form1.spCode.focus()">  
	<table width="90%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="40" align="center">
					<div align="center">
						<p>
							
						</p>
					</div>
				</td>
			</tr>
		</table>	
	<form method="POST" action="/school/sysformcode.htm?objname=SystemSpecialtyCode" name="form1" onsubmit="return check()">
      <table width="299" border="1" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="94" height="30"><div align="center">רҵ����</div></td>
          <td width="90" height="25">
          <div align="center">
            <input name="spCode" type="text" value="${objInf.spCode}" size="26">
          </div>
          </td>
        </tr>
        <tr>
          <td height="27"><div align="center">רҵ����</div></td>
          <td height="25"><input name="name" type="text" value="${objInf.name}" size="26"></td>
        </tr>
        <tr>
			<td colspan="2">
              <div align="right">   
              	<input type="reset" name="reset" value="����" onclick="document.form1.spCode.focus()">         
	            <input type="submit" name="Submit" value="�ύ">    	          
              </div>
            </td>
        </tr>
      </table>
	</form>	
	<div align="center"> <font color="BLUE" >------------------רҵ��Ϣά��-------------------</font></div>
	<br >
	<table width="362" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#CCCCCC" bordercolordark="#ffffff">
			
			<tr align="center">
			  <td width="128">רҵ����</td>				
			  <td width="125">רҵ����</td>	
			  <td colspan="2">�û�����</td>
		    </tr>
			<c:forEach  items="${listObject}" var="sp" >
				<tr>
					<td height="18" align="center">
						${sp.spCode}				
					</td>					
					<td height="18" align="center">						
						${sp.name}
                    </td>			
					<td width="52" height="18" align="center" class="button_03">
					  <a class="hand" onclick="form1.spCode.value='${sp.spCode}';form1.name.value='${sp.name}';document.form1.name.focus()">�޸�</a>
					</td>
				   <td height="18" align="center" class="button_03">
				    <a class="hand" onclick="window.location.href('delCode.htm?code=${sp.spCode}&&name=sp')">ɾ��</a>
				   </td>
				</tr>
			</c:forEach>
       </table>
       <p align="center"><font color="red" size="4">${msgError}</font></p> 
</body>
</html>
