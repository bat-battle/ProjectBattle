<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>�����������ۼ�����վ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<jsp:useBean id="menu" scope="page" class="cars.PopMenu" />
<jsp:useBean id="news" scope="page" class="cars.NewsShow" />
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
<jsp:useBean id="cus" scope="page" class="cars.CustomerTable" />
<jsp:useBean id="search" scope="page" class="cars.SearchTable" />
<jsp:useBean id="order" scope="page" class="cars.OrderHelp" />
<jsp:useBean id="filetext" scope="page" class="cars.FileText" />
<%!
	ResultSet rs;
	String sql;
	String rla="";
	int i;
%>

<% if(request.getParameter("order")!=null){
	String names1=request.getParameter("names");
	String pwd1=request.getParameter("password");
	String realname1=request.getParameter("realname");
	String address1=request.getParameter("address");
	String phone1=request.getParameter("phone");
	String email1=request.getParameter("email");
	String hander1=request.getParameter("hander");
	String carname1=request.getParameter("carname");
	String cartype1=request.getParameter("cartype");
	java.util.Date today1=new java.util.Date();
	java.sql.Date now1=new java.sql.Date(today1.getYear(),today1.getMonth(),today1.getDate());
	sql="insert into tb_Intent values('"+names1+"','"+pwd1+"','"+realname1+"','"+phone1+"','"+carname1+"','"+cartype1+"','"+email1+"','"+address1+"','"+hander1+"','δ����','"+now1+"')";
	int j=data.getint(sql);
	if(j>0){
%>
<script language="javascript">
alert("���򹺳������Ѿ����գ����ǽ���ʱ������ϵ��");
location.href="SpeakFor.jsp";
</script>
<%}}%>
<%=filetext.getfiletext("��������")%>
<link rel="stylesheet" href="Css/style.css">
<SCRIPT src="Js/TextColor.js"></SCRIPT>
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
	sql="insert into tb_OrderForm values('"+names+"',"+counts+",'"+color+"','"+payment+"','"+enterprise+"','"+address+"','"+area+"','"+dealer+"','"+linkman+"','"+phone+"','"+fax+"','"+email+"','"+phost+"','"+remark+"','"+now+"','δ����')";
	i=data.getint(sql);
	if(i>0){
%>
<script language="javascript">
alert("�����Ѿ�����");
location.href="SpeakFor.jsp";
</script>
<%}}%>
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
	function check1(){
		var names=order.names.value;
		var pwd=order.password.value;
		var pwd2=order.password2.value;
		var realname=order.realname.value;
		var phone=order.phone.value;
		var carname=order.carname.value;
		var email=order.email.value;
		var address=order.address.value;
		if(names==""){
			alert("�������¼����");
			order.names.focus();
		}
		else if(pwd==""){
			alert("�������¼����");
			order.password.focus();
		}
		else if(pwd2==""){
			alert("������ȷ������");
			order.password2.focus();
		}
		else if(pwd!=pwd2){
			alert("������������벻һ��");
			order.password.focus();
		}
		else if(realname==""){
			alert("����д������ʵ����");
			order.realname.focus();
		}
		else if(phone==""){
			alert("����д���ĵ绰����");
			order.phone.focus();
		}
		else if(carname==""){
			alert("����д������Ȥ�ĳ���Ʒ��");
			order.carname.focus();
		}
		else if(email==""){
			alert("����д����E-mail��ַ");
			order.email.focus();
		}
		else if(address==""){
			alert("����д������ϸ��ַ");
			order.address.focus();
		}
		else {
			order.submit();
		}
	}
