<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>�����������ۼ�����վ���߶���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="session" class="cars.Bean1" />
<link rel="stylesheet" href="Css/style.css">
<%!
 String sql;
 ResultSet rs;
 int i;
 %>
<% if(request.getParameter("orderform")!=null){
	String names=request.getParameter("names");
	int counts=Integer.parseInt(request.getParameter("counts"));
	String color=request.getParameter("color");
	String payment=request.getParameter("payment");
	String enterprise=request.getParameter("enterprise");
	String address=request.getParameter("address");
	String area=request.getParameter("area");
	String dealer=request.getParameter("dealer");
	String linkman=request.getParameter("linkman");
	String phone=request.getParameter("phone");
	String fax=request.getParameter("fax");
	String email=request.getParameter("email");
	String phost=request.getParameter("phone");
	String remark=request.getParameter("remark");
	java.util.Date today=new java.util.Date();
	java.sql.Date now=new java.sql.Date(today.getYear(),today.getMonth(),today.getDate());
	sql="insert into tb_OrderForm(name,counts,color,payment,EnterpriseName,Address,"+
	"Area,Dealer,Linkman,Phone,Fax,Email,PhoneNumber,Remark,IssueDate,Whether) values('"+names+"',"+counts+",'"+color+"','"+payment+"','"+enterprise+"','"+address+"','"+area+"','"+dealer+"','"+linkman+"','"+phone+"','"+fax+"','"+email+"','"+phost+"','"+remark+"','"+now+"','δ����')";
	System.out.println(sql);
	i=data.getint(sql);
	if(i>0){
%>
<script language="javascript">
alert("�����Ѿ�����");
window.close();
</script>
<%}
return;
}%>
<script language="javascript">
	function more(){
	 var names=orderform.dealer.value;
	 var id=0;
	 switch(names){
	 <% sql="select * from tb_Enterprise where Style='��������'";
		rs=data.getrs(sql);
		if(rs!=null){
	while(rs.next()){
              %>
          case "<%=rs.getString("Name")%>":
		  	id=<%=rs.getInt("ID")%>;
			break;
            <%}}%>
		default:
		 break;
		}
		window.open("Enterprise_Particular.jsp?id="+id,"","width=380,height=235,toolbar=no,location=no,status=no,menubar=no");
	}
	function check2(){
		var names=orderform.names.value;
		var counts=orderform.counts.value;
		var address=orderform.address.value;
		var area=orderform.area.value;
		var linkman=orderform.linkman.value;
		var phone=orderform.phone.value;
		if(names==""){
			alert("��������Ҫ�����ĳ�����Ʒ�ƺ��ͺ�");
			orderform.names.focus();
		}
		else if(counts==""){
			alert("��������Ҫ���������");
			orderform.counts.focus();
		}
		else if(address==""){
			alert("������������ϵ��ַ");
			orderform.address.focus();
		}
		else if(area==""){
			alert("����������סլ���ڵ�ʡ������");
			orderform.area.focus();
		}
		else if(linkman==""){
			alert("������������ϵ������");
			orderform.linkman.focus();
		}
		else if(phone==""){
			alert("������������ϵ�绰");
			orderform.phone.focus();
		}
		else{
	 		orderform.submit();
		}
	}
