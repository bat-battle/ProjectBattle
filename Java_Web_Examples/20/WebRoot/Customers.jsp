<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>�����������ۼ�����վ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="Css/style.css" rel="stylesheet" type="text/css">
</head>
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<jsp:useBean id="menu" scope="page" class="cars.PopMenu" />
<jsp:useBean id="rst" scope="page" class="cars.Pages" />
<jsp:useBean id="news" scope="page" class="cars.NewsShow" />
<jsp:useBean id="cus" scope="page" class="cars.CustomerTable" />
<jsp:useBean id="search" scope="page" class="cars.SearchTable" />
<jsp:useBean id="order" scope="page" class="cars.OrderHelp" />
<jsp:useBean id="filetext" scope="page" class="cars.FileText" />
<%!
	String sql;
	String keyword,type;
	String rla="";
	String vari;
	int pagecount;
	int pages;
	int nows;
	ResultSet rs;
	ResultSet rs1;
%>
<% if(request.getParameter("add")!=null){
	String realname=request.getParameter("realname");
	String phone=request.getParameter("phone");
	String enterprise=request.getParameter("enterprise");
	String keyname=request.getParameter("keyname");
	String season=request.getParameter("season");
	String result=request.getParameter("result");
	java.util.Date today1=new java.util.Date();
	java.sql.Date now1=new java.sql.Date(today1.getYear(),today1.getMonth(),today1.getDate());
	sql="insert into tb_Record values('"+realname+"','"+phone+"','"+enterprise+"','"+keyname+"','"+season+"','"+result+"','"+now1+"','δ����')";
	int j=data.getint(sql);
	data.close();
	if(j>0){
%>
<script language="javascript">
alert("�����Ѿ��յ�����Ͷ�ߣ�����һ�������������Ĵ𸴣�");
location.href="Customers.jsp";
</script>
<%}}%>
<%=filetext.getfiletext("�ͻ�����")%>
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<script language="javascript">
	function checks(){
		var names=form2.realname.value;
		var phone=form2.phone.value;
		var keyname=form2.keyname.value;
		var season=form2.season.value;
		var result=form2.result.value;
		if(names==""){
			alert("������������ʵ����");
			form2.realname.focus();
		}
		else if(phone==""){
			alert("����������ȷ�е���ϵ�绰");
			form2.phone.focus();
		}
		else if(keyname==""){
			alert("��������ҪͶ�ߵ���Ŀ������");
			form2.keyname.focus();
		}
		else if(season==""){
			alert("��������Ͷ�ߵ�ԭ��");
			form2.season.focus();
		}
		else if(result==""){
			alert("������������Ĵ�����");
			form2.result.focus();
		}
		else {
			form2.submit();
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
        <td height="100" valign="top">
		      <%
	menu.add(" �� �� �� �� ","");
	menu.add(" Ͷ �� �� �� ","Ͷ�ߴ���");
	menu.add(" �� �� �� ѯ ","������ѯ");
	menu.add(" �� �� �� �� ","�ۺ����");
	%>
	<%=menu.table()%>
	<%menu.setnull();%></td>
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
	<%if(request.getParameter("type")==null){%>
	<%=cus.gettable()%>
	<%}else{%>
	<%if(request.getParameter("type").equals("Ͷ�ߴ���")){%>
		<table width="580" height="566" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20">&nbsp;�ͷ����� --&gt;&gt; Ͷ�ߴ���</td>
      </tr>
      <tr>
        <td><table width="520" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
		<form name="form2" method="post" action="Customers.jsp?add=add">
            <tr>
              <td height="50" colspan="2"><div align="center" style="font-size: 18px;color: #FF0000;font-weight: bold; ">Ͷ �� �� ��</div></td>
              </tr>
            <tr>
              <td width="169" height="30"><div align="right"></div></td>
              <td width="351" height="30">&nbsp;</td>
            </tr>
            <tr>
              <td height="30"><div align="right">��ʵ������</div></td>
              <td height="30">
                <input name="realname" type="text" class="wenbenkuang" id="realname">
              </td>
            </tr>
            <tr>
              <td height="30"><div align="right">��ϵ�绰��</div></td>
              <td height="30"><input name="phone" type="text" class="wenbenkuang" id="phone"></td>
            </tr>
            <tr>
              <td height="30"><div align="right">Ͷ�ߵ�λ��</div></td>
              <td height="30"><select name="enterprise" class="wenbenkuang" id="enterprise">
			<%	sql="select * from tb_Enterprise";
			  rs1=data.getrs(sql);
			  if(rs1!=null){
			  	int i=0;
			  	while(rs1.next()){
			  %>
			  <option value="<%=rs1.getString("Name")%>"<%if(i==0){out.print("selected");}%><%i=i+1;%>><%=rs1.getString("Name")%></option>
			  <%}}%>
			  </select></td>
            </tr>
            <tr>
              <td height="30"><div align="right">Ͷ����Ŀ��</div></td>
              <td rowspan="3"><textarea name="keyname" cols="50" rows="5" class="wenbenkuang" id="keyname"></textarea></td>
            </tr>
            <tr>
              <td height="30">&nbsp;</td>
              </tr>
            <tr>
              <td height="30">&nbsp;</td>
              </tr>
            <tr>
              <td height="30"><div align="right">Ͷ�����ɣ�</div></td>
              <td rowspan="3"><textarea name="season" cols="50" rows="5" class="wenbenkuang" id="season"></textarea></td>
            </tr>
            <tr>
              <td height="30">&nbsp;</td>
              </tr>
            <tr>
              <td height="30">&nbsp;</td>
              </tr>
            <tr>
              <td height="30"><div align="right">��������</div></td>
              <td rowspan="3"><textarea name="result" cols="50" rows="5" class="wenbenkuang" id="result"></textarea></td>
            </tr>
            <tr>
              <td height="30">&nbsp;</td>
              </tr>
            <tr>
              <td height="30">&nbsp;</td>
              </tr>
            <tr>
              <td height="40" colspan="2">
                  <div align="center">
                    <input name="Submit2" type="button" class="buttons" value=" ȷ �� Ͷ �� " onClick="checks()">
                    <input name="Submit3" type="reset" class="buttons" value=" ��  �� ">
                  </div></td>
              </tr></form>
          </table></td>
      </tr>
    </table>
	<%}
	if(request.getParameter("type").equals("������ѯ")){%>
			<table width="580" height="566" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20">&nbsp;�ͷ����� --&gt;&gt; ������ѯ</td>
      </tr>
      <tr>
        <td>
		<%if(request.getParameter("search")==null){%>
		<table width="520" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="520" height="50"><div align="center">
                <div align="center" style="font-size: 18px;color: #FF0000;font-weight: bold; ">�� �� �� ѯ</div>
              </div></td>
              </tr>
            <tr>
              <td height="180"><table width="520" height="150" border="0" cellpadding="0" cellspacing="0">
                <form name="form3" method="post" action=""><tr>
                  <td width="201"><div align="right">�� �� �� �ƣ�
                    <input type="hidden" name="type" value="������ѯ">
					<input type="hidden" name="search" value="������ѯ">
                  </div></td>
                  <td width="319">
                    <input name="name" type="text" class="wenbenkuang" id="name" value="">                 </td>
                </tr>
                <tr>
                  <td><div align="right">�� �� �� �ţ�</div></td>
                  <td><input name="numbers" type="text" class="wenbenkuang" id="numbers" value=""></td>
                </tr>
                <tr>
                  <td colspan="2">
                      <div align="center">
                        <input name="Submit4" type="submit" class="buttons" value=" ��  ѯ ">
                        <input name="Submit5" type="reset" class="buttons" value=" ��  �� ">
                      </div></td>
                  </tr> </form>
              </table></td>
              </tr>
            <tr>
              <td><table width="520" height="230" border="0" cellpadding="0" cellspacing="0" class="table">
                <tr>
                  <td valign="top">&nbsp;
				  <%File files1=new File(application.getRealPath("/Text"),"SparePart.dll");
				       int size1=(int)files1.length();
				  	FileInputStream filein1=new FileInputStream(files1);
					byte[] buffer1=new byte[size1];
					filein1.read(buffer1);
					String str1=new String(buffer1);
				  %>
				  <%=str1%>
				  </td>
                </tr>
              </table></td>
            </tr>
          </table>
		  <%}else{%>
				<table width="520" height="450" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="520" height="50"><div align="center">
                <div align="center" style="font-size: 18px;color: #FF0000;font-weight: bold; ">�� �� �� ѯ</div>
              </div></td>
              </tr>
            <tr>
              <td valign="top"><table width="480" height="70" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="10">&nbsp;</td>
                  <td height="10" colspan="2">&nbsp;</td>
                  <td height="10">&nbsp;</td>
                  </tr>
                <tr bgcolor="#efefef">
                  <td width="93" height="20" class="br"><div align="center">���</div></td>
                  <td width="178" height="20" class="br"><div align="center">����</div></td>
                  <td width="134" class="br"><div align="center">ƥ�䳵��</div></td>
                  <td height="20" class="br"><div align="center">�۸�Ԫ��</div></td>
                  </tr>
						<%
					sql="select * from tb_SparePart where Name like '%"+request.getParameter("name")+"%' and Number like '%"+request.getParameter("numbers")+"%'";
		  	        rs=data.getrs(sql);
					rst.size=10;
                    vari=request.getParameter("pages");
					if(vari==null){
						pages=1;
						}
					 else{
						pages=Integer.parseInt(vari);
						}
					 rst.page=pages;
					 rla="name="+request.getParameter("name")+"&numbers="+request.getParameter("numbers")+"&type=������ѯ&search=1&";
					 rs=rst.getrs(rs);
					 nows=0;
					while(rs!=null&&rs.next()&&(nows<rst.size)){
						nows=nows+1;
					%>
                <tr>
                  <td height="20"><div align="center"><%=rs.getString("Number")%></div></td>
                  <td height="20"><div align="center"><a href="#" onClick="javascript:window.open('SparePart_Change.jsp?id=<%=rs.getInt("ID")%>','','width=380,height=210,toolbar=no,location=no,status=no,menubar=no')" style=" color:#000000 "><%=rs.getString("Name")%></a></div></td>
                  <td height="20"><div align="center"><%=rs.getString("Type")%></div></td>
                  <td height="20"><div align="center"><%=rs.getString("Price")%></div></td>
                  </tr>
                <%}
data.close();
%>
                <tr>
                  <td height="20" colspan="4">
                    <div align="right">
                      <%
		pagecount=rst.getavg();
		if(pagecount>1){
			if(pages==1){
			out.write("<a href='Customers.jsp?"+rla+"pages="+(pages+1)+"' style='color:#000000 '>��һҳ</a>");
			}
			else{
			if(pages<pagecount){
			out.write("<a href='Customers.jsp?"+rla+"pages="+(pages-1)+"' style='color:#000000 '>��һҳ</a>");
			out.write("<a href='Customers.jsp?"+rla+"pages="+(pages+1)+"' style='color:#000000 '>��һҳ</a>");
			}
			else{
			out.write("<a href='Customers.jsp?"+rla+"pages="+(pages-1)+"' style='color:#000000 '>��һҳ</a>");
			}
			}
		}		%>
                  </div></td>
                </tr>
              </table></td>
            </tr>
            <tr><form name="form4" method="post" action="Customers.jsp">
              <td height="20" valign="top"><div align="center">
                <input type="hidden" name="type" value="������ѯ">
                  <input name="Submit6" type="submit" class="wenbenkuang" value="  ��  ��  ">

              </div></td></form>
            </tr>
          </table>

		  <%}%>
		  </td>
      </tr>
    </table>
	<%}%>
	<%if(request.getParameter("type").equals("�ۺ����")){%>
	  <%order.setfile(application.getRealPath("/Text"),"Customers.txt");%>
  		<%order.setsize(566,500);%>
  		<%order.setname("�ͷ�����"," �� �� �� �� ");%>
		<%=order.gettable()%>
	<%}%>
	<%if(request.getParameter("type").equals("")){%>
	<%=cus.gettable()%>
	<%}}%>
	</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
