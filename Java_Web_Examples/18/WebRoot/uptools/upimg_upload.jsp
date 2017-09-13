<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="com.jspsmart.upload.*"%>
<%
	String uploadedPathName="";//
        String uploadedFileName="";
	double uploadedFileSize=0;
	boolean bSuccessed=false;
	boolean bControl=true;
	com.jspsmart.upload.SmartUpload mySmartUpload=new com.jspsmart.upload.SmartUpload();

	// ��ʼ������JSP�в���������pageContext
	mySmartUpload.initialize(pageContext);

	// ִ���ϴ�����
	mySmartUpload.upload();

	// �����ļ�����
	for (int i=0;i<mySmartUpload.getFiles().getCount();i++){

		// ȡ�ü����еĵ�ǰ�ļ�
		com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);

		// isMissing�ж��ļ��ϴ��Ƿ��д������û�д��󷵻�true,���򷵻�false
		if (!myFile.isMissing()&&i==0) {

			// �ļ��������浽�ļ�����
            java.util.Random rnd=new java.util.Random(new java.util.Date().getTime()+1);
			long lRand=rnd.nextLong();
			long tRand=new java.util.Date().getTime();
			String strRand=new Long(lRand).toString()+new Long(tRand).toString();
			uploadedPathName="/uploads/kxi_"+strRand+"."+myFile.getFileExt();
			uploadedFileName="kxi_"+strRand+"."+myFile.getFileExt();
            uploadedPathName=uploadedPathName.replace('-','_');
			uploadedFileName=uploadedFileName.replace('-','_');

			myFile.saveAs(uploadedPathName);
			//  ��ʾ�ļ�����
			uploadedFileSize=myFile.getSize()/1024;
			bSuccessed=true;
			break;
		}
	}
	// ȡ�����пؼ���ֵ
	String formName=mySmartUpload.getRequest().getParameter("formname");
	String controlName=mySmartUpload.getRequest().getParameter("controlname");
	String imageHandle=mySmartUpload.getRequest().getParameter("imagename");
	if(formName==null)
	{
	  formName="";
	}
	if(controlName==null)
	{
	  controlName="";
	}
	if(imageHandle==null)
	{
	  imageHandle="";
	}
	if(formName.trim().equals("")||controlName.trim().equals("")||imageHandle.trim().equals(""))
	{
	  bControl=false;
	}

%>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>ͼƬ�ϴ����</title>
<style>
<!--
  td,th,tr,table,body{font-size:9pt}
-->
</style>
<script language="javascript">
<!--
  function ImgOk()
  {
  	opener.document.<%=formName%>.<%=controlName%>.value='<%=uploadedPathName%>';
  	opener.document.<%=formName%>.<%=imageHandle%>.src='<%=uploadedPathName%>';
  	window.close();


  }
//-->
</script>
</head>

<body>
<%

  if(bSuccessed)
  {
%>
<table border="1" cellpadding="3" cellspacing="0" width="400">
  <tr>
    <td width="390" colspan="4" height="24">
      <p align="center">ͼƬ�ϴ��ɹ�</td>
  </tr>
  <tr>
    <td width="91" height="18">�ϴ����ļ�����</td>
    <td width="74" height="18"><%=uploadedFileName%>��</td>
    <td width="110" height="18">�ļ���С(KB)��</td>
    <td width="91" height="18"><%=uploadedFileSize%></td>
  </tr>
  <tr>
    <td width="390" height="92" colspan="4"><img border="0" src="<%=uploadedPathName%>" width="383" height="256"></td>
  </tr>
  <tr>
  <%
    if(bControl)
    {
  %>
    <td width="390" height="19" colspan="4"><input type="button" name="btn" value="ȷ��������" onclick="JavaScript:ImgOk();"></td>
   <%
    }
     else
     {
   %>
   <td width="390" height="19" colspan="4"><input type="button" name="btn" value="ȷ��������" onclick="JavaScript:window.close();">></td>

   <%
     }
   %>
  </tr>
</table>
<%
   }
   else
   {
%>
   ͼ���ϴ�ʧ�ܣ�<BR><BR><BR><BR>
   <input type="button" name="btn" value="�رմ���" onclick="JavaScript:window.close();">>
<%
    }
%>
</body>

</html>
