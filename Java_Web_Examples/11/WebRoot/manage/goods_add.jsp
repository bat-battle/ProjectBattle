<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
ResultSet rs_super=conn.executeQuery("select ID,superType from V_type group by ID,superType");
int superID=-1;
String superName="";
if(rs_super.next()){
	superID=rs_super.getInt(1);
}else{
	out.println("<script language='javascript'>alert('����¼�������Ϣ!');window.location.href='index.jsp';</script>");
	return;
}
%>
<html>
<head>
<title>MR���繺�����ġ�����̨����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
<script language="javascript" src="../JS/AjaxRequest.js"></script>
<script language="javascript" src="../JS/AjaxAssistantFun.js"></script>
<script language="javascript">
/***************************���ú���*************************/
function selSubType(val){
//�˴���Ҫ��&nocache="+new Date().getTime()�����򽫳��������б���е����ݲ����µ����
	var loader=new net.AjaxRequest("selSubType.jsp?superID="+val+"&nocache="+new Date().getTime(),deal_type,onerror,"GET");
}
</script>
</head>
<script language="javascript">
function mycheck(){
	if (form1.goodsName.value==""){
		alert("��������Ʒ���ƣ�");form1.goodsName.focus();return;
	}
	if (form1.picture.value==""){
		alert("������ͼƬ�ļ���·����");form1.picture.focus();return;
	}
	if (form1.price.value==""){
		alert("��������Ʒ�Ķ��ۣ�");form1.price.focus();return;
	}
	if (isNaN(form1.price.value)){
		alert("������Ķ��۴������������룡");form1.price.value="";form1.price.focus();return;
	}	
	if (form1.introduce.value==""){
		alert("��������Ʒ��飡");form1.introduce.focus();return;
	}		
	form1.submit();
}
</script>
<body onLoad="selSubType(<%=superID%>)">
<jsp:include page="banner.jsp"/>
<table width="788" height="288"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>

    <td align="center" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="10" height="38" align="right">&nbsp;</td>
        <td colspan="3" class="tableBorder_B_dashed"><img src="../images/manage_ico1.GIF" width="11" height="11">&nbsp;<a href="superType.jsp"> [�������Ϣ����]</a>&nbsp;&nbsp;&nbsp;<img src="../images/manage_ico2.GIF" width="11" height="11">&nbsp;<a href="subType.jsp">[С������Ϣ����]</a>&nbsp;&nbsp;&nbsp;<img src="../images/manage_ico3.GIF" width="12" height="12">&nbsp;<a href="goods_add.jsp">[�����Ʒ��Ϣ]</a></td>
        <td width="12">&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td height="10" colspan="3">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="29" align="right">&nbsp;</td>
        <td width="19" background="../images/manage_leftTitle_left.GIF">&nbsp;</td>
        <td width="588" align="center" background="../images/manage_leftTitle_mid.GIF" class="word_white"><b>�����Ʒ��Ϣ</b></td>
        <td width="20" background="../images/manage_leftTitle_right.GIF">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
	<!---->
       			<form action="goods_add_deal.jsp" method="post" name="form1">
			    <table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF">
                  <tr>
                    <td width="14%" height="27">&nbsp;��Ʒ���ƣ�</td>
                    <td height="27" colspan="3">&nbsp;
                      <input name="goodsName" type="text" class="Sytle_text" id="bookID2" size="50">&nbsp;&nbsp;  </td>
                  </tr>				
                  <tr>
                    <td height="27">&nbsp;�������ࣺ</td>
                    <td width="31%" height="27">&nbsp;
                      <select name="supertype" class="textarea" id="supertype" onChange="selSubType(this.value)">
					  <%rs_super.first();
					  do{
						  superID=rs_super.getInt(1);
						  superName=rs_super.getString(2);
					  %>
					  <option value="<%=superID%>"><%=superName%></option>
					  <%}while(rs_super.next());%>
                      </select></td>
                    <td width="13%" height="27"> &nbsp;����С�ࣺ</td>
                    <td width="42%" height="27" id="subType">���ڵ���С������Ϣ����</td>
                  </tr>
                  <tr>
                    <td height="41">&nbsp;ͼƬ�ļ���</td>
                    <td height="41">&nbsp;
                          <input name="picture" type="text" class="Style_upload" id="picture">
                    </td>
                    <td height="41">&nbsp;�������ۣ�</td>
                    <td height="41">&nbsp;
                          <input name="price" type="text" class="Sytle_text" id="price">
      (Ԫ)</td>
                  </tr>
                  <tr>
                    <td height="45">&nbsp;�Ƿ���Ʒ��</td>
                    <td>&nbsp; <input name="newGoods" type="radio" class="noborder" value="1" checked>
��
  <input name="newGoods" type="radio" class="noborder" value="0">
��</td>
                    <td>&nbsp;�Ƿ��ؼۣ�</td>
                    <td><input name="sale" type="radio" class="noborder" value="1" checked>
��
  <input name="sale" type="radio" class="noborder" value="0">
��</td>
                  </tr>
                  <tr>
                    <td height="103">&nbsp;��Ʒ��飺</td>
                    <td colspan="3"><span class="style5">&nbsp; </span>
                        <textarea name="introduce" cols="60" rows="5" class="textarea" id="introduce"></textarea></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="4" align="center">
                        <input name="Button" type="button" class="btn_bg_short" value="����" onClick="mycheck()">
&nbsp;                        
<input name="Submit2" type="reset" class="btn_bg_short" value="����">
                        &nbsp;
                        <input name="Submit3" type="button" class="btn_bg_short" value="����" onClick="JScript:history.back(-1)">
                    </td>
                  </tr>
                </table>
			  </form>    
	 <!----> 
</td>
	  
	      <td width="182" valign="top"><table width="100%" height="431"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="199" valign="top" bgcolor="#FFFFFF"><jsp:include page="navigation.jsp"/></td>
      </tr>
    </table></td>	  
  </tr>
</table>
<jsp:include page="copyright.jsp"/>
</body>
</html>
