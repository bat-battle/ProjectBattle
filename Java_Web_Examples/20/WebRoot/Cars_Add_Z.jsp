<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title><%if(request.getParameter("id")==null){%>�� �� �� �� �� ��<%}else{%>�� �� �� �� �� ��<%}%></title>
</head>
<link rel="stylesheet" href="Css/style.css">
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<jsp:useBean id="con" scope="page" class="cars.SendGet" />
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
<%!int logo;
ResultSet rs;
%>
<%
if(request.getParameter("id")!=null){
logo=Integer.parseInt(request.getParameter("id"));
rs=cross.getrs(4,logo);
}
else{
rs=null;
}
%>
<script language="javascript">
	function checks(){
	 var names=orderform.����.value;
	 var price=orderform.�۸�.value;
	var price1=orderform.��ʱ����.value;
	 var price2=orderform.����̷���.value;
	 var price3=orderform.������Ŀ.value;
	 var price4=orderform.������Ŀ.value;
	 var pic=orderform.ͼƬ.value;
	 if(names==""){
	 	alert("����д���޳���������");
	}
	else if(price==""){
		alert("���������޳����ĳ���۸�");
	}
	else if(price1==""){
		alert("�����복��ʹ�ó�ʱ��Ӧ������");
	}
	else if(price2==""){
		alert("�����복��ʹ�ó���̵�Ӧ������");
	}
	else if(price3==""){
		alert("����д�������շ���Ŀ");
	}
	else if(price4==""){
		alert("����д�������շ���Ŀ");
	}
	else if(pic==""){
		alert("����д���޳����ļ��ͼƬ������");
	}
	else {
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
                <td height="20" valign="top">&nbsp; </td>
              </tr>
              <tr valign="bottom">
                <td height="430" valign="top">
                  <form action="<%if(rs==null){out.write("test.jsp");}else{out.write("Car_Change.jsp");}%>" method="post" enctype="multipart/form-data" name="orderform">
                    <table width="480" border="0" cellspacing="0" cellpadding="0" id="zulinche">
                      <tr>
                        <td height="15" colspan="2"><input type="hidden" name="hiddenField" value="���޳�"><%if(rs!=null){%><input type="hidden" name="hiddenField" value="<%=logo%>"><%}%></td>
                      </tr>
                      <tr class="bottm">
                        <td width="285" height="30" class="bottm"><div align="left">&nbsp;<a href="#" style="color:#000000 ">�� �� �� �� �� �� ��</a></div></td>
                        <td width="195" height="30"><div align="center" id="count1"></div></td>
                      </tr>
                      <tr>
                        <td height="20" colspan="2"><div align="left">
                            <table width="480" border="0" cellspacing="0" cellpadding="0" id="jibenziliao">
                              <tr>
                                <td height="20">&nbsp;</td>
                                <td width="140" height="20">&nbsp;</td>
                                <td width="70" height="20">&nbsp;</td>
                                <td width="171" height="20">&nbsp;</td>
                              </tr>
                              <tr>
                                <td width="99" height="35"><div align="right">�������ƣ�</div></td>
                                <td height="35" colspan="3"><input name="����" type="text" class="wenbenkuang" id="����" size="40" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("����"));}}%>"></td>
                              </tr>
                              <tr>
                                <td height="35"><div align="right">�����۸�</div></td>
                                <td height="35" colspan="3"><input name="�۸�" type="text" class="wenbenkuang" id="�۸�" size="40" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("�۸�"));}}%>"></td>
                              </tr>
                              <tr>
                                <td height="35"><div align="right">��ʱ���ã�</div></td>
                                <td height="35" colspan="3"><div align="left">
                                    <input name="��ʱ����" type="text" class="wenbenkuang" id="��ʱ����" size="40"value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��ʱ����"));}}%>">
                                </div></td>
                              </tr>
                              <tr>
                                <td height="35"><div align="right">����̷��ã�</div></td>
                                <td height="35" colspan="3"><input name="����̷���" type="text" class="wenbenkuang" id="����̷���"  size="40" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("����̷���"));}}%>"></td>
                              </tr>
                              <tr>
                                <td height="35"><div align="right">������Ŀ��</div></td>
                                <td height="35" colspan="3"><input name="������Ŀ" type="text" class="wenbenkuang" id="������Ŀ" size="40" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("������Ŀ"));}}%>"></td>
                              </tr>
                              <tr>
                                <td height="35"><div align="right">������Ŀ��</div></td>
                                <td height="35" colspan="3"><input name="������Ŀ" type="text" class="wenbenkuang" id="������Ŀ" size="45" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("������Ŀ"));}}%>"></td>
                              </tr>
                              <tr>
                                <td height="35"><div align="right">��ע��</div></td>
                                <td height="35" colspan="3" rowspan="3"><textarea name="��ע" cols="58" rows="6" class="wenbenkuang" id="��ע"><%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("��ע"));}}%>
</textarea></td>
                              </tr>
                              <tr>
                                <td height="35">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="35">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="35"><div align="right">����ͼƬ��</div></td>
                                <td height="35" colspan="3"><input name="ͼƬ" type="text" class="wenbenkuang" id="ͼƬ" size="40" value="<%if(rs!=null){ rs.beforeFirst(); if(rs.next()){out.write(rs.getString("ͼƬ"));}}%>"></td>
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
