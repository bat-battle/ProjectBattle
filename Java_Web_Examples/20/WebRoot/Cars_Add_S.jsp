<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title><%if(request.getParameter("id")==null){%>�� �� �� �� �� ��<%}else{%>�� �� �� �� �� ��<%}%></title>
</head>
<link rel="stylesheet" href="Css/style.css">
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
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
%><script>

function hiddenall(objTr){
	jibenziliao.style.display = "none";
	jibencanshu.style.display = "none";
	waixingcanshu.style.display = "none";
	dipancanshu.style.display = "none";
	fadongjicanshu.style.display = "none";
	shibiema.style.display ="none";
	}
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
		break;
	}
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
              <tr><form name="type">
                <td height="20">
                  <div align="left">
				  <%if(request.getParameter("type")==null){%>
                    <select name="selects" class="wenbenkuang" onchange="change()">
                      <option value="���ó�" selected>���ó�</option>
                      <option value="���ó�">���ó�</option>
                    </select><%}%>
                     </div></td></form>
                <td><div align="right"><a href="#">ȷ���������ʱ���뽫������״������</a></div></td>
              </tr>
            </table>
              </td>
          </tr>
          <tr valign="bottom">
            <td height="430" valign="top">
			<form action="<%if(rs==null){out.write("test.jsp");}else{out.write("Car_Change.jsp");}%>" method="post" enctype="multipart/form-data" name="orderform">
			  <table width="480" border="0" cellspacing="0" cellpadding="0" id="shangyongche">
                <tr>
                  <td height="15" colspan="2"><input type="hidden" name="hiddenField" value="���ó�"><%if(rs!=null){%><input type="hidden" name="hiddenField" value="<%=logo%>"><%}%></td>
                </tr>
                <tr class="bottm">
                  <td width="285" height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(jibenziliao,jpg1)"><img id="jpg1" src="Image/jia.gif" width="10" height="10" border="0"> �� �� �� ��</a></div></td>
                  <td width="195"><div align="center" id="count1"></div></td>
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
                          <td width="169" height="23"><input name="Ʒ��" type="text" class="wenbenkuang"  value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("Ʒ��"));}}%>"></td>
                          <td width="70" height="23"><div align="right">�����ͺţ�</div></td>
                          <td width="171" height="23"><input name="�ͺ�" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�ͺ�"));}}%>"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">������Ⱥ��</div></td>
                          <td height="23"><input name="������Ⱥ" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("������Ⱥ"));}}%>"></td>
                          <td height="23"><div align="right">�ο��۸�</div></td>
                          <td height="23"><input name="�ۼ�" type="text" class="wenbenkuang" size="12" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�ۼ�"));}}%>">
              ����Ԫ��</td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">���ּ�飺</div></td>
                          <td height="23" colspan="3" rowspan="3"><div align="left">
                              <textarea name="���ּ��" cols="65" rows="4" class="wenbenkuang"><%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("���ּ��"));}}%></textarea>
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
                          <td height="23" colspan="3"><input name="���ͼƬ" type="text" class="wenbenkuang" size="35" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("���ͼƬ"));}}%>"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">��ɫ��</div></td>
                          <td height="23"><input name="��ɫ" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��ɫ"));}}%>"></td>
                          <td height="23">&nbsp;</td>
                          <td height="23"><div align="center"> </div></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">��ӦͼƬ��</div></td>
                          <td height="23" colspan="3"><input name="��ɫͼƬ" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��ɫͼƬ"));}}%>" size="35">
                          </td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">��ۣ�</div></td>
                          <td height="23" colspan="3"><input name="���" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("���"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">��ӦͼƬ��</div></td>
                          <td height="23" colspan="3"><input name="���ͼƬ" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("���ͼƬ"));}}%>" size="35">
                          </td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">���Σ�</div></td>
                          <td height="23" colspan="3"><input name="����" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("����"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">��ӦͼƬ��</div></td>
                          <td height="23" colspan="3"><input name="����ͼƬ" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("����ͼƬ"));}}%>" size="35">
                          </td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">���ã�</div></td>
                          <td height="23" colspan="3"><input name="����" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("����"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">��ӦͼƬ��</div></td>
                          <td height="23" colspan="3"><input name="����ͼƬ" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("����ͼƬ"));}}%>" size="35">
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
                          <td width="155" height="23"><input name="��߳���" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��߳���"));}}%>"></td>
                          <td width="84" height="23"><div align="right">������ʽ��</div></td>
                          <td width="171" height="23"><input name="������ʽ" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("������ʽ"));}}%>"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">�ƶ����룺</div></td>
                          <td height="23"><input name="�ƶ�����" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�ƶ�����"));}}%>"></td>
                          <td height="23"><div align="right">��Сת��ֱ����</div></td>
                          <td height="23"><input name="��Сת��ֱ��" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��Сת��ֱ��"));}}%>" size="12">
                          </td>
                        </tr>
                        <tr>
                          <td height="23" colspan="4"><div align="right"></div>
                              <div align="left">
                                <table width="480" height="25" border="0" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td width="76"><div align="right">������¶ȣ�</div></td>
                                    <td width="404"><input name="������¶�" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("������¶�"));}}%>"></td>
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
                          <td width="125" height="15">&nbsp;</td>
                          <td width="99" height="15">&nbsp;</td>
                          <td width="156" height="15">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="100" height="23"><div align="right">�����ߴ磺</div></td>
                          <td height="23" colspan="3"><input name="���γߴ�" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("���γߴ�"));}}%>" size="30">
              �� * �� * ��</td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">�����ڲ��ߴ磺</div></td>
                          <td height="23" colspan="3"><input name="�����ڲ��ߴ�" type="text" class="wenbenkuang" id="�����ڲ��ߴ�" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�����ڲ��ߴ�"));}}%>" size="30">
              �� * �� * ��</td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">��������</div></td>
                          <td height="23"><input name="������" type="text" class="wenbenkuang" id="������" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("������"));}}%>" size="12"></td>
                          <td height="23"><div align="right">�������أ�</div></td>
                          <td height="23"><input name="��������" type="text" class="wenbenkuang" id="��������" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��������"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">�غɷ��䣨�գ���</div></td>
                          <td height="0"><div align="left">
                              <input name="�غɷ��䣨���أ�" type="text" class="wenbenkuang" id="�غɷ��䣨���أ�" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�غɷ��䣨���أ�"));}}%>" size="12">
                          </div></td>
                          <td height="0"><div align="right">�غɷ��䣨������</div></td>
                          <td height="0"><input name="�غɷ��䣨���أ�" type="text" class="wenbenkuang" id="�غɷ��䣨���أ�" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�غɷ��䣨���أ�"));}}%>"size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">�������أ�</div></td>
                          <td height="0"><input name="��������" type="text" class="wenbenkuang" id="��������" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��������"));}}%>" size="12"></td>
                          <td height="0"><div align="right">���ܣ�</div></td>
                          <td height="0"><input name="����" type="text" class="wenbenkuang" id="����" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("����"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">��С��ؼ�϶��</div></td>
                          <td height="23"><input name="��С��ؼ�϶��mm��" type="text" class="wenbenkuang" id="��С��ؼ�϶��mm��" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��С��ؼ�϶��mm��"));}}%>" size="12"></td>
                          <td height="23"><div align="right">��ࣺ</div></td>
                          <td height="23"><input name="���" type="text" class="wenbenkuang" id="���" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("���"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">�־ࣺ</div></td>
                          <td height="23"><input name="�־�" type="text" class="wenbenkuang" id="�־�" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�־�"));}}%>" size="12"></td>
                          <td height="23"><div align="right">�����ݻ���</div></td>
                          <td height="23"><span class="bottm">
                            <input name="�����ݻ�" type="text" class="wenbenkuang" id="�����ݻ�" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�����ݻ�"));}}%>" size="12">
                          </span></td>
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
                          <td height="23" colspan="3"><input name="��������ʽ" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��������ʽ"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">�������ʽ��</div></td>
                          <td height="23" colspan="3"><input name="�������ʽ" type="text" class="wenbenkuang" id="�������ʽ" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�������ʽ"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">�����᣺</div></td>
                          <td height="23" colspan="3"><input name="������" type="text" class="wenbenkuang" id="������" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("������"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">������ʽ��</div></td>
                          <td height="23" colspan="3"><input name="������ʽ" type="text" class="wenbenkuang" id="������ʽ" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("������ʽ"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">���ܣ�</div></td>
                          <td height="23" colspan="3"><input name="����" type="text" class="wenbenkuang" id="����" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("����"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">ǰ�᣺</div></td>
                          <td height="23" colspan="3"><input name="ǰ��" type="text" class="wenbenkuang" id="ǰ��" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("ǰ��"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">��̥��������</div></td>
                          <td height="23" colspan="3"><input name="��̥������" type="text" class="wenbenkuang" id="��̥������" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��̥������"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">����ϵͳ��</div></td>
                          <td height="23" colspan="3"><input name="����ϵͳ" type="text" class="wenbenkuang" id="����ϵͳ" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("����ϵͳ"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">��������ϵͳ��</div></td>
                          <td height="23" colspan="3"><input name="��������ϵͳ" type="text" class="wenbenkuang" id="��������ϵͳ" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��������ϵͳ"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">����������</div></td>
                          <td height="23" colspan="3"><input name="��������" type="text" class="wenbenkuang" id="��������" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��������"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">��̥���ͼ����</div></td>
                          <td height="23" colspan="3"><input name="��̥���ͼ����" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��̥���ͼ����"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">�ƶ�װ����ʽ��</div></td>
                          <td height="0" colspan="3"><input name="�ƶ�װ����ʽ" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�ƶ�װ����ʽ"));}}%>" size="60"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">ת������ʽ��</div></td>
                          <td height="0" colspan="3"><input name="ת������ʽ" type="text" class="wenbenkuang" id="ת������ʽ" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("ת������ʽ"));}}%>" size="60"></td>
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
                          <td width="134" height="15">&nbsp;</td>
                          <td width="85" height="15">&nbsp;</td>
                          <td width="158" height="15">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="103" height="23"><div align="right">���������ƣ�</div></td>
                          <td height="23"><input name="����������" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("����������"));}}%>" size="12"></td>
                          <td height="23"><div align="right">������λ�ã�</div></td>
                          <td height="23"><input name="������λ��" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("������λ��"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">��������ʽ��</div></td>
                          <td height="23" colspan="3"><input name="��������ʽ" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��������ʽ"));}}%>" size="45"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">��������</div></td>
                          <td height="0"><input name="������" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("������"));}}%>" size="12"></td>
                          <td height="0"><div align="right">������</div></td>
                          <td height="0"><input name="����" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("����"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">����ʣ�</div></td>
                          <td height="0"><input name="�����" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�����"));}}%>" size="12"></td>
                          <td height="0"><div align="right">���Ť�أ�</div></td>
                          <td height="0"><input name="���Ť��" type="text" class="wenbenkuang" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("���Ť��"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">�׾���</div></td>
                          <td height="0"><input name="�׾�/�г�" type="text" class="wenbenkuang" id="�׾�/�г�" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�׾�/�г�"));}}%>" size="12"></td>
                          <td height="0"><div align="right">ѹ���ȣ�</div></td>
                          <td height="0"><input name="ѹ����" type="text" class="wenbenkuang" id="ѹ����" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("ѹ����"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">0-100KM����ʱ�䣺</div></td>
                          <td height="0"><input name="0-100km����ʱ��" type="text" class="wenbenkuang" id="0-100km����ʱ��" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("0-100km����ʱ��"));}}%>" size="12"></td>
                          <td height="0"><div align="right">���ʽ��</div></td>
                          <td height="0"><input name="���ʽ" type="text" class="wenbenkuang" id="���ʽ" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("���ʽ"));}}%>" size="12"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">�ٹ����ͺģ�</div></td>
                          <td height="23"><input name="�ٹ����ͺ�" type="text" class="wenbenkuang" id="�ٹ����ͺ�" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�ٹ����ͺ�"));}}%>" size="12"></td>
                          <td height="23"><div align="right">ȼ�����ࣺ</div></td>
                          <td height="23">                            <input name="ȼ������" type="text" class="wenbenkuang" id="ȼ������" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("ȼ������"));}}%>" size="12"></td></tr>
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
                  <td height="20" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 " onClick="ShowTR(shibiema,jpg9)"><img src="Image/jia.gif" id="jpg9" width="10" height="10" border="0"> �� �� �� �� �� �� ʶ</a></div></td>
                  <td height="20" class="bottm"><div align="center"></div></td>
                </tr>
                <tr>
                  <td height="20" colspan="2"><div align="left" id="shibiema">
                      <table width="480" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="15">&nbsp;</td>
                          <td height="15">&nbsp;</td>
                          <td height="15">&nbsp;</td>
                          <td height="15">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="70" height="23"><div align="right">�����ͺţ�</div></td>
                          <td width="155" height="23"><input name="�����ͺż����" type="text" class="wenbenkuang" id="�����ͺż����" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�����ͺż����"));}}%>"></td>
                          <td width="84" height="23"><div align="right">����ʶ���룺</div></td>
                          <td width="171" height="23"><input name="����ʶ����" type="text" class="wenbenkuang" id="����ʶ����" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("����ʶ����"));}}%>"></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="right">��ѡ��ɫ��</div></td>
                          <td height="23" colspan="3"><input name="��ѡ��ɫ" type="text" class="wenbenkuang" id="��ѡ��ɫ" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��ѡ��ɫ"));}}%>"></td>
                        </tr>
                        <tr>
                          <td height="15" colspan="4" class="bottm">&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="15" colspan="4">&nbsp;</td>
                        </tr>
                      </table>
                  </div></td>
                </tr>
                <script language="javascript">shibiema.style.display="none";</script>
              </table>
            </form></td>
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
