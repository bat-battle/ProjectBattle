<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.wy.tools.Encrypt"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���ᡪ������������</title>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="js/js.js" type="text/javascript"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<c:if test="${sessionScope.userInfo==null}">
    <%response.sendRedirect("index.jsp");%>
</c:if>


<script type="text/javascript">
    function addMore(){
    var td = document.getElementById("more");
    var br= document.createElement("br");
    var input= document.createElement("input");
    var button= document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "�Ƴ�...";
    
    
    button.onclick = function(){
      td.removeChild(br);
      td.removeChild(input);
      td.removeChild(button);
    }
   
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
    }
</script>
 















<body>
   <jsp:include page="top.jsp" flush="true" />
   <table width="753" height="40" border="0" align="center" cellpadding="0" cellspacing="0" background="images/16.jpg">
     <tr>
       <td width="561" height="28">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#EDE6BC" size="-1"><b>��ǰ�û���${sessionScope.userInfo.username}</b></font></td>
       <td width="192">&nbsp;</td>
     </tr>
</table>
   <table width="753" height="54" border="0" align="center" cellpadding="0" cellspacing="0" background="images/17.jpg">
     <tr>
       <td height="51"><table width="287" height="33" border="0" align="center" cellpadding="0" cellspacing="0">
         <tr>
           <th width="287" height="33" align="center" valign="bottom">�ϴ�ͼƬ</th>
         </tr>
       </table></td>
     </tr>
   </table>
   
   
   
   
   <table width="753" height="504" border="0" align="center" cellpadding="0" cellspacing="0" background="images/18.jpg">
     <tr>
       <td height="120" align="center" valign="top">    
	   
	      
	   <form action="photoServlet?info=userUploadPhoto" method="post" enctype="multipart/form-data" name="form" onSubmit="return checkPhoto(form)">
	     <table width="525" border="0">
         <tr>
           <td width="75" height="20"><b>��Ƭ���ƣ�</b></td>
           <td width="434"><input name="photoName" type="text" maxlength="20"></td>
         </tr>
         <tr>
           <td height="20"><b>��Ƭ���ͣ�</b></td>
           <td>
             <select name="photoType">
			    <option value="������Ʒ">������Ʒ</option>
			    <option value="���۰���">���۰���</option>
			    <option value="���ױ���">���ױ���</option>
			    <option value="������ͨ">������ͨ</option>
			    <option value="��Ϸͼ��">��Ϸͼ��</option>
			    <option value="��Ц��ͼ">��Ц��ͼ</option>
			    <option value="���ﾫ��">���ﾫ��</option>
			    <option value="��ζ����">��ζ����</option>	
			    <option value="����԰��">����԰��</option>
			    <option value="�������">�������</option>
			    <option value="�廨����">�廨����</option>
			    <option value="׳��ɽ��">׳��ɽ��</option>
			    <option value="���з��">���з��</option>
			    <option value="��ʤ�ż�">��ʤ�ż�</option>
			    <option value="���ھ���">���ھ���</option>
			    <option value="�ļ�ӡ��">�ļ�ӡ��</option>
			    <option value="��糵Ӱ">��糵Ӱ</option>
             </select>
		   </td>
         </tr>
         <tr>
           <td height="20"><b>�ϴ�ʱ�䣺</b></td>
           <td><%=Encrypt.currentlyTime()%><input name="photoTime" type="hidden" value="<%=Encrypt.currentlyTime()%>"></td>
         </tr>
         <tr>
           <td height="20"><b>��Ƭλ�ã�</b></td>
           <td id="more"><input name="file" type="file" maxlength="20"><input type="button" name="more.." value="����..." onClick="addMore()"></td>
         </tr>
         <tr>
           <td height="20"><b>�ϴ��û���</b></td>
           <td>${sessionScope.userInfo.username}<input name="username" type="hidden" value="${sessionScope.userInfo.username}" class="input2"></td>
         </tr>
         <tr>
           <td height="20"><b>��&nbsp;֤&nbsp;�룺</b></td>
           <td><input name="code" type="text" maxlength="20"></td>
         </tr>
         <tr>
           <td height="20">&nbsp;</td>
           <td><a href="#" onClick="reload()"><img border=0 src="image.jsp" name="checkCode"></a></td>
         </tr>
         <tr>
           <td height="20">&nbsp;</td>
           <td>             
               <input type="submit" name="Submit" value="�ϴ�" >
             &nbsp;&nbsp;
               <input type="reset" name="Submit2" value="����">
             &nbsp;&nbsp;
               <input type="button" name="Submit3" value="����" onClick="javascript:window.location.href='photoServlet?info=userQueryPhoto';">
            </td>
         </tr>         
       </table>	   
	 </form>	 
	<b> ע�⣺ͼƬ�ĸ�ʽֻ��Ϊ����jpg������JPG������gif������bmp������BNP����ʽ<br><br>
	 ${requestScope.information}</b>
       </td>
     </tr>
</table>
<jsp:include page="down.jsp" flush="true"></jsp:include>
</body>
</html>