</script>
<%@ include file="Top.jsp" %>
<table width="744" height="566" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="566" valign="top"><table width="164" height="566" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160" height="20" bgcolor="#FFCC99">&nbsp;���ĵ���</td>
      </tr>
      <tr>
        <td height="100" colspan="2" valign="top">
		<%
		menu.add("�� �� �� ��","");
		menu.add("�� �� �� ��","��������");
		menu.add("�� �� �� ��","���߶���");
		menu.add("�� �� �� ��","���򹺳�");
		%>
		<%=menu.table()%>
		<%menu.setnull();%>
		</td>
	</tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;վ������</td>
      </tr>
      <tr>
        <td height="120"><%=search.getsearch()%></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;<a href="#" style="color:#000000 ">���ű���</a></td>
      </tr>
      <tr>
        <td valign="top"><%=news.getstring()%></td>
      </tr>
    </table>    </td>
    <td width="580" valign="top">
	<% if(request.getParameter("type")==null){%>
		<%=cus.gettable()%>
	<% }else {%>
	<% if(request.getParameter("type").equals("���߶���")){%>
	<table width="580" height="566" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20">&nbsp;<a href="SpeakFor.jsp"  style="color:#000000 ">��������</a> --&gt;&gt; ���߶��� </td>
      </tr>
      <tr><td><table width="500" height="460" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td valign="top"><table width="480" height="460" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="40" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:130;">�� �� �� �� ��</div></td>
                  </tr>
                  <form name="orderform" method="post" action="SpeakFor.jsp?orderform=orderform">
                    <tr>
                      <td valign="top">
                        <table width="480" height="460" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td height="30"><div align="right">�������ͣ�</div></td>
                            <td height="30" colspan="3"><select name="names" class="wenbenkuang" id="names">
			<%	
			  rs=cross.getrs();
			  if(rs!=null){
			  	int i=0;
			  	while(rs.next()){
			  %>
			  <option value="<%=rs.getString("Ʒ��")%><%=rs.getString("�ͺ�")%>"<%if(i==0){out.print("selected");}%><%i=i+1;%>><%=rs.getString("Ʒ��")%><%=rs.getString("�ͺ�")%></option>
			  <%}}%>
			  </select></td>
                          </tr>
                          <tr valign="bottom">
                            <td width="90" height="30"><div align="right">����������</div></td>
                            <td width="152" height="30">
                              <input name="counts" type="text" class="wenbenkuang" id="counts" value="" size="10" maxlength="2">
                              ��</td>
                            <td width="80" height="30"><div align="right">���ʽ��</div></td>
                            <td width="158" height="30">
                              <select name="payment" class="wenbenkuang" id="payment">
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
                            <td height="30" colspan="3"><input name="enterprise" type="text" class="wenbenkuang" id="enterprise" value=" " size="60">
                                <div align="right"></div></td>
                          </tr>
                          <tr valign="bottom">
                            <td width="90" height="30"><div align="right">��ϸ��ַ��</div></td>
                            <td height="30" colspan="3"><input name="address" type="text" class="wenbenkuang" id="address" size="60">
                                <div align="right"></div></td>
                          </tr>
                          <tr valign="bottom">
                            <td width="90" height="30"><div align="right">���ڵ�����</div></td>
                            <td height="30" colspan="3"><div align="right">
                                <table width="380" height="30" border="0" align="left" cellpadding="0" cellspacing="0">
                                  <tr valign="bottom">
                                    <td><input name="area" type="text" class="wenbenkuang" id="area" size="50"></td>
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
                                    <td width="95"><input name="Submit32" type="button" class="buttons" value="  ��ϸ����  " onClick="more()"></td>
                                  </tr>
                                </table>
                            </div></td>
                          </tr>
                          <tr valign="bottom">
                            <td width="90" height="30"><div align="right">��ϵ�ˣ�</div></td>
                            <td height="30"><input name="linkman" type="text" class="wenbenkuang" id="linkman" size="20"></td>
                            <td height="30"><div align="right">��ϵ�绰��</div></td>
                            <td height="30"><input name="phone" type="text" class="wenbenkuang" id="phone" size="20"></td>
                          </tr>
                          <tr valign="bottom">
                            <td width="90" height="30"><div align="right">���棺</div></td>
                            <td height="30"><input name="fax" type="text" class="wenbenkuang" id="fax" value=" " size="20"></td>
                            <td height="30"><div align="right">E-mail��</div></td>
                            <td height="30"><input name="email" type="text" class="wenbenkuang" id="email" value=" " size="20"></td>
                          </tr>
                          <tr valign="bottom">
                            <td width="90" height="30"><div align="right">�������룺</div></td>
                            <td height="30"><input name="phost" type="text" class="wenbenkuang" id="phost" value=" " size="20"></td>
                            <td height="30">&nbsp;</td>
                            <td height="30">&nbsp;</td>
                          </tr>
                          <tr valign="bottom">
                            <td width="90" height="30"><div align="right">��ע��Ϣ��</div></td>
                            <td height="90" colspan="3" rowspan="3">
                              <textarea name="remark" cols="60" rows="5" class="wenbenkuang" id="remark"> 
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
                            <td height="30" colspan="4">                              <div align="center">
                                <input name="Submit2" type="button" class="buttons" value="  ��  ��  " onClick="check2()">
                                <input name="Submit2" type="reset" class="buttons" value="  ��  ��  ">
</div></td>
                          </tr>
                      </table></td>
                    </tr>
                  </form>
              </table></td>
            </tr>
          </table></td>
      </tr>
    </table>
<%}%>
<% if(request.getParameter("type").equals("���򹺳�")){%>
<table width="580" height="566" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20">&nbsp;<a href="SpeakFor.jsp"  style="color:#000000 ">��������</a> --&gt;&gt; ���򹺳�</td>
      </tr>
      <tr><td><table width="500" height="460" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td valign="middle"><table width="480" height="370" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="40" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:130;">�� �� �� ��</div></td>
                  </tr>
                  <tr>
                    <td height="25" align="center">&nbsp;</td>
                  </tr>
                  <form name="order" method="post" action="SpeakFor.jsp?order=order">
                    <tr>
                      <td valign="top">
                        <table width="480" height="330" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="152" height="30"><div align="right">��¼���ƣ�</div></td>
                            <td width="328" height="30"><input name="names" type="text" class="wenbenkuang" id="names" size="20" value=""></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">��¼���룺</div></td>
                            <td height="30"><input name="password" type="text" class="wenbenkuang" id="password" size="20" value=""></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">ȷ�����룺</div></td>
                            <td height="30"><div align="left">
                              <input name="password2" type="text" class="wenbenkuang" id="password2" size="20" value="">
                              </div></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">��ʵ������</div></td>
                            <td height="30"><input name="realname" type="text" class="wenbenkuang" id="realname" size="20" value=""></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">��ϵ�绰��</div></td>
                            <td height="30">
                                <div align="left">
                                  <input name="phone" type="text" class="wenbenkuang" id="phone" size="20" value="">
                                </div></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">����Ȥ��Ʒ�ƣ�</div></td>
                            <td height="30"><input name="carname" type="text"  class="wenbenkuang" id="carname" value="">
                            </td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">����Ȥ�ĳ��ͣ�</div></td>
                            <td height="30"><input name="cartype" type="text"  class="wenbenkuang" id="cartype" value="">
                            </td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">E-mail��ַ��</div></td>
                            <td height="30"><input name="email" type="text" class="wenbenkuang" id="email" size="45" value=""></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">�ֻ����룺</div></td>
                            <td height="30"><input name="hander" type="text" class="wenbenkuang" id="hander" size="30" value=""></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30"><div align="right">��ͥסַ��</div></td>
                            <td height="30"><input name="address" type="text" class="wenbenkuang" id="address" size="50" value=""></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="30" colspan="2">                              <div align="center">
                                <input name="Submit22" type="button" class="buttons" value="  ��  ��  " onClick="check1()">
                                <input name="Submit22" type="reset" class="buttons" value="  ��  ��  ">
                            </div></td>
                          </tr>
                        </table></td>
                    </tr>
                  </form>
              </table></td>
            </tr>
          </table></td>
      </tr>
    </table>
<%}%>
<% if(request.getParameter("type").equals("��������")){%>
  <%order.setfile(application.getRealPath("/Text"),"OrderHelp.dll");%>
  <%order.setsize(566,460);%>
  <%order.setname("��������"," �� �� �� �� ");%>
<%=order.gettable()%>
<%}%>
<% if(request.getParameter("type").equals("")){%>
		<%=cus.gettable()%>
<%}}%>
	</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
