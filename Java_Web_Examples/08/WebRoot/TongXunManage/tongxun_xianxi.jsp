<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*;"/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<head>
	<html:base />
	<title>�����ϸ��Ϣҳ��</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
if(form1.department.value=="")
{alert("������������������!!");form1.department.focus();return;}
if(form1.zw.value=="")
{alert("����������ְλ!!");form1.zw.focus();return;}
if(form1.sf.value=="")
{alert("����������ʡ������!!");form1.sf.focus();return;}
if(form1.cs.value=="")
{alert("������������������!!");form1.cs.focus();return;}

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
<script language="javascript">
	function loadCalendar(field)
	{
   var rtn = window.showModalDialog("calender.jsp","","dialogWidth:280px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
     }
</script>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
          <%
               String strpurview = (String)application.getAttribute("Purview");
                   if(strpurview.equalsIgnoreCase("ֻ��")){                               //����û�Ȩ��Ϊֻ����ת��tongxun_nomodify.jsp��ʾ�û���Ȩ���޸ĺ�ɾ������
           %>
               <script language="javascript">
	                 alert("�Բ�����û�����ͨѶ��ϢȨ��!!");
	            </script> 
           <%}else{ %>
<body background="../Images/main_center.jpg">
 <table width="801" border="0" background="../Images/main_top.JPG">
          <tr>
           <td width="25" height="38"></td>
            <td width="518" valign="bottom"><span class="style6">����ͨѶ��Ϣ</span></td>
          </tr>
        </table>
    <form name="form1" action="tongxun_xianxiadd.jsp" method="post">
	<table width="800" border="0" cellpadding="0" cellspacing="0">
              

              <tr>
                <td width="160" valign="bottom"><div align="right" class="STYLE2">ѡ��ͨѶ��&nbsp;</div></td>
                <td width="572" valign="bottom">
				<select name="name1" id="ID">
				<%
				  List listTongxun = HibernateUtil.findT();                //���ò���ͨѶ�鷽��
				  if(!listTongxun.isEmpty() && listTongxun.size()>0){
					  for(int i=0;i<listTongxun.size();i++){
						  Tongxun tx =(Tongxun) listTongxun.get(i);        //����ͨѶ�����
				 %>
				<option value="<%=tx.getId()%>"><%=tx.getName1()%></option> <!-- ��ͨѶ������е�id�Լ�name��ӵ������б��� -->
                <%
				}}
				else{%>
				<script language=javascript>alert('�Բ��𣬻�û��ͨѶ��');</script> <!-- ���ͨѶ�������û����Ϣ������ʾ���Բ��𣬻�û��ͨѶ�飢 -->
				 <% }
				%>
				</select>
				</td>
              </tr>
            </table>
              <table width="559" height="400" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
              <tr>
                <td height="28" colspan="4"><table width="100%" height="28" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="85" height="21"><div align="center" class="STYLE2">�ա�����</div></td>
                    <td width="168" class="STYLE1"><input name="name11" type="text" class="Sytle_text" id="name11" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.birthday.focus();}"></td>
                    <td width="62"><div align="center" class="STYLE2">��������</div></td>
                    <td width="168"><input name="birthday" type="text" id="c" readonly="yes" class="Sytle_text"></td>
                    <td width="96"><div align="left"><img src="../Images/date.gif" width="20" height="20" onClick="loadCalendar(form1.birthday)"></div></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td width="84" class="STYLE2"><div align="center">�ԡ�����</div></td>
                <td width="169"><select name="sex" id="sex">
                  <option>��ѡ���Ա�</option>
				  <option value="��">��</option>
                  <option value="Ů">Ů</option>
                </select>                </td>
                <td width="62" class="STYLE2"><div align="center">����״��</div></td>
                <td width="264"><select name="hy" id="hy">
                   <option>��ѡ�����״��</option>
				  <option value="�ѻ�">�ѻ�</option>
                  <option value="δ��">δ��</option>
                </select>                </td>
              </tr>
              
              <tr>
                <td class="STYLE2"><div align="center">��������</div></td>
                <td><input name="department" type="text" id="department" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.zw.focus();}"></td>
                <td class="STYLE2"><div align="center">ְ������</div></td>
                <td><input name="zw" type="text" id="zw" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.sf.focus();}"></td>
              </tr>
              <tr>
                <td class="STYLE2"><div align="center">����ʡ��</div></td>
                <td><input name="sf" type="text" id="sf" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.cs.focus();}"></td>
                <td class="STYLE2"><div align="center">���ڳ���</div></td>
                <td><input name="cs" type="text" id="cs" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.phone.focus();}"></td>
              </tr>
              <tr>
                <td class="STYLE2"><div align="center">�칫�绰</div></td>
                <td><input name="phone" type="text" id="phone" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.phone1.focus();}"></td>
                <td class="STYLE2"><div align="center">�ƶ��绰</div></td>
                <td><input name="phone1" type="text" id="phone1" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.email.focus();}"></td>
              </tr>
              <tr>
                <td><div align="center" class="STYLE2">��������</div></td>
                <td><input name="email" type="text" id="email" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.postcode.focus();}"></td>
                <td><div align="center" class="STYLE2">��������</div></td>
                <td><input name="postcode" type="text" id="postcode" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.OICQ.focus();}"></td>
              </tr>
              <tr>
                <td height="27" class="STYLE2"><div align="center">OICQ</div></td>
                <td><input name="OICQ" type="text" id="OICQ" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.family.focus();}"></td>
                <td class="STYLE2"><div align="center">��ͥ�绰</div></td>
                <td><input name="family" type="text" id="family" class="Sytle_text" onKeyDown="if(event.keyCode==13){form1.address.focus();}"></td>
              </tr>
              <tr>
                <td height="26"><div align="center" class="STYLE2">��ͥסַ</div></td>
                <td colspan="3"><input name="address" type="text" class="Sytle_text" id="address" size="53" onKeyDown="if(event.keyCode==13){form1.remark.focus();}"></td>
                </tr>
              <tr>
                <td height="76"><div align="center" class="STYLE2">������ע</div></td>
                <td colspan="3"><textarea name="remark" cols="45" rows="5" class="textarea" id="remark" ></textarea></td>
              </tr>
              <tr>
                <td height="39" colspan="4" valign="top"><table width="194" height="28" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td><a href="#">
                    <input name="Button" type="button" class="btn_grey" value="�ύ" onClick="Mycheck()">
                    <input name="Submit2" type="reset" class="btn_grey" value="����"></td>
                  </tr>
                </table></td>
              </tr>
            </table>
   
        </form>
	<%}%>
	</td>
  </tr>
</table>
</body>




