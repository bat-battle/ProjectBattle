<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="qu" scope="page" class="com.mingri.info.QuestString"/>
<jsp:useBean id="trans" scope="page" class="com.mingri.chinese.ToChinese"/>
<html>
  <title>���۽��˲�ѯ</title>
  <link href="../../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<%
   String table="tb_rkjz",httpFile="rkjzquest.jsp";
   String date="jkdate";
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
    <td width="202" height="27" bgcolor="#E9F2F6">���Ʊ��:
      <%=rs.getString("ID")%></td>
    <td width="202" bgcolor="#E9F2F6">���Ʊ��:
      <%=rs.getString("rkid")%></td>
    <td width="202" bgcolor="#E9F2F6">��Ӧ�����ƣ�
      <%=rs.getString("gysname")%></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td width="195" height="27" bgcolor="#E9F2F6">���ν�
      <%=rs.getString("bcjk")%></td>
    <td width="202" bgcolor="#E9F2F6">���:
      <%=rs.getString("ye")%></td>
    <td width="202" bgcolor="#E9F2F6">������ڣ�
      <%=rs.getString("jkdate")%></td>
  </tr>
  <tr bgcolor="#DDDDDD">
    <td width="202" height="29" bgcolor="#E9F2F6">����Ա:
      <%=rs.getString("czy")%></td>
    <td colspan="2" bgcolor="#E9F2F6">������:
      <%=rs.getString("jsr")%></td>
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


















