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
<jsp:useBean id="rst" scope="page" class="cars.Pages" />
<jsp:useBean id="search" scope="page" class="cars.SearchTable" />
<%!
	String sql;
	int i;
	ResultSet rs;
	int row;
	int number;
	String keyword,type;
	String vari;
	String rla;
	int pagecount;
	int pages;
	int nows;
%>
<link rel="stylesheet" href="Css/style.css">
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<%@ include file="Top.jsp" %>
<table width="740" height="588" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="700" valign="top"><table width="164" height="724" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160" height="20" bgcolor="#FFCC99">&nbsp;���ĵ���</td>
      </tr>
      <tr>
        <td height="100" valign="middle">
      <%
	menu.add(" ��&nbsp;&nbsp; ��&nbsp;&nbsp; �� ","");
	menu.add(" ��&nbsp;&nbsp; ��&nbsp;&nbsp; �� ","���ó�");
	menu.add(" ��&nbsp;&nbsp; ��&nbsp;&nbsp; �� ","���޳�");
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
        <td height="243" valign="top"><%=news.getstring()%></td>
      </tr>
      <tr>
        <td height="20" valign="middle" bgcolor="#FFCC99">&nbsp;��ҵ����</td>
      </tr>
 <tr>
        <td height="100" valign="middle"><table width="160" height="100" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><div align="center"><a href="#"><img src="Image/mrflag.gif" width="136" height="38" border="0"></a></div></td>
          </tr>
          <tr>
            <td><div align="center"><a href="#"><img src="Image/ssph.gif" width="135" height="41" border="0"></a></div></td>
          </tr>
        </table></td>
      </tr>
    </table>    </td>
    <td width="576" valign="top">
	<% if(request.getParameter("type")==null||request.getParameter("type").equals("")){%>
	<table width="582" height="724" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td width="578" height="20" colspan="2">&nbsp;<a href="Usher.jsp" style="color:#000000 ">չʾ����</a> --&gt;&gt; ���ó�</td>
      </tr>
      <tr>
        <td colspan="2" valign="middle" align="center">
		                <%
			if(request.getParameter("id")==null){
			rs=cross.getrs(1);
			}
			else{
			rs=cross.getrs(1,Integer.parseInt(request.getParameter("id")));
			}
			if(rs!=null){
				rs.beforeFirst();
			if(rs!=null&&rs.next()){
			number=rs.getInt("Logo");
			%>
		<table width="574" height="226" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="298" height="200" class="br">
                <table width="280" height="210" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm"><div align="center"><img src="Image/<%=rs.getString("���ͼƬ")%>" width="273" height="180"  alt="<%=rs.getString("Ʒ��")%> <%=rs.getString("�ͺ�")%>"> </div></td>
                  </tr>
                  <tr>
                    <form name="form2" method="post" action="">
                      <td height="30"><div align="center"></div>
                          <div align="center">
                            <input name="Submit32" type="button" class="buttons" value=" �� ϸ �� �� " onClick="javascript:location.href='Cars_Particular_Default.jsp?id=<%=rs.getInt("Logo")%>&type=1'">
                            <input name="Submit22" type="submit" class="buttons" value=" �� �� �� �� " onClick="javascript:window.open('OrderForm.jsp?action=<%=rs.getString("Ʒ��")%> <%=rs.getString("�ͺ�")%>','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no')">
                        </div></td>
                    </form>
                  </tr>
                </table>
                <%%>
              </td>
              <td width="276" class="bottm"><table width="270" height="220" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="br"><div align="center"><img src="Image/<%=rs.getString("���ͼƬ")%>" width="110" height="90"></div></td>
                    <td class="bottm"><div align="center"><img src="Image/<%=rs.getString("����ͼƬ")%>" width="110" height="90"></div></td>
                  </tr>
                  <tr>
                    <td class="br"><div align="center"><img src="Image/<%=rs.getString("����ͼƬ")%>" width="110" height="90"></div></td>
                    <td class="bottm"><div align="center"><img src="Image/<%=rs.getString("��ɫͼƬ")%>" width="110" height="90"></div></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="230" colspan="2" valign="top">
          <%rs=cross.getrs(1);
			if(rs!=null){
				rs.last();
				int sum=rs.getRow();
                if(sum>6){row=2;}else{row=1;}
				rs.beforeFirst();
		%>
          <table width="578" height="230" border="0" cellpadding="0" cellspacing="0">
            <%for(int j=1;j<=row;j++){%>
            <tr>
              <%while(rs!=null&&rs.next()){
				if(rs.getInt("Logo")!=number){%>
              <td valign="top"><div align="center">
                  <table width="110" height="110" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td class="br"><div align="center"><img src="Image/<%=rs.getString("���ͼƬ")%>" width="101" height="80"></div></td>
                    </tr>
                    <tr>
                      <td height="20" class="bottm"><div align="center"><a href="Usher.jsp?id=<%=rs.getInt("Logo")%>"><%=rs.getString("Ʒ��")%> <%=rs.getString("�ͺ�")%></a></div></td>
                    </tr>
                  </table>
              </div></td>
              <%}}%>
            </tr>
            <%}%>
          </table>
          <%}%>
        </td>
      </tr>
      <tr>
        <td height="230" colspan="2" valign="middle" align="center">
          <div id="Layer1" align="left" style="position:insert; width:560px; height:200px; z-index:101"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <%rs=cross.getrs(1);
			if(rs!=null){
				rs.beforeFirst();
			while(rs!=null&&rs.next()){
				if(rs.getInt("Logo")==number){out.print(rs.getString("���ּ��"));}
				}
			}%>
			 </div>
			<%}else{
				out.print("��û�з����κγ��ó���������Ϣ");
				}}
			%>
       </td>
      </tr>
    </table>
	<%
	}
	else{
	if(request.getParameter("type").equals("���޳�")){%>
	<table width="582" height="724" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20">&nbsp;<a href="Usher.jsp" style="color:#000000 ">չʾ����</a> --&gt;&gt; ���޳�</td>
      </tr>
      <tr>
        <td valign="top">
		<%
                    rst.size=5;
                  	vari=request.getParameter("pages");
					if(vari==null){
						pages=1;
						}
					 else{
						pages=Integer.parseInt(vari);
						}
					 rst.page=pages;
					 rs=cross.getrs(4);
					 rla="type=���޳�&";
					 rs=rst.getrs(rs);
					 nows=0;
					while(rs!=null&&rs.next()&&(nows<rst.size)){
						nows=nows+1;
					%>
		<table width="540" height="119" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="95" class="br"><div align="center"><img src="Image/<%=rs.getString("ͼƬ")%>" alt="����" width="101" height="80"></div></td>
            <td width="358" height="140" rowspan="3" class="br"><table width="343" height="120" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="99" height="20"><div align="right">�������ã�</div></td>
                <td width="244" height="20"><%=rs.getString("�۸�")%></td>
              </tr>
              <tr>
                <td height="20"><div align="right">��ʱ���ã�</div></td>
                <td height="20"><%=rs.getString("��ʱ����")%>Ԫ/ʱ</td>
              </tr>
              <tr>
                <td height="20"><div align="right">����̷��ã�</div></td>
                <td height="20"><%=rs.getString("����̷���")%>Ԫ/����</td>
              </tr>
              <tr>
                <td height="20"><div align="right">���ð�����</div></td>
                <td height="20"><%=rs.getString("������Ŀ")%></td>
              </tr>
              <tr>
                <td height="20"><div align="right">�����ã�</div></td>
                <td height="20"><%=rs.getString("������Ŀ")%></td>
              </tr>
              <tr>
                <td>
                    <div align="center">��ע</div>
                  </td>
                <td><%=rs.getString("��ע")%> </td>
              </tr>
            </table></td>
          </tr>
          <tr><form name="form3" method="post" action="">
            <td height="20" class="bottm">
              <div align="center">
                <input name="Submit4" type="button" class="buttons" value=" �� �� Ԥ �� "onClick="javascript:window.open('Destine.jsp?type=<%=rs.getString("����")%>','','width=500,height=450,toolbar=no,location=no,status=no,menubar=no')">
              </div>
            </td></form>
          </tr>
        </table>
		<%}%>
	      </td>
        </tr>
      <tr>
        <td height="20" valign="top"><div align="right">
		<%
		pagecount=rst.getavg();
		if(pagecount>1){
			if(pages==1){
			out.write("<a href='Usher.jsp?"+rla+"pages="+(pages+1)+"' style='color:#000000 '>��һҳ</a>");
			}
			else{
			if(pages<pagecount){
			out.write("<a href='Usher.jsp?"+rla+"pages="+(pages-1)+"' style='color:#000000 '>��һҳ</a>");
			out.write("<a href='Usher.jsp?"+rla+"pages="+(pages+1)+"' style='color:#000000 '>��һҳ</a>");
			}
			else{
			out.write("<a href='Usher.jsp?"+rla+"pages="+(pages-1)+"' style='color:#000000 '>��һҳ</a>");
			}
			}
		}
		%>
		</div></td>
      </tr>
    </table>
	<%}%>
	<%if(request.getParameter("type").equals("���ó�")){%>
	<table width="582" height="724" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td width="578" height="20" colspan="2">&nbsp;<a href="Usher.jsp" style="color:#000000 ">չʾ����</a> --&gt;&gt; ���ó�</td>
      </tr>
      <tr>
        <td colspan="2" valign="middle" align="center">
		                <%
			if(request.getParameter("id")==null){
			rs=cross.getrs(3);
			}
			else{
			rs=cross.getrs(3,Integer.parseInt(request.getParameter("id")));
			}
			if(rs!=null){
				rs.beforeFirst();
			if(rs!=null&&rs.next()){
			number=rs.getInt("Logo");
			%>
		<table width="574" height="226" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="298" height="200" class="br">
                <table width="280" height="210" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm"><div align="center"><img src="Image/<%=rs.getString("���ͼƬ")%>" width="273" height="180"  alt="<%=rs.getString("Ʒ��")%> <%=rs.getString("�ͺ�")%>"> </div></td>
                  </tr>
                  <tr>
                    <form name="form2" method="post" action="">
                      <td height="30"><div align="center"></div>
                          <div align="center">
                            <input name="Submit32" type="button" class="buttons" value=" �� ϸ �� �� " onClick="javascript:location.href='Cars_Particular_Default.jsp?id=<%=rs.getInt("Logo")%>&type=1'">
                            <input name="Submit22" type="submit" class="buttons" value=" �� �� �� �� " onClick="javascript:window.open('OrderForm.jsp?action=<%=rs.getString("Ʒ��")%> <%=rs.getString("�ͺ�")%>','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no')">
                        </div></td>
                    </form>
                  </tr>
                </table>
                <%%>
              </td>
              <td width="276" class="bottm"><table width="270" height="220" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="br"><div align="center"><img src="Image/<%=rs.getString("���ͼƬ")%>" width="110" height="90"></div></td>
                    <td class="bottm"><div align="center"><img src="Image/<%=rs.getString("����ͼƬ")%>" width="110" height="90"></div></td>
                  </tr>
                  <tr>
                    <td class="br"><div align="center"><img src="Image/<%=rs.getString("����ͼƬ")%>" width="110" height="90"></div></td>
                    <td class="bottm"><div align="center"><img src="Image/<%=rs.getString("��ɫͼƬ")%>" width="110" height="90"></div></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="230" colspan="2" valign="top">
          <%rs=cross.getrs(3);
			if(rs!=null){
				rs.last();
				int sum=rs.getRow();
                if(sum>6){row=2;}else{row=1;}
				rs.beforeFirst();
		%>
          <table width="578" height="230" border="0" cellpadding="0" cellspacing="0">
            <%for(int j=1;j<=row;j++){%>
            <tr>
              <%while(rs!=null&&rs.next()){
				if(rs.getInt("Logo")!=number){%>
              <td valign="top"><div align="center">
                  <table width="110" height="110" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td class="br"><div align="center"><img src="Image/<%=rs.getString("���ͼƬ")%>" width="101" height="80"></div></td>
                    </tr>
                    <tr>
                      <td height="20" class="bottm"><div align="center"><a href="Usher.jsp?id=<%=rs.getInt("Logo")%>"><%=rs.getString("Ʒ��")%> <%=rs.getString("�ͺ�")%></a></div></td>
                    </tr>
                  </table>
              </div></td>
              <%}}%>
            </tr>
            <%}%>
          </table>
          <%}%>
        </td>
      </tr>
      <tr>
        <td height="230" colspan="2" valign="middle" align="center">
          <div id="Layer1" align="left" style="position:insert; width:560px; height:200px; z-index:101"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <%rs=cross.getrs(3);
			if(rs!=null){
				rs.beforeFirst();
			while(rs!=null&&rs.next()){
				if(rs.getInt("Logo")==number){out.print(rs.getString("���ּ��"));}
				}
			}%>
		    </div>
			<%}else{
				out.print("��û�з����κ����ó���������Ϣ");
				}}
			%>
       </td>
      </tr>
    </table>
	<%}%>
 <%}%>
	</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
