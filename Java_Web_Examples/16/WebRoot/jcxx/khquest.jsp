<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="qu" scope="page" class="com.mingri.info.QuestString"/>
<jsp:useBean id="trans" scope="page" class="com.mingri.chinese.ToChinese"/>
<html>
<title>�ͻ���ѯ�������ҳ��ʾ</title>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
    <link href="../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<%
   String table="tb_customer";//������Ҫ��ѯ�ı�����
   String httpFile="khquest.jsp";//���ô��������JSP�ļ�
   String pages=request.getParameter("pages");//���յ�ǰ�ǵڼ�ҳ
   String cif=request.getParameter("cif");//�����ѯ�ֶ�
   String ccif=request.getParameter("ccif");//�����ѯ�����
   //��ѯ�ؼ��֣�������ֵͨ�����Ĵ������û��������Ŀ�����ȷʶ��
   String qvalue=trans.trans(request.getParameter("qvalue"));
   //��QuestString����������ֵ
   qu.setCcif(ccif);qu.setCif(cif);qu.setQValue(qvalue);
   //����QuestString��getCount(String table)�����������ݲ�ѯ�����ó���Ҫ��ѯ��¼��������
   String strCount=qu.getCount(table);
   //�ж�pages�Ƿ�Ϊnull,���Ϊnull��pages��ֵ��Ϊ"0"
   if(pages==null||pages.equals("null")){
     pages="0";
   }
   //����QuestString��setQuerySql()����������Bean�е�����
   qu.setQuerySql(httpFile,pages,strCount);
   //����QuestString��getString()��������ÿ�ִ�е�SQL��䣬�����ResultSet
   ResultSet rs=rst.getResult((String)qu.getString(table));
   //��QuestString��ȡ����ǰҳ��ÿҳ��ʾ�ļ�¼��
   int i=0,Page=qu.getCurPage(),pagesize=qu.getPageSize();
   while(rs.next()){
     //�������ͱ���i��������¼ָ�붨λ������ʾҳ�ĵ�һ����¼��
     if(i>(Page-1)*pagesize-1){
%>
<!--ͨ��ѭ�������������ļ�¼ͨ�������ʽ�ڿͻ�����ʾ����-->
<table width="98%" height="110" border="0" align="center" cellpadding="0" cellspacing="1" class="table1">
  <tr>
    <td width="202" height="27" bgcolor="#E9F2F6">�ͻ�ȫ��:
      <%=rs.getString("khname")%></td>
    <td width="185" bgcolor="#E9F2F6">���:
      <%=rs.getString("khjc")%></td>
    <td width="195" bgcolor="#E9F2F6">��ַ:
      <%=rs.getString("address")%></td>
  </tr>
  <tr>
    <td width="202" height="27" bgcolor="#E9F2F6">�������룺
      <%=rs.getString("postcode")%></td>
    <td width="202" bgcolor="#E9F2F6">�绰:
      <%=rs.getString("tel")%></td>
    <td width="202" bgcolor="#E9F2F6">����:
      <%=rs.getString("fax")%></td>
  </tr>
  <tr>
    <td width="202" height="27" bgcolor="#E9F2F6">��ϵ�˵绰:
      <%=rs.getString("lxrtel")%></td>
    <td width="202" bgcolor="#E9F2F6">��ϵ��:
      <%=rs.getString("lxr")%></td>
    <td width="202" bgcolor="#E9F2F6">��������:
      <%=rs.getString("khyh")%></td>
  </tr>
  <tr>
    <td bgcolor="#E9F2F6">�����˺�:
      <%=rs.getString("yhzh")%></td>
    <td colspan="2" bgcolor="#E9F2F6">E-Mail:
      <%=rs.getString("Email")%></td>
  </tr>
</table>
<br>
<%}i++;}
rs.close();
String str_parameter="&cif="+qu.getCif()+"&ccif="+qu.getCcif()+"&qvalue="+qu.getQValue()+"";
//���÷�ҳ�������ӱ�ǩ<a>�Ĳ���
qu.setStr_parameter(str_parameter);
%>
<!--��ȡ��ҳ��-->
<%=qu.pageFooter()%>

</table>
</body>
</html>
