<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%
  String formName=ParamUtils.getEscapeHTMLParameter(request,"formname","");
  String controlName=ParamUtils.getEscapeHTMLParameter(request,"controlname","");
  String imageHandle=ParamUtils.getEscapeHTMLParameter(request,"imagename","");
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>�ϴ�ͼƬ</title>
</head>

<body>

<form method="POST" action="upimg_upload.jsp" ENCTYPE="multipart/form-data">
  <p>&nbsp;aYAYA ͼƬ�ϴ�����<br>
  <br>
  ѡ��Ҫ�ϴ����ļ���<input type="file" name="UPIMG" size="40"></p>
  <p>
  <input type="hidden" name="formname" value="<%=formName%>">
  <input type="hidden" name="controlname" value="<%=controlName%>">
  <input type="hidden" name="imagename" value="<%=imageHandle%>">

  <input type="submit" value="��ʼ�ϴ�" name="B1"><input type="button" value="ȡ������" name="B2"></p>
</form>

</body>

</html>