</script>
<body leftmargin="0" topmargin="0">
<table width="500" height="560" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#A7B5CE" class="table">
  <tr>
    <td valign="top"><table width="480" height="500" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="40" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:130;">�� �� �� �� ��</div></td>
        </tr><form name="orderform" method="post" action="OrderForm.jsp?orderform=add">
      <tr>
        <td valign="top">
		<table width="480" height="510" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30"><div align="right">�������ͣ�</div></td>
            <td height="30" colspan="3"><input type="hidden" name="names" value="<%=new String (request.getParameter("action").getBytes("ISO-8859-1"),"GBK")%>"><%=new String (request.getParameter("action").getBytes("ISO-8859-1"),"GBK")%></td>
            </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">����������</div></td>
            <td width="152" height="30">
              <input name="counts" type="text" class="wenbenkuang" id="counts" value="" size="10" maxlength="2">
              ��</td>
            <td width="80" height="30"><div align="right">���ʽ��</div></td>
            <td width="158" height="30">
              <select name="payment" class="wenbenkuang" id="select4">
                <option value="�ֽ�" selected>�ֽ�</option>
                <option value="���">���</option>
                <option value="֧Ʊ">֧Ʊ</option>
                <option value="����">����</option>
              </select>
            </td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">��ѡ��ɫ��</div></td>
            <td height="30" colspan="3"><div align="left">
                <input type="radio" name="color" value="��">
                ��
                <input name="color" type="radio" value="��" checked>
                ��
                <input type="radio" name="color" value="��">
                ��
                <input type="radio" name="color" value="��">
                ��
                <input type="radio" name="color" value="��">
                ��
                <input type="radio" name="color" value="��">
                ��
                <input type="radio" name="color" value="��">
                ��
                <input type="radio" name="color" value="��">
                �� </div></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">��˾���ƣ�</div></td>
            <td height="30" colspan="3"><input name="enterprise" type="text" class="wenbenkuang" id="enterprise23" value="---------" size="60">
                <div align="right"></div></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">��ϸ��ַ��</div></td>
            <td height="30" colspan="3"><input name="address" type="text" class="wenbenkuang" id="address23" size="60">
                <div align="right"></div></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">���ڵ�����</div></td>
            <td height="30" colspan="3"><div align="right">
                <table width="380" height="30" border="0" align="left" cellpadding="0" cellspacing="0">
                  <tr valign="bottom">
                    <td><input name="area" type="text" class="wenbenkuang" id="area23" size="50"></td>
                  </tr>
                </table>
            </div></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">���������ƣ�</div></td>
            <td height="30" colspan="3"><div align="right">
                <table width="380" height="30" border="0" align="left" cellpadding="0" cellspacing="0">
                  <tr valign="bottom">
                    <td width="285"><select name="dealer" class="wenbenkuang" id="dealer">
                        <% sql="select * from tb_Enterprise where Style='��������'";
					rs=data.getrs(sql);
					if(rs!=null){
						while(rs.next()){
                                        %>
                        <option value="<%=rs.getString("Name")%>"><%=rs.getString("Name")%></option>
                        <%}}
									  data.close();
									  rs.close();
									  %>
                      </select>
                    </td>
                    <td width="95"><input name="Submit" type="button" class="buttons" value="  ��ϸ����  " onClick="more()"></td>
                  </tr>
                </table>
            </div></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">��ϵ�ˣ�</div></td>
            <td height="30"><input name="linkman" type="text" class="wenbenkuang" id="linkman23" size="20"></td>
            <td height="30"><div align="right">��ϵ�绰��</div></td>
            <td height="30"><input name="phone" type="text" class="wenbenkuang" id="phone23" size="20"></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">���棺</div></td>
            <td height="30"><input name="fax" type="text" class="wenbenkuang" id="fax23" value="--------" size="20"></td>
            <td height="30"><div align="right">E-mail��</div></td>
            <td height="30"><input name="email" type="text" class="wenbenkuang" id="email23" value="------" size="20"></td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">�������룺</div></td>
            <td height="30"><input name="phost" type="text" class="wenbenkuang" id="phost23" value="-----------" size="20"></td>
            <td height="30">&nbsp;</td>
            <td height="30">&nbsp;</td>
          </tr>
          <tr valign="bottom">
            <td width="90" height="30"><div align="right">��ע��Ϣ��</div></td>
            <td height="90" colspan="3" rowspan="3">
              <textarea name="remark" cols="60" rows="5" class="wenbenkuang" id="remark">---------
</textarea>
            </td>
          </tr>
          <tr valign="bottom">
            <td height="30">&nbsp;</td>
          </tr>
          <tr valign="bottom">
            <td height="30">&nbsp;</td>
            </tr>
          <tr valign="bottom">
            <td height="30" colspan="4">
              <div align="center">
                <input name="Submit2" type="button" class="buttons" value="  ��  ��  " onClick="check2()">
                <input name="Submit" type="reset" class="buttons" value="  ��  ��  ">
                  <input name="Submit3" type="button" class="buttons" value="  ��  ��  " onClick="javascript:window.close()">
              </div></td>
            </tr>
          <tr valign="bottom">
            <td height="30" colspan="4"><div align="center" style="color: #FF0000 ">����ʡ�����л����������ۼ��Ź�˾ 24Сʱ�ͻ��������ߣ�xxxx-xxxxxxx</div></td>
          </tr>
        </table></td>
      </tr></form>
    </table></td>
  </tr>
</table>
</body>
</html>
