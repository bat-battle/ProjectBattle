<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>�����������ۼ�����վ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="session" class="cars.Bean1" />
<jsp:useBean id="menu" scope="session" class="cars.PopMenu" />
<jsp:useBean id="news" scope="page" class="cars.NewsShow" />
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
<jsp:useBean id="search" scope="page" class="cars.SearchTable" />
<%!
	ResultSet rs;
	String sql;
	String sql1;
	int i,max;
%>
<% if(request.getParameter("order")!=null){
	String name=request.getParameter("names");
	String phone=request.getParameter("phone");
	String email=request.getParameter("email");
	String hander=request.getParameter("hander");
	String address=request.getParameter("address");
	String carname=request.getParameter("carname");
	String times=request.getParameter("times");
	String bad=request.getParameter("bad");
	String check=request.getParameter("check");
	String change=request.getParameter("change");
	java.util.Date today1=new java.util.Date();
	java.sql.Date now1=new java.sql.Date(today1.getYear(),today1.getMonth(),today1.getDate());
	sql="insert into tb_Permute values('"+name+"','"+phone+"','"+hander+"','"+email+"','"+address+"','"+carname+"','"+times+"','"+bad+"','"+check+"','"+change+"','"+now1+"','δ����')";
	int j=data.getint(sql);
	if(j>0){
%>
<script language="javascript">
alert("���򹺳������Ѿ����գ����ǽ���ʱ������ϵ��");
location.href="Permute.jsp";
</script>
<%}}%>
<link rel="stylesheet" href="Css/style.css">
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<script language="javascript">
	function check1(){
	 var names=order.names.value;
	 var phone=order.phone.value;
	 var hander=order.hander.value;
	 var address=order.address.value;
	 var carname=order.carname.value;
	 var times=order.times.value;
	 if(names==""){
	 	alert("������������ʵ����");
		order.names.focus();
	 }
	 else if(phone==""){
	 	alert("������ȷ�е���ϵ�绰");
		order.phone.focus();
	 }
	 else if(hander==""){
	 	alert("�����������ֻ�����");
		order.hander.focus();
	}
	else if(address==""){
		alert("���������������ϵ��ַ");
		order.address.focus();
	}
	else if(carname==""){
		alert("���������ĳ�����Ʒ������");
		order.carname.focus();
	}
	else if(times==""){
		alert("����������ӵ�еĳ����Ĺ���ʱ��");
		order.times.focus();
	}				
	 else{
	 	order.submit();
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
	menu.add(" ��&nbsp;&nbsp; ��&nbsp;&nbsp; ��&nbsp;&nbsp; �� ","�û�����");
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
	<%if(request.getParameter("type")==null||request.getParameter("type").equals("")){%>
	<table width="580" height="500" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20" colspan="2">&nbsp;<a href="Permute.jsp" style="color:#000000 ">�û�����</a> --&gt;&gt; �û�����</td>
      </tr>
      <tr>
        <td colspan="2"><div align="center"><img src="Image/U260P33T2D75496F9DT20040806172620.jpg" width="450" height="232"></div></td>
      </tr>
    </table>
	<%}else{%>
	<table width="580" height="500" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20" colspan="2">&nbsp;<a href="Permute.jsp" style="color:#000000 ">�û�����</a> --&gt;&gt; �û�����</td>
      </tr>
      <tr>
        <td colspan="2"><div align="center">
          <table width="500" height="460" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
            <tr>
              <td valign="middle"><table width="480" height="370" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="40" align="center"><div align="center" class="bottm" style="font-size: 16px;color: #FF0000;font-weight: bold;width:130;">�� �� �� ��</div></td>
                  </tr>
                  <tr>
                    <td height="25" align="center">&nbsp;</td>
                  </tr>
                  <form name="order" method="post" action="Permute.jsp?order=order">
                    <tr>
                      <td valign="top">
                        <table width="480" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="152" height="28"><div align="right">��ʵ������</div></td>
                            <td width="328" height="28"><input name="names" type="text" class="wenbenkuang" id="names" size="20"></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">��ϵ�绰��</div></td>
                            <td height="28"><input name="phone" type="text" class="wenbenkuang" id="phone" size="20"></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">�ֻ����룺</div></td>
                            <td height="28"><div align="left">
                                <input name="hander" type="text" class="wenbenkuang" id="hander" size="20">
                            </div></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">E-mail��</div></td>
                            <td height="28"><input name="email" type="text" class="wenbenkuang" id="email" value="------------------" size="35"></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">��ϵ��ַ��</div></td>
                            <td height="28">
                              <div align="left">
                                <input name="address" type="text" class="wenbenkuang" id="address" size="40">
                            </div></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">���г������ƣ�</div></td>
                            <td height="28"><input name="carname" type="text" class="wenbenkuang" id="carname" size="30"></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">����ʱ�䣺</div></td>
                            <td height="28"><input name="times" type="text" class="wenbenkuang" id="times" size="20"></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">�Ƿ�����</div></td>
                            <td height="28"><input type="radio" name="bad" value="����"> 
                              ����
                                <input name="bad" type="radio" value="����" checked> 
                                ����</td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">�Ƿ��Ѿ������죺</div></td>
                            <td height="28"><input name="check" type="radio" value="�Ѿ�����" checked>
                              �Ѿ�����
                              <input type="radio" name="check" value="û�г���">
                              û�г���</td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28"><div align="right">���û��������ƣ�</div></td>
                            <td height="28">
				<select name="change" class="wenbenkuang" id="change">
			<%	
			  rs=cross.getrs();
			  if(rs!=null){
			  	int j=0;
			  	while(rs.next()){
			  %>
			  <option value="<%=rs.getString("Ʒ��")%><%=rs.getString("�ͺ�")%>" <%if(j==0){out.print("selected");}%><%j=j+1;%>><%=rs.getString("Ʒ��")%><%=rs.getString("�ͺ�")%></option>
			  <%}}%>
			  </select></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="28" colspan="2">
                              <div align="center">
                                <input name="Submit22" type="button" class="buttons" value="  ��  ��  " onClick="check1()">
                                <input name="Submit22" type="reset" class="buttons" value="  ��  ��  ">
                            </div></td>
                          </tr>
                      </table></td>
                    </tr>
                  </form>
              </table></td>
            </tr>
          </table>
        </div></td>
      </tr>
    </table>
	<%}%>
	</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
