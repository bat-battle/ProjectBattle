<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
ResultSet rs=connDB.executeQuery("select * from tb_Member where username='"+session.getAttribute("UserName")+"'");
if(rs.next()){
	String username=rs.getString("UserName");
	String truename=rs.getString("TrueName");
	String PWD=rs.getString("password");
	String cardNO=rs.getString("cardNO");
	String CardType=rs.getString("CardType");
	String tel=rs.getString("tel");
	String city=rs.getString("city");
	String address=rs.getString("address");
	String postcode=rs.getString("postcode");
	String Email=rs.getString("Email");
%>
<html>
<head>
<title>�������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<script src="JS/check.jsp"></script>
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" background="Images/bg.gif">
  <tr>
    <td>
<table width="777" height="768"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td valign="top">
	<jsp:include page="Top.jsp"/>
	<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="tableBorder_LTR">
      <tr>
        <td height="30" align="center" bgcolor="#eeeeee">�ԡԡ� ��Ա�����޸� �ԡԡ�</td>
      </tr>
    </table>
	<table width="100%" height="330"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LBR">
        <tr>
          <td width="26%" valign="top"><table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="55%" height="82" align="center" class="word_grey">&nbsp;<img src="Images/reg.gif" width="84" height="54"></td>
              <td width="45%" align="left" class="word_grey">�����޸�</td>
            </tr>
            <tr>
              <td height="112" colspan="2" valign="top" class="word_grey"><ul>
                  <li> �û�����Ϊ�û����ж�����ѯ��ͨ��֤�ţ������޸ģ���ʹ��Ӣ����ĸ�����ֻ�Ӣ����ĸ�����֡��»��ߵ���ϣ����ȿ�����3-20���ַ�֮�ڡ�</li>
                  <li>��ʵ������ ��������ʵ���������Ա�������������ϵ������Ϊ������û����Է������롣</li>
                  <li>���룺���趨��6-20λ֮�䣬�û����뼰ȷ���������һ�¡�</li>
                  <li>֤�����룺��������ȷ��֤�����롣</li>
                  <li>Email������д��Ч��Email��ַ���Ա���������ϵ��</li>
                  </ul></td>
            </tr>
            <tr align="center">
              <td colspan="2" valign="middle" class="word_grey"></td>
            </tr>
          </table></td>
          <td width="5" valign="top" background="Images/Cen_separate.gif"></td>
          <td width="73%" valign="top"><table width="100%" height="56"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">&nbsp;</td>
            </tr>
            <tr>
              <td align="center">
			  <form action="usermodify_deal.jsp" method="post" name="myform">
			  <table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
                <tr>
                  <td width="18%" height="30" align="center">�� �� ����</td>
                  <td width="82%" class="word_grey"><input name="UserName" type="text" id="UserName4" value="<%=username%>" maxlength="20" readonly="yes">
                    * </td>
                </tr>
                <tr>
                  <td height="28" align="center">��ʵ������</td>
                  <td height="28"><input name="TrueName" type="text" value="<%=truename%>" maxlength="10">
      *</td>
                </tr>
                <tr>
                  <td height="28" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�룺</td>
                  <td height="15"><input name="PWD1" type="password" size="20" maxlength="20">
      *
        <input name="oldPWD" type="hidden" id="oldPWD" value="<%=PWD%>"></td>
                </tr>
                <tr>
                  <td height="28" align="center">�� ��&nbsp;�룺</td>
                  <td height="15"><input name="PWD2" type="password" size="20" maxlength="20">
*</td>
                </tr>
                <tr>
                  <td height="28" align="center">ȷ�����룺</td>
                  <td height="28"><input name="PWD3" type="password" size="20" maxlength="20">
      * </td>
                </tr>
                <tr>
                  <td height="28" align="center">֤�����</td>
                  <td><input name="CardType" type="radio" class="noborder" value="���֤"<%if(CardType.equals("���֤")){%> checked<%}%>>
				  ���֤&nbsp;
      <input name="CardType" type="radio" class="noborder" value="����֤"<%if(CardType.equals("����֤")){%> checked<%}%>>
      ����֤ 
      <input name="CardType" type="radio" class="noborder" value="ѧ��֤"<%if(CardType.equals("ѧ��֤")){%> checked<%}%>>
ѧ��֤</td>
                </tr>
                <tr>
                  <td height="28" align="center">֤�����룺</td>
                  <td class="word_grey"><input name="cardNO" type="text" id="Tel" value="<%=cardNO%>">
      *</td>
                </tr>
                <tr>
                  <td height="28" align="center">��ϵ�绰��</td>
                  <td><input name="tel" type="text" id="Tel" value="<%=tel%>"></td>
                </tr>
                <tr>
                  <td height="28" align="center">���ڳ��У�</td>
                  <td><input name="city" type="text" id="city" value="<%=city%>"></td>
                </tr>
                <tr>
                  <td height="28" align="center" style="padding-left:10px">Email��</td>
                  <td class="word_grey"><input name="Email" type="text" id="PWD224" value="<%=Email%>" size="50">
      *</td>
                </tr>
                <tr>
                  <td height="28" align="center">�������룺</td>
                  <td class="word_grey"><input name="postcode" type="text" id="postcode" value="<%=postcode%>" size="20"></td>
                </tr>
                <tr>
                  <td height="28" align="center">��ϵ��ַ��</td>
                  <td class="word_grey"><input name="address" type="text" id="address" value="<%=address%>" size="50"></td>
                </tr>
                <tr>
                  <td height="34">&nbsp;</td>
                  <td class="word_grey"><input name="Button" type="button" class="btn_grey" value="ȷ������" onClick="check_m()">
                      <input name="Submit2" type="reset" class="btn_grey" value="������д">
                      <input name="Submit22" type="button" class="btn_grey" value="����" onClick="window.location.href='index.jsp'"> </td>
                </tr>
              </table>
			  </form>
			  </td>
            </tr>
          </table></td>
        </tr>
      </table>
      <jsp:include page="copyright.jsp"/>
    </td>
  </tr>
</table>
</td>
  </tr>
</table>
</body>
</html>
<%}else{
	out.println("<script language='javascript'>alert('���Ĳ�������!');window.location.href='index.jsp';</script>");
}%>