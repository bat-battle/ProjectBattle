<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.Integer" %>
<% request.setCharacterEncoding("gb2312");%>
<html>
<head>
<title>�����������ۼ�����վ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="session" class="cars.Bean1" />
<jsp:useBean id="search" scope="page" class="cars.SearchTable" />
<jsp:useBean id="rst" scope="session" class="cars.Pages" />
<jsp:useBean id="news" scope="page" class="cars.NewsShow" />
<%!
	String sql;
	String vari;
	int i;
	int pagecount;
	int pages;
	int nows;
	int start=0;
	ResultSet rs;
%>
<link rel="stylesheet" href="Css/style.css">
<Script src="Js/PopMenu.js"></script>
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<Script src="Js/PopMenu.js"></script>
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<%@ include file="Top.jsp" %>
<table width="744" height="600" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="600" valign="top"><table width="164" height="597" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160" height="20" bgcolor="#FFCC99">&nbsp;<a href="News.jsp" style="color:#000000 ">���ĵ���</a></td>
      </tr>
      <tr>
        <td height="100" valign="top"><table width='140' height='100' border='0' align='center' cellpadding='0' cellspacing='0'>
          <tr><form name="form11" method="post" action="News.jsp">
            <td height='25'><div align='center'><a href="javascript:form11.submit()" style="color:#000000 ">�� �� �� ��</a>
                <input type="hidden" name="type" value="���ű���">
            </div></td></form>
          </tr>
          <tr><form name="form2" method="post" action="News.jsp">
            <td height='25'><div align='center'><a href="javascript:form2.submit()" style="color:#000000 ">�� �� �� ��</a>
				<input type="hidden" name="type" value="�³�����">
			</div></td></form>
          </tr>
          <tr><form name="form3" method="post" action="News.jsp">
            <td height='25'><div align='center'><a href="javascript:form3.submit()" style="color:#000000 ">�� �� �� ��</a>
				<input type="hidden" name="type" value="���Ŷ���">
			</div></td></form>
          </tr>
          <tr><form name="form4" method="post" action="News.jsp">
            <td height='25'><div align='center'><a href="javascript:form4.submit()" style="color:#000000 ">վ �� �� ��</a>
				<input type="hidden" name="type" value="վ�ڹ���">
			</div></td></form>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;վ������</td>
      </tr>
      <tr>
        <td height="120"><%=search.getsearch()%></td>
      </tr>
      <tr>
        <td height="20" valign="middle" bgcolor="#FFCC99">&nbsp;������Ϣ</td>
      </tr>
      <tr>
        <td height="313" valign="top"><%=news.getstring()%></td>
      </tr>
    </table> </td>
    <td width="580" valign="top">
	<% if(request.getParameter("type")==null){%>
<table width="580" height="600" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20">&nbsp;<a href="javascript:form11.submit()" style="color:#000000 ">���ű���</a></td>
        <td height="20"> &nbsp;<a href="javascript:form2.submit()" style="color:#000000 ">�³�����</a></td>
      </tr>
      <tr valign="top">
        <td width="290" height="280">
		<table width="280" border="0" align="center" cellpadding="0" cellspacing="0">
          <% sql="select * from tb_News where Type='���ű���' order by IssueDate Desc";
		  	rs=data.getrs(sql);
			rs.beforeFirst();
			while(rs.next()&&start<10){
				start=start+1;
			%>
		  <tr>
            <td height="20">&nbsp;<%="<a href='#'onClick=javascript:window.open('News_Particular.jsp?id="+rs.getInt("ID")+"','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs.getString("Title")+"</a>" %></td>
          </tr>
		  <%}
		  start=0;
		  data.close();
		  %>
        </table>
		</td>
        <td width="290" height="280"><table width="280" border="0" align="center" cellpadding="0" cellspacing="0">
          <% sql="select * from tb_News where Type='�³�����' order by IssueDate Desc";
		  	rs=data.getrs(sql);
			rs.beforeFirst();
			while(rs.next()&&start<10){
				start=start+1;
			%>
          <tr>
            <td height="20">&nbsp;<%="<a href='#'onClick=javascript:window.open('News_Particular.jsp?id="+rs.getInt("ID")+"','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs.getString("Title")+"</a>" %></td>
          </tr>
          <%}
		  start=0;
		  data.close();
		  %>
        </table></td>
      </tr>
      <tr>
        <td width="282" valign="middle" bgcolor="#FFCC99">&nbsp;<a href="javascript:form3.submit()" style="color:#000000 ">���Ŷ���</a></td>
        <td height="20" valign="middle" bgcolor="#FFCC99">&nbsp;<a href="javascript:form4.submit()" style="color:#000000 ">վ�ڹ���</a></td>
      </tr>
      <tr>
        <td height="240" valign="top"><table width="280" border="0" align="center" cellpadding="0" cellspacing="0">
          <% sql="select * from tb_News where Type='���Ŷ���' order by IssueDate Desc";
		  	rs=data.getrs(sql);
			rs.beforeFirst();
			while(rs.next()&&start<10){
				start=start+1;
			%>
          <tr>
            <td height="20">&nbsp;<%="<a href='#'onClick=javascript:window.open('News_Particular.jsp?id="+rs.getInt("ID")+"','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs.getString("Title")+"</a>" %></td>
          </tr>
          <%}
		  start=0;
		  data.close();
		  %>
        </table></td>
        <td width="292" height="260" valign="top"><table width="280" border="0" align="center" cellpadding="0" cellspacing="0">
          <% sql="select * from tb_News where Type='վ�ڹ���' order by IssueDate Desc";
		  	rs=data.getrs(sql);
			rs.beforeFirst();
			while(rs.next()&&start<10){
				start=start+1;
			%>
          <tr>
            <td height="20">&nbsp;<%="<a href='#'onClick=javascript:window.open('News_Particular.jsp?id="+rs.getInt("ID")+"','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs.getString("Title")+"</a>" %></td>
          </tr>
          <%}
		  start=0;
		  data.close();
		  %>
        </table></td>
      </tr>
    </table>
	<%  }else{%>
<table width="580" height="600" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20">&nbsp;<% if(request.getParameter("type")==null){ out.write("��������");}else{%><%=request.getParameter("type")%><%}%></td>
        </tr>
      <tr valign="top">
        <td height="580">
	<table width="570" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
 <%
 	if(request.getParameter("type")==null){
   sql="select * from tb_News where Type='���ű���' or Type='���Ŷ���' or Type='�³�����' or Type='վ�ڹ���' order by IssueDate";
   }
   else{
   sql="select * from tb_News where Type='"+request.getParameter("type")+"' order by IssueDate";
   }
   rst.size=17;
   vari=request.getParameter("pages");
   if(vari==null){
	pages=1;
   }
   else{
	pages=Integer.parseInt(vari);
   }
   rst.page=pages;
   rs=data.getrs(sql);
   rs=rst.getrs(rs);
   nows=0;
   while(rs.next()&&(nows<rst.size)){
	nows=nows+1;
	%>
       <tr>
         <td>&nbsp;</td>
         </tr>
       <tr>
            <td height="20" class="bottm"> &nbsp;<%=rs.getString("Type")%>&nbsp;&nbsp;&nbsp;<%="<a href='#'onClick=javascript:window.open('News_Particular.jsp?id="+rs.getInt("ID")+"','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs.getString("Title")+"</a>" %></td>
            </tr>
	<%}%>
       <tr>
         <td height="20" class="bottm">
		 <div align="right">
		<%
		pagecount=rst.getavg();
		if(pagecount>1){
			if(pages==1){
			out.write("nexe");
			}
			else{
			if(pages<pagecount){
			out.write("prev");
			out.write("next");
			}
			else{
			out.write("prev");
			}
			}
		}
		data.close();
		%>
		 </div>
	</td>
         </tr>
        </table>
	</td>
        </tr>
    </table>
	<%}%>
	</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
