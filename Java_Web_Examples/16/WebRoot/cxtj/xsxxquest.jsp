<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="qu" scope="page" class="com.mingri.info.QuestString"/>
<jsp:useBean id="trans" scope="page" class="com.mingri.chinese.ToChinese"/>
<html>
  <title>������Ϣ��ѯ</title>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<%
   String table="tb_sell",httpFile="xsxxquest.jsp";
   String date="xsdate";
   String pages=request.getParameter("pages");
   String cif=request.getParameter("cif");
   String ccif=request.getParameter("ccif");
   String qvalue=trans.trans(request.getParameter("qvalue"));
   String andor=request.getParameter("andor");
   String sdate=request.getParameter("sdate");//��ñ��в�ѯ��ʼʱ��
   String edate=request.getParameter("edate");//��ñ��в�ѯ��ֹʱ��
   qu.setCcif(ccif);qu.setCif(cif);qu.setQValue(qvalue);
   qu.setAndor(andor); qu.setSdate(sdate); qu.setEdate(edate);
   //String strCount=qu.getCount(table);
   //����Bean��getDateCount()������������û����̵�ʱ������ѯ���ļ�¼����
   String strCount=qu.getDateCount(table,date);
   if(pages==null||pages.equals("null")){
     pages="0";
   }
   qu.setQuerySql(httpFile,pages,strCount);
   //��������ڱ�tb_sell�����û��ύ��ʱ������ѯ���ļ�¼�Ľ����
   ResultSet rs=rst.getResult((String)qu.getDateString(table,date));
   int i=0,Page=qu.getCurPage(),pagesize=qu.getPageSize();
   while(rs.next()){
     if(i>(Page-1)*pagesize-1){
%>

<table width="98%" height="140" border="0" align="center" cellpadding="0" cellspacing="1" class="table1">
  <tr bgcolor="#DDDDDD">
    <td width="202" height="27" bgcolor="#E9F2F6">����Ʊ��:
      <%=rs.getString("ID")%></td>
    <td width="202" bgcolor="#E9F2F6">��Ʒ���:
      <%=rs.getString("spid")%></td>
    <td width="202" bgcolor="#E9F2F6">��Ʒ���ƣ�
      <%=rs.getString("spname")%></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td width="195" height="27" bgcolor="#E9F2F6">���:
      <%=rs.getString("jc")%></td>
    <td width="202" bgcolor="#E9F2F6">����:
      <%=rs.getString("cd")%></td>
    <td width="202" bgcolor="#E9F2F6">���:
      <%=rs.getString("gg")%></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td width="202" height="29" bgcolor="#E9F2F6">��װ:
      <%=rs.getString("bz")%></td>
    <td width="202" bgcolor="#E9F2F6">����:
      <%=rs.getString("dj")%></td>
    <td width="202" bgcolor="#E9F2F6">����:
      <%=rs.getString("sl")%></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td width="202" height="26" bgcolor="#E9F2F6">���:
      <%=rs.getString("je")%></td>
    <td width="202" bgcolor="#E9F2F6">�ͻ�ȫ��:
      <%=rs.getString("khname")%></td>
    <td width="202" bgcolor="#E9F2F6">��������:
      <%=rs.getString("xsdate").substring(0,10)%></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td width="202" bgcolor="#E9F2F6">����Ա:
      <%=rs.getString("czy")%></td>
    <td width="202" bgcolor="#E9F2F6">������:
      <%=rs.getString("jsr")%></td>
    <td width="202" bgcolor="#E9F2F6">���㷽ʽ:
      <%=rs.getString("jsfs")%></td>
  </tr>
</table>
<br>
<%}i++;}
rs.close();
String str_parameter="&cif="+qu.getCif()+"&ccif="+qu.getCcif()+"&qvalue="+qu.getQValue()+
                     "&andor="+qu.getAndor()+"&sdate="+qu.getSdate()+"&edate="+qu.getEdate();
qu.setStr_parameter(str_parameter);
%>
<%=qu.pageFooter()%>
</form>
</table>
</body>
</html>


















