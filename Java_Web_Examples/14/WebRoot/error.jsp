<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>�û���¼</title>
</head>
<link href="css/css.css" rel="stylesheet" type="text/css">
<script src="js/validate.js"></script>
<body bgcolor="#ffffff" onLoad="clockon(bgclock)">
<table width="630" border="0" cellspacing="0" cellpadding="0" class="tableBorder6"> 
  <tr> 
    <td height="165"><jsp:include page="top.jsp"/></td> 
  </tr> 
  <tr> 
    <td height="50" align="left" ><h1>error</h1></td> 
  </tr>
  <tr>
    <td height="260" align="center" valign="middle" class="Redfont">
	<%        String error=session.getAttribute("error").toString();
        if(error!=null){
            out.print(error);
        }else{
            out.print("δ֪���󣡣���");
        }%></td>
  </tr>
  <tr>
    <td height="50" align="center" valign="middle"><a style="cursor:hand" onClick="javascript:history.back();" class="delink">������ҳ</a>&nbsp;&nbsp;<a style="cursor:hand" onClick="javascrip:window.close();" class="delink">�رմ���</a></td>
  </tr> 
  <tr> 
    <td align="center"><jsp:include page="bottom.jsp"/></td> 
  </tr> 
</table> 
</body>
</html>
