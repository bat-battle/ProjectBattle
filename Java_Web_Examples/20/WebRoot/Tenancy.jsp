<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Date"%>
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
<jsp:useBean id="search" scope="page" class="cars.SearchTable" />
<jsp:useBean id="order" scope="page" class="cars.OrderHelp" />
<%!
	ResultSet rs;
	String sql;
	int i,max,years,month1,month2,day1,day2;
	String name,pwd,pwd2,linkman,phone,email,fax,address,hander,numbers,cars,type;
%>
<% if(request.getParameter("action")!=null){
	name=request.getParameter("name");
	pwd=request.getParameter("pwd");
	pwd2=request.getParameter("pwd2");
	linkman=request.getParameter("linkman");
	phone=request.getParameter("phone");
	hander=request.getParameter("hander");
	fax=request.getParameter("fax");
	email=request.getParameter("email");
	address=request.getParameter("address");
	numbers=request.getParameter("numbers");
	cars=request.getParameter("cars");
	java.util.Date today=new java.util.Date();
	years=today.getYear();
	month1=Integer.parseInt(request.getParameter("month1"));
	day1=Integer.parseInt(request.getParameter("day1"));
	month2=Integer.parseInt(request.getParameter("month2"));
	day2=Integer.parseInt(request.getParameter("day2"));
	java.sql.Date start=new java.sql.Date(years,month1,day1);
	java.sql.Date end=new java.sql.Date(years,month2,day2);
	java.sql.Date nows=new java.sql.Date(years,today.getMonth(),today.getDate());
	sql="insert into tb_Tenancy values('"+name+"','"+pwd+"','"+linkman+"','"+phone+"','"+fax+"','"+email+"','"+hander+"','"+address+"','"+numbers+"','"+cars+"','"+start+"','"+end+"','"+nows+"','δ����')";
	i=data.getint(sql);
	if(i>0){
%>
<script language="javascript">
	alert("�������Ԥ�����뾲������������ϵ��");
	location.href="Tenancy.jsp";
</script>
<%	}
}%>
<link rel="stylesheet" href="Css/style.css">
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<script language="javascript">
	function check(){
	 var names=form2.name.value;
	 var pwd=form2.pwd.value;
	 var pwd2=form2.pwd.value;
	 var linkman=form2.linkman.value;
	 var phone=form2.phone.value;
	 var address=form2.address.value;
	 var numbers=form2.numbers.value;
	 var cars=form2.cars.value;
	 if(names==""){
	 	alert("����д���ĵ�¼����");
		form2.name.focus();
	}
	else if(pwd==""){
		alert("����д���ĵ�½����");
		form2.pwd.focus();
	}
	else if(pwd2==""){
		alert("��ȷ�����ĵ�½����");
		form2.pwd2.focus();
	}
	else if(linkman==""){
		alert("����дȷ�е���ϵ������");
		form2.linkman.focus();
	}
	else if(phone==""){
		alert("����дȷ�е���ϵ�绰");
		form2.phone.focus();
	}
	else if(address==""){
		alert("����дȷ�ϵ���ϵ��ַ");
		form2.address.focus();
	}
	else if(numbers==""){
		alert("����д�������֤����");
		form2.numbers.focus();
	}
	else if(isNaN(parseInt(numbers))){
		alert("��˶��������֤����");
		form2.number.focus();
	}
	else {
		form2.submit();
	}						
	}
