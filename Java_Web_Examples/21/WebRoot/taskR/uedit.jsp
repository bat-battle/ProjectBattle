<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.bwm.db.Condb"%> 
<% request.setCharacterEncoding("gb2312"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�޸ĸ�����Ϣ</title>
<style type="text/css">
<!--
.style1 {color: #CC9933}
-->
</style>
</head>
<link href="../css/style.css" rel="stylesheet">
<script language="JavaScript">
function CheckDate(INDate)
{ if(INDate=="")
    {return true;}
	subYY=INDate.substr(0,4)
	//ת���·�
	if(INDate.indexOf('-',0)!=-1){	separate="-"}
	else{
		if(INDate.indexOf('/',0)!=-1){separate="/"}
		else {return true;}}
		area=INDate.indexOf(separate,0)
		subMM=INDate.substr(area+1,INDate.indexOf(separate,area+1)-(area+1))
		if(subMM.length<2){subMM="0"+subMM}
	//ת����
	area=INDate.lastIndexOf(separate)
	subDD=INDate.substr(area+1,INDate.length-area-1)
	if(eval(subDD)<10){subDD="0"+eval(subDD)}
	NewDate=subYY+"-"+subMM+"-"+subDD
	if(NewDate.length!=10){return true;}
    if(NewDate.substr(4,1)!="-"){return true;}
    if(NewDate.substr(7,1)!="-"){return true;}
	if(NewDate.substr(5,2)>"12"){return true;}
	if(NewDate.substr(8,2)>"31"){return true;}
   return false;}
</script>
<script language="javascript">
<!--
	function check(){
		if(form1.Username.value==""){
			alert("�û�����Ϊ��");
			form1.Username.focus();
			return false;
		}
		if(form1.Password.value==""){
			alert("���벻��Ϊ��ֵ");
			form1.Password.focus();
			return false;
		}
		if(form1.Password.value!=form1.Password1.value){
			alert("�����������벻һ��");
			return false;
		}
		if(form1.Office.value==""){
			alert("�����������ڵĿ���");
			form1.Office.focus();
			return false;
		}
		if(isNaN(form1.Age.value)){
			alert("��������ֵ���벻Ҫ�Ƿ�����");
			return false;
		}
		if(form1.Age.value>70){
			alert("�ҵ����Ķ�����70�˻��о���");
			return false;
		}
		if(form1.Datetime.value==""){
				alert("��������μӹ�����ʱ��");
				return false;
			}else {
				if(CheckDate(form1.Datetime.value)){
				window.alert("�������Ͳ���ȷ�밴yyyy-mm-dd��ʽ����");
				return false;
				}
			}
	}
-->
</script>
<%
	Condb con=new Condb();
	String sql="select * from tb_Person where Username='"+session.getAttribute("name")+"' and Password='"+session.getAttribute("password")+"'";
	ResultSet rs=con.executeQuery(sql);
	while(rs.next()){
	String rs2=rs.getString(2);
	String rs4=rs.getString(4);
	String rs5=rs.getString(5);
	String rs6=rs.getString(6);
	String rs7=rs.getString(7);
	String rs8=rs.getString(8);
	String rs9=rs.getString(9);
	if(rs6==null||rs7==null||rs8==null||rs9==null)
	{
		rs6="";rs7="";rs8="";rs9="";
	}
%>
<body>
<br>
<table width="328" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ECFBFF" class="tableBorder">
<form action="putin.jsp" method="post" name="form1">
  <tr align="center" bgcolor="#F7F3EF">
    <td height="26" colspan="3"><center class="style1">
      <font size="4" face="����">�޸ĸ�����Ϣ</font>
    </center></td>
  </tr>
  <tr>
    <td width="31" height="24">&nbsp;</td>
    <td width="98" height="24">�û���:</td>
    <td width="216" height="24"><input name="Username" type="text" class="txt_grey" value="<%=rs2%>" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">������:</td>
    <td height="24"><input name="Password" type="password" class="txt_grey" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">ȷ������:</td>
    <td height="24"><input name="Password1" type="password" class="txt_grey" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">����:</td>
    <td height="24"><input name="Office" type="text" class="txt_grey" value="<%=rs4%>" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">��ʵ����:</td>
    <td height="24"><input name="Name" type="text" class="txt_grey" value="<%=rs5%>" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">����:</td>
    <td height="24"><input name="Age" type="text" class="txt_grey" value="<%=rs6%>" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">ְ��:</td>
    <td height="24"><input name="Business" type="text" class="txt_grey" value="<%=rs7%>" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">ְ��:</td>
    <td height="24"><input name="Post" type="text" class="txt_grey" value="<%=rs8%>" size="28"></td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td height="24">����ʱ��:</td>
    <td height="24"><input name="Datetime" type="text" class="txt_grey" value="<%=rs9%>" size="28"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="24">����:</td>
    <td height="24"><textarea name="Bio" cols="26" rows="4" class="txt_grey"></textarea></td>
  </tr>
  <tr align="center" bgcolor="#F7F3EF">
    <td height="24" colspan="3"><input name="Submit" type="submit" class="btn_grey" value="�ύ" onClick="return check()">
    <input name="Submit2" type="reset" class="btn_grey" value="����"></td>
  </tr>
 </form>
</table>
<%
}
	con.close();
%>
</body>
</html>
