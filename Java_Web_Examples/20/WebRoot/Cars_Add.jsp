<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title><%if(request.getParameter("id")==null){%>�� �� �� �� �� ��<%}else{%>�� �� �� �� �� ��<%}%></title>
</head>
<link rel="stylesheet" href="Css/style.css">
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
<script src="Js/HiddenTable.js"></script>
<%!
String sql;
ResultSet rs;
int logo;
int typenumber;
int sum;
ResultSetMetaData rsmd;
%>
<%
if(request.getParameter("type")!=null){
logo=Integer.parseInt(request.getParameter("id"));
typenumber=Integer.parseInt(request.getParameter("type"));
rs=cross.getrs(typenumber,logo);
}
else{
rs=null;
}
%>
</script>
<SCRIPT>
function ShowTR(objTr,objImg){

	if(objTr.style.display == ""){
		objTr.style.display = "none";
		objImg.src="Image/jia.gif";
	}
	else
	{
		hiddenall(objTr);
		objTr.style.display = "";
		objImg.src="Image/jian.gif";
	}
}
</SCRIPT>
<script language="javascript">
function change(){
 var str=type.selects.value;
 switch(str){
 	case "���ó�":
		location.href="Cars_Add_S.jsp";
		break;
	case "���ó�":
		location.href="Cars_Add.jsp";
		break;}
	}
</script>
<script language="javascript">
	function checks(){
		var names=orderform.Ʒ��.value;
		var type=orderform.�ͺ�.value;
		var people=orderform.������Ⱥ.value;
		var price=orderform.�ۼ�.value;
		if(names==""){
			alert("����д������Ʒ��");
		}
		else if(type==""){
			alert("����д�������ͺ�");
		}
		else if(people==""){
			alert("����д�������õ���Ⱥ");
		}
		else if(price==""){
			alert("����д�����Ĳο��۸�");
		}
		else if(isNaN(parseInt(price))){
			alert("����ʵ��д�����Ĳο��۸�");
		}
		else{
			orderform.submit();
		}
	}
