<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*,java.util.*"%>
<script language="javascript">
	function clockon(){
	var date=new Date();
	var YY=date.getYear();
	var MM=date.getMonth()+1;
	var DD=date.getDate();
	var KK=date.getDay();
	var HH=date.getHours();
	var mm=date.getMinutes();
	var SS=date.getSeconds();
	if (MM<10) MM="0"+MM;
	if (DD<10) DD="0"+DD;
	if (HH<10) HH="0"+HH;
	if (mm<10) mm="0"+mm;
	if (SS<10) SS="0"+SS;
	switch (KK){
		case 1:
			KK="����һ";
			break;
		case 2:
			KK="���ڶ�";
			break;
		case 3:
			KK="������";
			break;
		case 4:
			KK="������";
			break;
		case 5:
			KK="������";
			break;
		case 6:
			KK="������";
			break;
		case 0:
			KK="������";
			break;
	}
	var str_date=" ϵͳ���棺"+YY+"��"+MM+"��"+DD+"�� "+KK+" "+HH+":"+mm+":"+SS;
	if(document.all){
	div_date.innerHTML=str_date;
	}
	var timer=setTimeout("clockon()",200);
       }
</script>
<html>
  <title>
  </title>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <link href="CSS/style.css" rel="stylesheet" type="text/css">
  <body onload="clockon()">
<table width="777" height="47"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr align="center" valign="middle">
    <td width="290" align="left"><div id="div_date"></div></td>
  </tr>
</table>
  </body>
</html>



















