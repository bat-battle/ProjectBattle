<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="electric.electricUtils.ParamUtils"%>
<%@ page import="electric.dbs.Dbproduct"%>
<%
    int id=ParamUtils.getIntParameter(request,"id",0);
    Dbproduct product=new Dbproduct(id);
%>
<html>
<head>
<title>�޸Ĳ�Ʒ��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet">
</head>
<script language="javascript">
<!--
  function CallUpload(formName,controlName,imageName)
  {
    toUrl="upimg.jsp?formname="+formName+"&controlname="+controlName+"&imagename="+imageName;
    window.open(toUrl,"uploadtool","width=400,height=400");
  }
//-->
</script>
<body>
<table width="777" height="172"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="Images/tiring-room/tiring-room_01.gif" width="777" height="125"></td>
      </tr>
      <tr>
        <td height="47" valign="top" background="Images/tiring-room/tiring-room_02.gif"><jsp:include page="H_navigation.jsp"/></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="44" height="380" valign="top"><img src="Images/tiring-room/tiring-room_03.gif" width="44" height="248"></td>
    <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="68" colspan="2" background="Images/tiring-room/h_modifyproduct.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="4%">&nbsp;</td>
        <td width="96%">
      <form method="POST" name="newkx" action="product_add.jsp">
            <div align="left">
              <table width="467" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="87" height="12" align="right"></td>
                  <td width="371"></td>
                </tr>
                <tr>
                  <td width="87" height="30" align="right">��Ʒ���ƣ�</td>
                  <td width="371"><input type="text" name="productname" size="28" value="<%=product.getProductname()%>"></td>
                </tr>
                <tr>
                  <td width="87" height="30" align="right"> ��Ʒ���ۣ�&nbsp;</td>
                  <td width="371"><input type="text" name="productprice" size="28" value=<%=product.getProductprice()%>></td>
                </tr>
                <tr>
                  <td width="87" height="30" align="right"> �������ң�&nbsp;</td>
                  <td width="371"><input type="text" name="productform" size="28" value=<%=product.getProductform()%>></td>
                </tr>
                <tr>
                  <td width="87" height="30" valign="top" align="right"> ��Ʒ���ܣ�                    <input type="hidden" name="Id" value="<%=id%>">
			               <input type="hidden" name="pageaction" value="modify">
	                       <input type="hidden" name="responsepage" value="productman.jsp">
                  <td width="371"><textarea name="productnote" cols="39" rows="3" class="wenbenkuang"><%=product.getProductnote()%></textarea></td>
                </tr>
                <tr>
                  <td width="87" height="12" align="right"></td>
                  <td width="371"></td>
                </tr>
                <tr>
                  <td width="87" height="12" align="right"></td>
                  <td width="371"><input name="B1" type="submit" class="btn_grey" value="�ύ">
          &nbsp;
                    <input name="B2" type="reset" class="btn_grey" value="ȫ����д">
                    &nbsp;
                    <input name="button" type="button" class="btn_grey" onClick="history.back();" value="&nbsp;��&nbsp;��&nbsp;"></td>
                </tr>
              </table>
            </div>
	      </form>
		  </td>
      </tr>
    </table></td>
    <td width="35" valign="top"><img src="Images/tiring-room/tiring-room_05.gif" width="35" height="248"></td>
  </tr>
</table>
<jsp:include page="copyright.htm"/>
</body>
</html>