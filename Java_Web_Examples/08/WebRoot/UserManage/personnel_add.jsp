<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<head>
	<html:base />
	<title>����Ա��ҳ��</title>
  <link rel="stylesheet" type="text/css" href="CSS/style.css">
    <script language="javascript">
function Mycheck()
{
if (form1.username.value=="")
{ alert("������Ա��������");form1.username.focus();return;}
if(form1.name.value=="")
{alert("����������??");form1.name.focus();return;}
if (form1.PWD.value=="")
{ alert("���������룡");form1.PWD.focus();return;}
if (form1.tel.value=="")
{ alert("������Ա������ϵ�绰��");form1.tel.focus();return;}
if(form1.email.value=="")
{alert("������E-mail��ַ??");form1.email.focus();return;}
if(form1.email.value!="" && (form1.email.value.indexOf('@',0)==-1|| form1.email.value.indexOf('.',0)==-1))
{alert("�������E-mail��ַ���ԣ�");form1.email.focus();return;}
if (form1.address.value=="")
{ alert("������Ա����סַ��");form1.address.focus();return;}
form1.submit();
}
</script>
	<link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
	
<%
                    String purview = (String)application.getAttribute("Purview");
                       if(!purview.equalsIgnoreCase("ϵͳ")){
                  %>
                   <script language="javascript">
	                      alert("�Բ�����û�����Ա����Ϣ��Ȩ��!!");
	                </script>  
	               <%} %>
	               <%if(purview.equalsIgnoreCase("ϵͳ")){ %>
<body background="../Images/main_center.jpg">
 <table width="801" border="0" background="../Images/main_top.JPG">
          <tr>
           <td width="25" height="38"></td>
            <td width="518" valign="bottom"><span class="style6"><b>Ա�����</b></span></td>
          </tr>
        </table>
      <form ACTION="personnel_add2.jsp" METHOD="POST" name="form1"><br><br>
        <table width="100%" height="177"  border="0"  cellpadding="-2" cellspacing="-2" align="center">
		  <tr>
            <td width="13%" height="27">
              <div align="center" class="STYLE8">�û�����</div></td><td width="28%"><input name="username" type="text" class="Sytle_text" id="username"></td>
            <td width="14%"><div align="center" class="STYLE8">���ţ�</div></td>
            <td><select name="branch" id="select4">
              <option value="���²�">���²�</option>
              <option value="���۲�">���۲�</option>
              <option value="�߻���">�߻���</option>
              <option value="��沿">��沿</option>
              <option value="�ۺ����">�ۺ����</option>
             
            </select></td>
          </tr>
		��<tr>
            <td><div align="center" class="STYLE8">Ա��������</div></td>
            <td><input name="name" type="text" class="Sytle_text" id="name"></td>
            <td><div align="center" class="STYLE8">�Ա�</div></td>
            <td><select name="sex" id="sex">
              <option value="��" selected>��</option>
              <option value="Ů">Ů</option>
            </select></td>
            </tr>
          <tr>
            <td height="27" valign="top">
              <div align="center" class="STYLE8">���룺</div></td>
            <td><input name="PWD" type="password" class="Sytle_text" id="PWD2"></td>
            <td><div align="center" class="STYLE8">ְ��</div></td>
            <td><select name="job" id="job">
              <option value="�ܾ���" selected>�ܾ���</option>
              <option value="���ž���">���ž���</option>
              <option value="������Դ����">������Դ����</option>
              <option value="����">����</option>
              <option value="��������">��������</option>
              <option value="��ͨԱ��">��ͨԱ��</option>
              <option value="����Ա">����Ա</option>
            </select></td>
          </tr>
          <tr>
            <td height="27" valign="top">
              <div align="center" class="STYLE8">�绰��</div></td>
            <td><input name="tel" type="text" class="Sytle_text" id="tel3"></td>
            <td><div align="center" class="STYLE8">Ȩ�ޣ�</div></td>
            <td width="45%"><select name="purview" id="select">
              <option value="ϵͳ" selected>ϵͳ</option>
              <option value="ֻ��">ֻ��</option>
            </select></td>
          </tr>
          <tr>
            <td height="27" valign="top"><div align="center" class="STYLE8" >E-mail��</div></td>
            <td colspan="3"><input name="email" type="text" class="Sytle_text" id="email"></td>
          </tr>
          <tr>
            <td height="27" valign="top"><div align="center" class="STYLE8">��ַ��</div></td>
            <td colspan="3"><input name="address" type="text" class="Sytle_text" id="address"></td>
          </tr>
          <tr>
            <td colspan="4"><div align="center">
                <input name="Button" type="button" class="btn_grey" value="�ύ" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="btn_grey" value="����">                
                </div></td>
                <%} %>
          </tr>
        </table>
      </form>

</table>
&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>




