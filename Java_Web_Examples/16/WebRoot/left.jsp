<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("gb2312"); %>
<html>
  <head>
    <title>��ҵ�����浼����</title>
    <meta content="text/html; charset=gb2312" http-equiv="Content-Type" />
    <link href="CSS/style.css" rel="stylesheet" type="text/css">
	</head>
  <body>
<script language="JavaScript">
  function show_div(menu){
    if(document.all.item(menu).style.display=="none"){
      document.all.item(menu).style.display="block";
      }else{
        document.all.item(menu).style.display="none";
        }
    }
</script>
<a href="#" onClick="show_div('menu1')" ><img src="images/left_top.GIF" width="186" height="29"></a>
<table width="186" height="331" border="0" cellpadding="0" cellspacing="0" class="tableBorder_bold">
  <tr>
    <td height="323" align="center" valign="top">
	<!--������Ϣ����-->
	<a href="#" onClick="show_div('menu1')" ><img name="Imgmenu1" border="0"
     src="images/menu_1.JPG" align="ABSMIDDLE" width="165" height="26"></a>
	<Div id="menu1">
  <table width="165" border="0" cellpadding="0" cellspacing="0" class="tableBorder">
   <tr><td width="18%" height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"></td>
       <td width="82%"><a href="jcxx/khinfo.html" target="mainFrame">�ͻ���Ϣ����</a></td>
  </tr>
  <tr><td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"></td>
      <td><a href="jcxx/spinfo1.jsp" target="mainFrame">��Ʒ��Ϣ����</a></td>
  </tr>
  <tr><td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"></td>
      <td><a href="jcxx/gysinfo.html" target="mainFrame">��Ӧ����Ϣ����</a></td>
  </tr>
  <tr><td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"></td>
      <td><a href="jcxx/spchat.jsp" target="mainFrame">��Ʒ��Ϣ��ѯ</a></td>
  </tr>
  <tr><td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"></td>
      <td><a href="jcxx/khchat.jsp" target="mainFrame">�ͻ���Ϣ��ѯ</a></td>
  </tr>
  <tr><td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"></td>
      <td><a href="jcxx/gyschat.jsp" target="mainFrame">��Ӧ����Ϣ��ѯ</a></td>
  </tr>
 </table>
</Div>
<!--������-->
<a href="#" onClick="show_div('menu3')"><img name="Imgmenu3" align="ABSMIDDLE"
    src="images/menu_3.JPG" border="0" width="165" height="28"></a><br>
<Div id="menu3" style="display:none">
<table width="165" border="0" cellpadding="0" cellspacing="0" class="tableBorder">
<tr>
<td width="18%" height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"></td>
<td width="82%"> <a href="./kcgl/sprk.jsp" target="mainFrame">��Ʒ���</a></td>
</tr>
<tr>
  <td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"> </td>
  <td> <a href="./kcgl/sprkth.jsp" target="mainFrame">��Ʒ����˻�</a></td>
</tr>
<tr>
  <td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"> </td>
  <td> <a href="./kcgl/kcchat.jsp" target="mainFrame">����ѯ</a></td>
</tr>
<tr>
  <td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"></td>
  <td><a href="./kcgl/modifyPrice1.jsp" target="mainFrame">�۸����</a> </td>
</tr>
</table>
</Div>
<!--���۹���-->
<a href="#" onClick="show_div('menu4')"><img name="Imgmenu4" align="ABSMIDDLE"
    src="images/menu_4.JPG" border="0" width="165" height="28"></a><br>
<Div id="menu4" style="display:none">
<table width="165" border="0" cellpadding="0" cellspacing="0" class="tableBorder">
<tr>
<td width="18%" height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"></td>
<td width="82%"><a href="./spxs/spxs.jsp" target="mainFrame">��Ʒ����</a></td>
<tr>
<td width="18%" height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"></td>
<td><a href="./spxs/spxsth.jsp" target="mainFrame">�����˻�</a></td>
</tr></table>
</Div>

<a href="#" onClick="show_div('menu5')"><img name="Imgmenu5" align="ABSMIDDLE"
    src="images/menu_5.JPG" border="0" width="165" height="28"></a><br>
<Div id="menu5" style="display:none">
<table width="165" border="0" cellpadding="0" cellspacing="0" class="tableBorder">
<tr>
<td width="18%" height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"><br>
  <br></td>
<td width="82%"><a href="./cxtj/xsxxchat.jsp" target="mainFrame">������Ϣ��ѯ</a></td>
</tr>
<tr>
  <td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"></td>
  <td><a href="./cxtj/sprkchat.jsp" target="mainFrame">��Ʒ����ѯ</a></td>
</tr>
<tr>
  <td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"></td>
  <td><a href="./cxtj/spxsphchat.jsp" target="mainFrame">��Ʒ��������</a></td>
</tr>
<tr>
  <td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"></td>
  <td><a href="./cxtj/spyearchat.jsp" target="mainFrame">�����۶����</a></td>
</tr>
</table>
</Div>

<a href="#" onClick="show_div('menu6')"><img name="Imgmenu6" align="ABSMIDDLE"
    src="images/menu_6.JPG" border="0" width="165" height="28"></a><br>
  <Div id="menu6" style="display:none">
  <table width="165" border="0" cellpadding="0" cellspacing="0" class="tableBorder">
  <tr><td width="18%" height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7">
  </td>
    <td width="82%"><a href="./wlgl/spxsjz/spxsjzchat.jsp" target="mainFrame">��Ʒ���۽���</a></td>
  </tr>
  <tr>
    <td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"> </td>
    <td><a href="./wlgl/rkthjz/rkthjzchat.jsp" target="mainFrame">����˻�����</a></td>
  </tr>
  <tr>
    <td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"> </td>
    <td><a href="./wlgl/xsjzquest/xsjzchat.jsp" target="mainFrame">���۽��˲�ѯ</a></td>
  </tr>
  <tr>
    <td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"> </td>
    <td><a href="./wlgl/sprkjz/sprkjzchat.jsp" target="mainFrame">��Ʒ������</a></td>
  </tr>
  <tr>
    <td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"> </td>
    <td><a href="./wlgl/xsthjz/xsthjzchat.jsp" target="mainFrame">�����˻�����</a></td>
  </tr>
  <tr>
    <td height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"> </td>
    <td><a href="./wlgl/rkjzquest/rkjzchat.jsp" target="mainFrame">�����˲�ѯ</a></td>
  </tr>
  </table>
  </Div>

<a href="#" onClick="show_div('menu7')"><img name="Imgmenu7" align="ABSMIDDLE"
    src="images/menu_7.JPG" border="0" width="165" height="28"></a><br>
<Div id="menu7" style="display:none">
<table width="165" border="0" cellpadding="0" cellspacing="0" class="tableBorder">
 <tr>
 <td width="18%" height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"></td>
 <td width="82%"><a href="./xtsz/addUser.jsp" target="mainFrame">����Ա����</a></td>
 </tr>
  <tr>
 <td width="18%" height="24" align="center">&nbsp;<img src="images/subMenu_ico.GIF" width="4" height="7"></td>
 <td width="82%"><a href="./xtsz/usermanager.jsp" target="mainFrame">���������޸�</a></td>
 </tr>
</table>
</Div>
	</td>
  </tr>
</table>





</body>
</html>