</script>
<body leftmargin="0" topmargin="0">
<table width="500" height="560" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#efefef" class="table">
  <tr>
    <td valign="top"><table width="480" height="560" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="480" height="40" align="center">
		<div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:150;"><%if(request.getParameter("id")==null){%>�� �� �� �� �� ��<%}else{%>�� �� �� �� �� ��<%}%></div></td>
        </tr>
      <tr>
        <td valign="top">
		<table width="480" height="480" border="0" cellpadding="0" cellspacing="0">
          <tr valign="bottom">
            <td height="20" valign="top">
			<table width="480" border="0" cellspacing="0" cellpadding="0">
              <tr>
				  <form name="type">
                <td height="20">
                  <div align="left">
			<%if(request.getParameter("type")==null){%>
                    <select name="selects" class="wenbenkuang" onchange="change()">
                          <option value="���ó�">���ó�</option>
                          <option value="���ó�" selected>���ó�</option>
                    </select>
<%}%>
                     </div></td></form>
                <td><div align="right"><a href="#">ȷ�ϵ�ǰ����ʱ���뽫������״������</a></div></td>
              </tr>
            </table>
              </td>
          </tr>
          <tr valign="bottom">
            <td height="430" valign="top">
			<form action="<%if(rs==null){out.write("test.jsp");}else{out.write("Car_Change.jsp");}%>" method="post" enctype="multipart/form-data" name="orderform">
			<table width="480" border="0" cellspacing="0" cellpadding="0" id="chengyongche">
              <tr>
                <td height="15" colspan="2"><input type="hidden" name="hiddenField" value="���ó�"><%if(rs!=null){%><input type="hidden" name="hiddenField" value="<%=logo%>"><%}%></td>
              </tr>
              <tr class="bottm">
                <td width="285" height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(jibenziliao,jpg1)"><img id="jpg1" src="Image/jia.gif" width="10" height="10" border="0"> �� �� �� ��</a></div></td>
                <td width="195"></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left">
                    <table width="480" border="0" cellspacing="0" cellpadding="0" id="jibenziliao">
                      <tr>
                        <td height="15">&nbsp;</td>
                        <td height="15">&nbsp;</td>
                        <td height="15">&nbsp;</td>
                        <td height="15">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="70" height="23"><div align="right">����Ʒ�ƣ�</div></td>
                        <td width="169" height="23"><input name="Ʒ��" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("Ʒ��"));}}%>"></td>
                        <td width="70" height="23"><div align="right">�����ͺţ�</div></td>
                        <td width="171" height="23"><input name="�ͺ�" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�ͺ�"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">������Ⱥ��</div></td>
                        <td height="23"><input name="������Ⱥ" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("������Ⱥ"));}}%>"></td>
                        <td height="23"><div align="right">�ο��۸�</div></td>
                        <td height="23"><input name="�ۼ�" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("�ۼ�"));}}%>">
              ����Ԫ��</td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">���ּ�飺</div></td>
                        <td height="23" colspan="3" rowspan="3"><div align="left">
                            <textarea name="���ּ��" cols="65" rows="4" class="wenbenkuang"><%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("���ּ��"));}}%></textarea>
                        </div></td>
                      </tr>
                      <tr>
                        <td height="23">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="23">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">ͼƬ��飺</div></td>
                        <td height="23" colspan="3"><input name="���ͼƬ" type="text" class="wenbenkuang" size="35" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("���ͼƬ"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">��ɫ��</div></td>
                        <td height="23"><input name="��ɫ" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("��ɫ"));}}%>"></td>
                        <td height="23">&nbsp;</td>
                        <td height="23"><div align="center"> </div></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">��ӦͼƬ��</div></td>
                        <td height="23" colspan="3"><input name="��ɫͼƬ" type="text" class="wenbenkuang" size="35" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("��ɫͼƬ"));}}%>">
                        </td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">��ۣ�</div></td>
                        <td height="23" colspan="3"><input name="���" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("���"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">��ӦͼƬ��</div></td>
                        <td height="23" colspan="3"><input name="���ͼƬ" type="text" class="wenbenkuang" size="35" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("���ͼƬ"));}}%>">
                        </td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">���Σ�</div></td>
                        <td height="23" colspan="3"><input name="����" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("����"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">��ӦͼƬ��</div></td>
                        <td height="23" colspan="3"><input name="����ͼƬ" type="text" class="wenbenkuang" size="35" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("����ͼƬ"));}}%>">
                        </td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">���ã�</div></td>
                        <td height="23" colspan="3"><input name="����" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("����"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">��ӦͼƬ��</div></td>
                        <td height="23" colspan="3"><input name="����ͼƬ" type="text" class="wenbenkuang" size="35" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("����ͼƬ"));}}%>">
                        </td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4" class="bottm">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4">&nbsp;</td>
                      </tr>
                    </table>
                    <script language="javascript">jibenziliao.style.display="none";</script>
                </div></td>
              </tr>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(jibencanshu,jpg2)"><img src="Image/jia.gif" id="jpg2" width="10" height="10" border="0"> �� �� �� ��</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left">
                    <table width="480" border="0" cellspacing="0" cellpadding="0" id="jibencanshu">
                      <tr>
                        <td height="15">&nbsp;</td>
                        <td height="15">&nbsp;</td>
                        <td height="15">&nbsp;</td>
                        <td height="15">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="70" height="23"><div align="right">��߳��٣�</div></td>
                        <td width="169" height="23"><input name="��߳���" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("��߳���"));}}%>"></td>
                        <td width="70" height="23"><div align="right">�ƶ����룺</div></td>
                        <td width="171" height="23"><input name="�ƶ�����" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("�ƶ�����"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">�����ͺģ�</div></td>
                        <td height="23"><input name="�����ͺ�" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("�����ͺ�"));}}%>"></td>
                        <td height="23"><div align="right">�����ͺģ�</div></td>
                        <td height="23"><input name="�����ͺ�" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("�����ͺ�"));}}%>">
                        </td>
                      </tr>
                      <tr>
                        <td height="23" colspan="4"><div align="right"></div>
                            <div align="left">
                              <table width="480" height="25" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td width="114"><div align="right">0-100KM����ʱ�䣺</div></td>
                                  <td width="366"><input name="0-100KM����ʱ��" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("0-100KM����ʱ��"));}}%>"></td>
                                </tr>
                              </table>
                          </div></td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4" class="bottm">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4">&nbsp;</td>
                      </tr>
                    </table>
                    <script language="javascript">jibencanshu.style.display="none";</script>
                </div></td>
              </tr>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(waixingcanshu,jpg3)"><img src="Image/jia.gif" id="jpg3" width="10" height="10" border="0"> �� �� �� ��</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left">
                    <table width="480" border="0" cellspacing="0" cellpadding="0" id="waixingcanshu">
                      <tr>
                        <td height="15">&nbsp;</td>
                        <td width="135" height="15">&nbsp;</td>
                        <td width="90" height="15">&nbsp;</td>
                        <td width="165" height="15">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="90" height="23"><div align="right">�����ߴ磺</div></td>
                        <td height="23" colspan="3"><input name="�����ߴ�" type="text" class="wenbenkuang" size="30" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("�����ߴ�"));}}%>">
              �� * �� * ��</td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">��С��ؼ�϶��</div></td>
                        <td height="23"><input name="��С��ؼ�϶" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("��С��ؼ�϶"));}}%>"></td>
                        <td height="23"><div align="right">��Сת��ֱ����</div></td>
                        <td height="23"><input name="��Сת��ֱ��" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("��Сת��ֱ��"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">�������أ�</div></td>
                        <td height="0"><div align="left">
                            <input name="��������" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("��������"));}}%>">
                        </div></td>
                        <td height="0"><div align="right">��������</div></td>
                        <td height="0"><input name="������" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("������"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">��λ����</div></td>
                        <td height="0"><input name="��λ��" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("��λ��"));}}%>"></td>
                        <td height="0"><div align="right">��ȫ���ң�</div></td>
                        <td height="0"><input name="��ȫ����" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("��ȫ����"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">�������ݻ���</div></td>
                        <td height="23"><input name="�������ݻ�" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("�������ݻ�"));}}%>"></td>
                        <td height="23"><div align="right">ȼ�����ݻ���</div></td>
                        <td height="23"><input name="ȼ�����ݻ�" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("ȼ�����ݻ�"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">����ϵ����</div></td>
                        <td height="23"><input name="����ϵ��" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("����ϵ��"));}}%>"></td>
                        <td height="23">&nbsp;</td>
                        <td height="23">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4" class="bottm">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4">&nbsp;</td>
                      </tr>
                    </table>
                    <script language="javascript">waixingcanshu.style.display="none";</script>
                </div></td>
              </tr>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(dipancanshu,jpg4)"><img src="Image/jia.gif" id="jpg4" width="10" height="10" border="0"> �� �� �� ��</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left">
                    <table width="480" border="0" cellspacing="0" cellpadding="0" id="dipancanshu">
                      <tr>
                        <td height="15">&nbsp;</td>
                        <td width="123" height="15">&nbsp;</td>
                        <td width="101" height="15">&nbsp;</td>
                        <td width="158" height="15">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="98" height="23"><div align="right">��������ʽ��</div></td>
                        <td height="23" colspan="3"><input name="��������ʽ" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("��������ʽ"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">��̥���ͼ����</div></td>
                        <td height="23" colspan="3"><input name="��̥���ͼ����" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("��̥���ͼ����"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">�ƶ�װ����ʽ��</div></td>
                        <td height="0" colspan="3"><input name="�ƶ�װ����ʽ" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("�ƶ�װ����ʽ"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">ת��ϵͳ��</div></td>
                        <td height="0" colspan="3"><input name="ת��ϵͳ" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("ת��ϵͳ"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">������ʽ��</div></td>
                        <td height="23" colspan="3"><input name="������ʽ" type="text" class="wenbenkuang" size="60" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("������ʽ"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4" class="bottm">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4">&nbsp;</td>
                      </tr>
                    </table>
                    <script language="javascript">dipancanshu.style.display="none";</script>
                </div></td>
              </tr>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(fadongjicanshu,jpg5)"><img src="Image/jia.gif" id="jpg5" width="10" height="10" border="0"> �� �� �� �� ��</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left">
                    <table width="480" border="0" cellspacing="0" cellpadding="0" id="fadongjicanshu">
                      <tr>
                        <td height="15">&nbsp;</td>
                        <td width="139" height="15">&nbsp;</td>
                        <td width="85" height="15">&nbsp;</td>
                        <td width="158" height="15">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="98" height="23"><div align="right">���������ƣ�</div></td>
                        <td height="23"><input name="����������" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("����������"));}}%>"></td>
                        <td height="23"><div align="right">������λ�ã�</div></td>
                        <td height="23"><input name="������λ��" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("������λ��"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">��������ʽ��</div></td>
                        <td height="23" colspan="3"><input name="��������ʽ" type="text" class="wenbenkuang" size="45" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("��������ʽ"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">��������</div></td>
                        <td height="0"><input name="������" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("������"));}}%>"></td>
                        <td height="0"><div align="right">������</div></td>
                        <td height="0"><input name="����" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("����"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">����ʣ�</div></td>
                        <td height="0"><input name="�����" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("�����"));}}%>"></td>
                        <td height="0"><div align="right">���Ť�أ�</div></td>
                        <td height="0"><input name="���Ť��" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("���Ť��"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="23"><div align="right">���ʽ��</div></td>
                        <td height="23"><input name="���ʽ" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("���ʽ"));}}%>"></td>
                        <td height="23"><div align="right">�����ͺţ�</div></td>
                        <td height="23"><input name="�����ͺ�" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("�����ͺ�"));}}%>"></td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4" class="bottm">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="15" colspan="4">&nbsp;</td>
                      </tr>
                    </table>
                    <script language="javascript">fadongjicanshu.style.display="none";</script>
                </div></td>
              </tr>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(qitacanshu,jpg6)"><img src="Image/jia.gif" id="jpg6" width="10" height="10" border="0"> �� �� �� ��</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left">
                    <table width="480" border="0" cellspacing="0" cellpadding="0" id="qitacanshu">
                      <tr>
                        <td width="480" height="15" class="bottm"><textarea name="��������" cols="77" rows="4" class="wenbenkuang"><%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("��������"));}}%></textarea></td>
                      </tr>
                      <tr>
                        <td height="15">&nbsp;</td>
                      </tr>
                    </table>
                    <script language="javascript">qitacanshu.style.display="none";</script>
                </div></td>
              </tr>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(qitashuoming,jpg7)"><img src="Image/jia.gif" id="jpg7" width="10" height="10" border="0"> �� �� ˵ ��</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left" id="qitashuoming">
                    <textarea name="����˵��" cols="77" rows="4" class="wenbenkuang"><%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("����˵��"));}}%></textarea>
                </div></td>
              </tr>
              <script language="javascript">qitashuoming.style.display="none";</script>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(biaozhunzhuangbei,jpg8)"><img src="Image/jia.gif" id="jpg8" width="10" height="10" border="0"> �� ׼ װ ��</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left" id="biaozhunzhuangbei">
                    <textarea name="��׼װ��" cols="77" rows="4" class="wenbenkuang"><%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("��׼װ��"));}}%></textarea>
                </div></td>
              </tr>
              <script language="javascript">biaozhunzhuangbei.style.display="none";</script>
              <tr>
                <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(xuanzhuangzhuangbei,jpg9)"><img src="Image/jia.gif" id="jpg9" width="10" height="10" border="0"> ѡ װ װ ��</a></div></td>
                <td height="20" class="bottm"><div align="center"></div></td>
              </tr>
              <tr>
                <td height="20" colspan="2"><div align="left" id="xuanzhuangzhuangbei">
                    <textarea name="ѡװװ��" cols="77" rows="4" class="wenbenkuang"><%if(rs!=null){ rs.beforeFirst(); if(rs!=null&&rs.next()){out.write(rs.getString("ѡװװ��"));}}%></textarea>
                </div></td>
              </tr>
              <script language="javascript">xuanzhuangzhuangbei.style.display="none";</script>
            </table></form></td>
          </tr>
          <tr valign="bottom">
            <td width="480" height="30" valign="middle">
              <div align="center">
                <input name="Submit2" type="button" class="buttons" value="<%if(rs!=null){%>  ��  ��  <%}else{out.write("  ��  ��  ");}%>" onClick="checks()">
                <input name="Submit" type="button" class="buttons" value="  ��  ��  " onClick="javascript:location.reload()">
                  <input name="Submit3" type="button" class="buttons" value="  ��  ��  " onClick="javascript:window.close()">
              </div></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
