<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>�����������ۼ�����վ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
<jsp:useBean id="rst" scope="page" class="cars.Pages" />
<%!
	String sql;
	String keyword,type;
	String vari;
	int pagecount;
	int pages;
	int nows;
	ResultSet rs;
%>
<link rel="stylesheet" href="Css/style.css">
<Script src="Js/PopMenu.js"></script>
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<body bgcolor="#ffffff" topmargin="0" leftmargin="0">
<table width="744" height="60" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="f9f9f9">
  <tr>
    <td><div align="center"><img src="Image/Fla.jpg" width="740" height="200"> </div></td>
  </tr>
</table>
<table width="744" height="526" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="526" valign="top"><%@ include file="Manage_Left.jsp" %>    </td>
    <td width="580" valign="top"><table width="580" height="564" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20" colspan="2">&nbsp;<a href="Manage.jsp" style="color:#000000 ">��������</a></td>
      </tr>
      <tr>
        <td height="544" colspan="2" valign="middle"><div align="center">
          <table width="520" height="500" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="50"><div align="center">�� �� �� Ϣ �� ��</div></td>
            </tr>
            <tr>
              <td height="25"><div align="right"><a href="#" onClick="javascript:window.open('Cars_Add.jsp','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no')" style=" color:#000000 ">�����������</a>&nbsp;&nbsp;</div></td>
            </tr>
            <tr>
              <td height="25" valign="middle">
                <table width="480" height="20" border="0" align="center" cellpadding="0" cellspacing="0">
                  <form name="form1" method="post" action="Manage_Cars.jsp">
                    <tr>
                      <td width="68"><div align="right">�ؼ��֣�</div></td>
                      <td width="150"><input name="keyword" type="text" class="wenbenkuang" size="20"></td>
                      <td width="92"><div align="right">�ؼ������</div></td>
                      <td width="106"><select name="type" class="wenbenkuang">
                        <option value="Ʒ��" selected>Ʒ��</option>
                        <option value="�ͺ�">�ͺ�</option>
                        <option value="��ɫ">��ɫ</option>
                        <option value="����">����</option>
                        <option value="����">����</option>
                        <option value="����">����</option>
                                                                                                                                    </select></td>
                      <td width="64"><input name="Submit" type="submit" class="buttons" value="��ѯȷ��"></td>
                    </tr>
                  </form>
              </table></td>
            </tr>
            <tr>
              <td height="400" valign="top"><table width="480" height="70" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="10">&nbsp;</td>
                    <td height="10" colspan="2">&nbsp;</td>
                    <td width="78" height="10">&nbsp;</td>
                    <td height="10">&nbsp;</td>
                  </tr>
                  <tr bgcolor="#efefef">
                    <td width="52" height="20" class="br"><div align="center">������</div></td>
                    <td width="133" height="20" class="br"><div align="center">Ʒ��</div></td>
                    <td width="131" class="br"><div align="center">�ͺ�</div></td>
                    <td height="20" class="br"><div align="center">�۸���Ԫ��</div></td>
                    <td width="86" height="20" class="br"><div align="center">����</div></td>
                  </tr>
				                   <%
                    rst.size=16;
                  	vari=request.getParameter("pages");
					if(vari==null){
						pages=1;
						}
					 else{
						pages=Integer.parseInt(vari);
						}
					 rst.page=pages;
					
					 if(request.getParameter("keyword")==null||request.getParameter("keyword").equals("")){
					 rs=cross.getrs();
					 sql="";
					 }
					 else{
                     rs=cross.getrs(request.getParameter("type"),request.getParameter("keyword"));
					 sql="type="+request.getParameter("type")+"&keyword="+request.getParameter("keyword")+"&";
					 }
					 rs=rst.getrs(rs);
					 nows=0;
					while(rs!=null&&rs.next()&&(nows<rst.size)){
						nows=nows+1;
					%>
                  	<tr>
				  <form name="car<%=nows%>" method="post" action="">
                    <td height="20"><div align="center"><%=rs.getInt("Type")%></div></td>
                    <td height="20"><div align="center"><%=rs.getString("Ʒ��")%></div></td>
                    <td height="20"><div align="center"><%=rs.getString("�ͺ�")%></div></td>
                    <td height="20"><div align="center"><%=rs.getString("�ۼ�")%></div></td>
                    <td height="20"><div align="center">
                        <input name="Submit22" type="button" class="buttons" value="��ϸ" onClick="javascript:window.open('<%if(rs.getInt("Type")==1){%>Cars_Add.jsp<%}else{%>Cars_Add_S.jsp<%}%>?id=<%=rs.getInt("Logo")%>&type=<%=rs.getInt("Type")%>','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no')">
                        <input name="Submit2" type="button" class="buttons" value="ɾ��" onClick="javascript:window.open('Car_Delete.jsp?id=<%=rs.getInt("Logo")%>','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no')">
                    </div></td></form>
                  </tr>
				 <% }%>
                  <tr>
                    <td height="20" colspan="5">
                      <div align="right">
					  <%
		pagecount=rst.getavg();
		if(pagecount>1){
			if(pages==1){
			out.write("<a href='Manage_Cars.jsp?"+sql+"pages="+(pages+1)+"' style='color:#000000 '>��һҳ</a>");
			}
			else{
			if(pages<pagecount){
			out.write("<a href='Manage_Cars.jsp?"+sql+"pages="+(pages-1)+"' style='color:#000000 '>��һҳ</a>");
			out.write("<a href='Manage_Cars.jsp?"+sql+"pages="+(pages+1)+"' style='color:#000000 '>��һҳ</a>");
			}
			else{
			out.write("<a href='Manage_Cars.jsp?"+sql+"pages="+(pages-1)+"' style='color:#000000 '>��һҳ</a>");
			}
			}
		}
		%>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
          <table width="520" height="20" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td><div align="center">�����룺1--���ó� �� 3--���ó�</div></td>
            </tr>
          </table>
        </div></td>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
