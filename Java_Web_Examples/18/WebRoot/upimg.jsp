<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%
  String formName=ParamUtils.getEscapeHTMLParameter(request,"formname","");
  String controlName=ParamUtils.getEscapeHTMLParameter(request,"controlname","");
  String imageHandle=ParamUtils.getEscapeHTMLParameter(request,"imagename","");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
<title>�ϴ�ͼƬ</title>
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" height="161">
  <tr>
    <td height="33" bgcolor="#eeeeee" style="padding:10px; ">  ͼƬ�ϴ�����
	</td>
  </tr>
  <tr>
    <td height="128" style="padding:10px; ">
<form method="POST" action="upimg_upload.jsp" ENCTYPE="multipart/form-data">
  ѡ��Ҫ�ϴ����ļ���<br>
<input name="UPIMG" type="file" size="40">
<br>
<br>

  <input type="hidden" name="formname" value="<%=formName%>">
  <input type="hidden" name="controlname" value="<%=controlName%>">
  <input type="hidden" name="imagename" value="<%=imageHandle%>">
  <input name="B1" type="submit" class="btn_grey" value="��ʼ�ϴ�">
  &nbsp;
  <input name="B2" type="button" class="btn_grey" value="ȡ������">

</form>	</td>
  </tr>
</table>

</body>

</html>
