<%@ page contentType="text/html; charset=GBK" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="com.core.ParamUtils" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("Pragma","no-cache");
%>
<html>
<head>
<title>user_reg</title>
</head>
<link href="css/css.css" rel="stylesheet" type="text/css">
<script src="js/validate.js"></script>
<body bgcolor="#ffffff" onLoad="clockon(bgclock)">
<table width="780" border="0" cellspacing="0" cellpadding="0" class="tableBorder6"> 
  <tr> 
    <td height="165"><jsp:include page="top.jsp"/></td> 
  </tr> 
  <tr><td height="9"></td></tr>
  <tr> 
    <td><form method="post" action="user_modify.jsp" name="formr">  
            <table width="97%" border="0" align="center" cellpadding="0" cellspacing="1" class="tableNew" style="padding-left:5px;"> 
              <tr align="center"> 
                <td height="30" colspan="3" class="TableTitle1">�û�ע��</td> 
              </tr> 
              <tr style="padding:5px;"> 
                <td width="94" height="27" bgcolor="#FFFFFF">�û���</td> 
                <td width="420" bgcolor="#FFFFFF"><input type="text" name="uid"> 
                <span class="Redfont">*</span></td> 
                <td width="258" rowspan="13" valign="top" bgcolor="#FFFFFF" class="Redfont">ע�⣺ 
                  <ul>
                     һ����*��Ϊ�����
                  </ul> 
                  <ul>
                     �����û���ֻ��������ĸ���»��ߺ�������ɡ��������ַ�����Ϊ���֣�����ֻ����������ɡ�
                  </ul> 
                  <ul>
                     ����Email������д��ȷ��ʽ��<br> 
                    �磺mingrisoft@mingrisoft.com
                  </ul> 
                  <ul>
                     �ġ�����ͷ���е�ͼƬ����ѡ����Ҫ��ͷ��
��                  
                </ul></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="13">����</td> 
                <td><input type="password" name="password"> 
                <span class="Redfont">*</span></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="13">����ȷ��</td> 
                <td><input type="password" name="repassword"> 
                <span class="Redfont">*</span></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">��ʵ����</td> 
                <td><input type="text" name="name"> 
                <span class="Redfont">*</span></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">ȡ��������ʾ</td> 
                <td><input type="text" name="regqu"> 
                <span class="Redfont">*</span></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">ȡ������ش�</td> 
                <td><input type="text" name="reganswer"> 
                <span class="Redfont">*</span></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">�Ա�</td> 
                <td><input name="sex" type="radio" class="noborder" value="1" checked> 
                  ��
                  <input name="sex" type="radio" class="noborder" value="0"> 
                Ů</td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">����</td> 
                <td><input type="text" name="age" onBlur="ages()"> 
                <span class="Redfont">*</span></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">�绰</td> 
                <td><input type="text" name="tel"></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">Email</td> 
                <td><input name="email" type="text" size="50"> 
                <span class="Redfont">*</span></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">QQ</td> 
                <td><input type="text" name="qq"></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">���˵�ַ</td> 
                <td><input name="address" type="text" size="50"></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="27">������ҳ</td> 
                <td><input type="text" name="http"></td> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="22">���˼��</td> 
                <td colspan="2"><textarea name="resume" cols="50" rows="5"></textarea> </td> 
                <input type="hidden" name="action" value="reg"> 
              </tr> 
              <tr bgcolor="#FFFFFF"> 
                <td height="50">ͷ��</td> 
                <td colspan="2"><a onClick="javascript:window.open('head.jsp','Menuhead','location=no,scrollbars=no,menubars=no,toolbars=no,resizable=yes,left=200,top=200,width=700,height=400');" class="delink"> <img src="images/ico/select.gif"  name="ico" width=64 height=64 ></a>
                <input type="hidden" name="iid" ></td> 
              </tr> 
              <tr align="center" bgcolor="#FFFFFF"> 
                <td height="22" colspan="3"> <input name="Submit" type="submit" class="btn_grey" onClick="return reg()" value="ע��"> 
&nbsp;&nbsp; 
                <input name="Submit2" type="reset" class="btn_grey" value="����"></td> 
              </tr> 
        </table> 
      </form></td> 
  </tr> 
  <tr> 
    <td align="center"><jsp:include page="bottom.jsp"/></td> 
  </tr> 
</table> 
</body>
</html>
