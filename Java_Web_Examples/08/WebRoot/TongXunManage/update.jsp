<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<head>
	<html:base />
	<title>�޸�Ա����Ϣ</title>
	
<style type="text/css">
<!--
.style1 {
	font-size: 16px;
	font-weight: bold;
	color: #0000FF;
}
body,td,th {
	font-size: 12px;
}
body {
	background-color: #ffffff;
	margin-top: 0px;
}
.style2 {color: #000000}
.style3 {
	font-size: 14px;
	color: #000000;
}
-->
</style>
<style type="text/css">
<!--
.STYLE4 {
	font-size: 10pt;
	color: #FFFFFF;
}
-->
</style>
<script type="text/JavaScript">
<!--
function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}
//-->
</script>
<link href="../CSS/style.css" rel="stylesheet" type="text/css">

<script language="javascript">
function checkemail(email)
{
var str=email;
//��JavaScript�У�������ʽֻ��ʹ��"/"��ͷ�ͽ���������ʹ��˫����
var Expression=/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
var objExp=new RegExp(Expression);
if(objExp.test(str)==true)
{return true;}
else
{return false;}
}
</script>
<script language="javascript">
function Mycheck()
{
if(form1.name11.value=="")
{alert("����������!!");form1.name11.focus();return;}
if(form1.birthday.value=="")
{alert("�������ڲ���Ϊ��!!");form1.birthday.focus();return;}
if(form1.sex.value=="")
{alert("��ѡ���Ա�!!");form1.sex.focus();return;}
if(form1.hy.value=="")
{alert("��ѡ�����״��!!");form1.hy.focus();return;}
if(form1.dw.value=="")
{alert("������������λ����!!");form1.dw.focus();return;}
if(form1.department.value=="")
{alert("������������������!!");form1.department.focus();return;}
if(form1.zw.value=="")
{alert("����������ְλ!!");form1.zw.focus();return;}
if(form1.sf.value=="")
{alert("����������ʡ������!!");form1.sf.focus();return;}
if(form1.cs.value=="")
{alert("������������������!!");form1.cs.focus();return;}
if(form1.phone.value=="")
{alert("������칫�绰!!");form1.phone.focus();return;}
if(form1.phone1.value=="")
{alert("�������ƶ��绰!!");form1.phone1.focus();return;}
if(form1.email.value=="")
{alert("������E-mail!!");form1.email.focus();return;}
if(!checkemail(form1.email.value))
{alert("�����ַ��ʽ����ȷ������������!!");form1.email.focus();return;}
if(form1.postcode.value=="")
{alert("���������������!!");form1.postcode.focus();return;}
if(isNaN(form1.postcode.value))
{alert("��������ű���Ϊ����!!");form1.postcode.focus();return;}
if(form1.family.value=="")
{alert("�������ͥ�绰!!");form1.family.focus();return;}
if(form1.address.value=="")
{alert("�������ͥסַ!!");form1.address.focus();return;}
form1.submit();
}
</script>
</head>
<body>
  <form name="form1" method="post" action="updateurl.jsp">
    <script language="javascript">
	function loadCalendar(field)
	{
   var rtn = window.showModalDialog("calender.jsp","","dialogWidth:280px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
}
</script>
<%
   String strid = request.getParameter("ID");                            //���ҳ�����
   List listTong = HibernateUtil.findTonId(Integer.parseInt(strid));     //����������ѯ�����������Ķ����������
   if(!listTong.isEmpty() && listTong.size()>0){
	 for(int i=0 ;i<listTong.size();i++){   
       TongXunAdd tx = (TongXunAdd)listTong.get(i);                      //����TongXunAdd����
       session.setAttribute("TXA",tx);
%>
<table width="429" height="419" border="0" align="center" cellspacing="1" bgcolor="#E9ECDB">
    <tr>
      <td height="15" colspan="3"><div align="center" class="STYLE2">�޸�ͨѶ��ϸ��Ϣ</div></td>
    </tr>
    <tr>
      <td width="85" bgcolor="#FFFFFF"><div align="right">��&nbsp;&nbsp;&nbsp;&nbsp;����</div></td>
      <td colspan="2" bgcolor="#FFFFFF"><input name="name11" type="text" class="unnamed1" id="name11" value="<%=tx.getName11()%>"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">�������ڣ�</div></td>
      <td width="182" bgcolor="#FFFFFF"><input name="birthday" type="text" class="unnamed1" id="birthday" value="<%=tx.getBirthday()%>"></td>
      <td width="152" bgcolor="#FFFFFF"><img src="../Images/date.gif" width="20" height="20" onClick="loadCalendar(form1.birthday)"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">��&nbsp;&nbsp;&nbsp;&nbsp;��</div></td>
        
      <td colspan="2" bgcolor="#FFFFFF"><select name="sex" id="sex">
       <%
               String strSex = tx.getSex();
                String[] sex={"��","Ů"};
                 for(int k=0;k<sex.length;k++){
        	 if(strSex.equalsIgnoreCase(sex[k]))
        		{out.println("<option value='"+sex[k]+"' selected='selected'>"+sex[k]+"</option>");}
        	 else
            	{out.println("<option value='"+sex[k]+"'>"+sex[k]+"</option>");}
        }
        %>
	 
      </select>      </td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">����״����</div></td>
      <td colspan="2" bgcolor="#FFFFFF">
	  <select name="hy" id="hy">
	      <%
              String strhy = tx.getHy();            //������Ҫ�޸��˵Ļ���״����ͬ���ַ�����
              String[] hy={"�ѻ�","δ��"};            //���������б�Ҫ��ʾ������
              for(int k=0;k<hy.length;k++){
        	  if(strhy.equalsIgnoreCase(hy[k])){     //�ж������ڵ���Ϣ��Ҫ�޸��˵���Ϣ�Ƿ���ͬ
        		out.println("<option value='"+hy[k]+"' selected='selected'>"+hy[k]+"</option>");}  //������������ʾ��������Ϣ
        	    else
            	{
        	    out.println("<option value='"+hy[k]+"'>"+hy[k]+"</option>");}  //���������������������Ϣ��ӵ������б����
                }
            %>
   </select>	  </td>
    </tr>
   <tr>
      <td bgcolor="#FFFFFF"><div align="right">�������ţ�</div></td>
      <td colspan="2" bgcolor="#FFFFFF"><input name="department" type="text" class="unnamed1" id="department" value="<%=tx.getDepartment()%>"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">ְ&nbsp;&nbsp;&nbsp;&nbsp;��</div></td>
      <td colspan="2" bgcolor="#FFFFFF"><input name="zw" type="text" class="unnamed1" id="zw" value="<%=tx.getZw()%>"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">����ʡ�ݣ�</div></td>
      <td colspan="2" bgcolor="#FFFFFF"><input name="sf" type="text" class="unnamed1" id="sf" value="<%=tx.getCf()%>"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">���ڳ��У�</div></td>
      <td colspan="2" bgcolor="#FFFFFF"><input name="cs" type="text" class="unnamed1" id="cs" value="<%=tx.getCs()%>"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">�칫�绰��</div></td>
      <td colspan="2" bgcolor="#FFFFFF"><input name="phone1" type="text" class="unnamed1" id="phone1" value="<%=tx.getPhone1()%>"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">�ƶ��绰��</div></td>
      <td colspan="2" bgcolor="#FFFFFF"><input name="phone" type="text" class="unnamed1" id="phone" value="<%=tx.getPhone()%>"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">��ͥ��ַ��</div></td>
      <td colspan="2" bgcolor="#FFFFFF"><input name="address" type="text" class="unnamed1" id="address" value="<%=tx.getAddress()%>"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">OICQ��</div></td>
      <td colspan="2" bgcolor="#FFFFFF"><input name="OICQ" type="text" class="unnamed1" id="OICQ" value="<%=tx.getOICQ()%>"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">email��</div></td>
      <td colspan="2" bgcolor="#FFFFFF"><input name="email" type="text" class="unnamed1" id="email" value="<%=tx.getEmail()%>"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">��ͥ�绰��</div></td>
      <td colspan="2" bgcolor="#FFFFFF"><input name="family" type="text" class="unnamed1" id="family" value="<%=tx.getFamily()%>"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">�������룺</div></td>
      <td colspan="2" bgcolor="#FFFFFF"><input name="postcode" type="text" class="unnamed1" id="postcode" value="<%=tx.getPostcode()%>"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</div></td>
      <td colspan="2" bgcolor="#FFFFFF"><textarea name="remark" cols="30" rows="4" id="remark"><%=tx.getRemark()%>
 
  </textarea></td>
   
    </tr>
    <tr bgcolor="#F3F3F3">
      <td colspan="3"><div align="center">
        <input name="Submit" type="submit" class="btn_grey" onClick="Mycheck();" value="�ύ">
        &nbsp;&nbsp;
        <input name="Submit2" type="reset" class="btn_grey" value="����">
        &nbsp;&nbsp;
 <input name="Submit3" type="button" class="btn_grey" onClick="JScript:window.close();" value="�ر�">
</div></td>
    </tr>
  </table>
  <%}} %>
  <p>&nbsp;</p>
</form>
</body>