</script>
<%@ include file="Top.jsp" %>
<table width="744" height="500" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="500" valign="top"><table width="164" height="500" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160" height="20" bgcolor="#FFCC99">&nbsp;���ĵ���</td>
      </tr>
      <tr>
        <td height="100" valign="middle">
		<%
	menu.add(" ��&nbsp;&nbsp; ��&nbsp;&nbsp; ��&nbsp;&nbsp; �� ","");
	menu.add(" ��&nbsp;&nbsp; ��&nbsp;&nbsp; Ԥ&nbsp;&nbsp; �� ","����Ԥ��");
	%>
	<%=menu.table()%>
	<%menu.setnull();%>		  </td>
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
	<% if(request.getParameter("type")==null||request.getParameter("type").equals("")){%>
				  <%order.setfile(application.getRealPath("/Text"),"Tenancy.txt");%>
				<%order.setsize(500,450);%>
  				<%order.setname("��������"," �� �� �� �� ");%>
				<%=order.gettable()%>
			  <%}else {%>
				<table width="580" height="500" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20" colspan="2">&nbsp;<a href="Tenancy.jsp" style="color:#000000 ">��������</a> --&gt;&gt;<%if(request.getParameter("type")==null||request.getParameter("type").equals("")){%> <%="��������"%><%}else{%> <%=request.getParameter("type")%><%}%></td>
      </tr>
      <tr>
        <td colspan="2" valign="middle"><div align="center">

	  <table width="504" border="0" align="center" cellpadding="0" cellspacing="0">
            <form name="form2" method="post" action="Tenancy.jsp">
            <tr>
              <td height="40" colspan="4" align="center"><div align="center" class="bottm" style="font-size: 18px;font-weight: bold;color: #FF0000;width:150; ">�� �� Ԥ �� </div></td>
              </tr>
            <tr>
              <td height="20" colspan="4"><input type="hidden" name="action" value="add"></td>
            </tr>
            <tr>
              <td width="146" height="27"><div align="right">�ͻ����ƣ�</div></td>
              <td height="27" colspan="3">
                <input name="name" type="text" class="wenbenkuang" id="name">
              </td>
              </tr>
            <tr>
              <td height="27"><div align="right">��¼���룺</div></td>
              <td height="27" colspan="3"><input name="pwd" type="text" class="wenbenkuang" id="pwd"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">ȷ�����룺</div></td>
              <td height="27" colspan="3"><input name="pwd2" type="text" class="wenbenkuang" id="pwd2"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">��ϵ�ˣ�</div></td>
              <td height="27" colspan="3"><input name="linkman" type="text" class="wenbenkuang" id="linkman"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">��ϵ�绰��</div></td>
              <td height="27" colspan="3"><input name="phone" type="text" class="wenbenkuang" id="phone"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">�ֻ����룺</div></td>
              <td height="27" colspan="3"><input name="hander" type="text" class="wenbenkuang" id="hander" value="-------"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">���棺</div></td>
              <td height="27" colspan="3"><input name="fax" type="text" class="wenbenkuang" id="fax" value="---------------"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">E-mail��</div></td>
              <td height="27" colspan="3"><input name="email" type="text" class="wenbenkuang" id="email" value="-----------------" size="50"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">��ϵ��ַ��</div></td>
              <td height="27" colspan="3"><input name="address" type="text" class="wenbenkuang" id="address" size="50"></td>
              </tr>
            <tr>
              <td height="27"><div align="right">���֤���룺</div></td>
              <td width="180" height="27"><input name="numbers" type="text" class="wenbenkuang" id="numbers2" size="30"></td>
              <td width="141" height="27">&nbsp;</td>
              <td width="37" height="25">&nbsp;</td>
            </tr>
            <tr>
              <td height="27"><div align="right">�⳵���ͣ�</div></td>
              <td height="27" colspan="2"> 
			  <select name="cars" class="wenbenkuang" id="cars">
			<%	
			  rs=cross.getrs(4);
			  if(rs!=null){
			  	int i=0;
			  	while(rs.next()){
			  %>
			  <option value="<%=rs.getString("����")%>"<%if(i==0){out.print("selected");}%><%i=i+1;%>><%=rs.getString("����")%></option>
			  <%}}%>
			  </select>
         </td>
              <td height="25">&nbsp;</td>
            </tr>
            <tr>
              <td height="27"><div align="right">�⳵ʱ�䣺</div></td>
              <td height="27" colspan="2"> 2005 ��
                  <select name="month1" class="wenbenkuang" id="month1">
                    <option value="1" selected>1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
				  </select>
					  ��
					  <select name="day1" type="text" class="wenbenkuang" id="day1">
					    <option value="1" selected>1</option>
					    <option value="2">2</option>
					    <option value="3">3</option>
					    <option value="4">4</option>
					    <option value="5">5</option>
					    <option value="6">6</option>
					    <option value="7">7</option>
					    <option value="8">8</option>
					    <option value="9">9</option>
					    <option value="10">10</option>
					    <option value="11">11</option>
					    <option value="12">12</option>
					    <option value="13">13</option>
					    <option value="14">14</option>
					    <option value="15">15</option>
					    <option value="16">16</option>
					    <option value="17">17</option>
					    <option value="18">18</option>
					    <option value="19">19</option>
					    <option value="20">20</option>
					    <option value="21">21</option>
					    <option value="22">22</option>
					    <option value="23">23</option>
					    <option value="24">24</option>
					    <option value="25">25</option>
					    <option value="26">26</option>
					    <option value="27">27</option>
					    <option value="28">28</option>
					    <option value="29">29</option>
					    <option value="30">30</option>
					    <option value="31">31</option>
					  </select>
					�� </td>
              <td height="25">&nbsp;</td>
            </tr>
            <tr>
              <td height="27">&nbsp;</td>
              <td height="27" colspan="2">2005 ��
                <select name="month2" type="text" class="wenbenkuang" id="month2">
                  <option value="1">1</option>
                  <option value="2" selected>2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                </select>
				��
				<select name="day2" type="text" class="wenbenkuang" id="day2">
									    <option value="1" selected>1</option>
					    <option value="2">2</option>
					    <option value="3">3</option>
					    <option value="4">4</option>
					    <option value="5">5</option>
					    <option value="6">6</option>
					    <option value="7">7</option>
					    <option value="8">8</option>
					    <option value="9">9</option>
					    <option value="10">10</option>
					    <option value="11">11</option>
					    <option value="12">12</option>
					    <option value="13">13</option>
					    <option value="14">14</option>
					    <option value="15">15</option>
					    <option value="16">16</option>
					    <option value="17">17</option>
					    <option value="18">18</option>
					    <option value="19">19</option>
					    <option value="20">20</option>
					    <option value="21">21</option>
					    <option value="22">22</option>
					    <option value="23">23</option>
					    <option value="24">24</option>
					    <option value="25">25</option>
					    <option value="26">26</option>
					    <option value="27">27</option>
					    <option value="28">28</option>
					    <option value="29">29</option>
					    <option value="30">30</option>
					    <option value="31">31</option>
				</select>
				�� </td>
              <td height="25">&nbsp;</td>
            </tr>
            <tr>
              <td height="15">&nbsp;</td>
              <td height="15">&nbsp;</td>
              <td height="15">&nbsp;</td>
              <td height="15">&nbsp;</td>
            </tr>
            <tr valign="top">
              <td height="30" colspan="4"><div align="center">
                <input name="Submit2" type="button" class="buttons" value=" �� �� Ԥ �� " onClick="check()">
                <input name="Submit3" type="reset" class="buttons" value=" �� �� ">
              </div></td>
              </tr>  </form>
          </table>
        </div></td>
      </tr>
    </table>
		<% }%>
	</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
