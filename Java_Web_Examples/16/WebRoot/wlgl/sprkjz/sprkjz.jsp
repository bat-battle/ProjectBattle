<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="qu" scope="page" class="com.mingri.info.QuestString"/>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="calendar" scope="page" class="com.mingri.showtime.ShowTime"/>
<jsp:useBean id="trans" scope="page" class="com.mingri.chinese.ToChinese"/>
<html>
<title>��Ʒ�����Ϣ</title>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<link href="../../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<%
   //�Զ��������������Ʊ��
   String maxCount="select max(id) as maxid from tb_rkjz";
   String theMax="";
   ResultSet rsMax=rst.getResult(maxCount);
   if(rsMax.next()){
     theMax=rsMax.getString(1);
   }
   //������Ʊ�����ַ�"JK"����ϵͳ���ڼ���λ���ֱ������
   String jkph="JK"+calendar.getDateString()+(Integer.parseInt(theMax.substring(10))+1);
//��������������������������������������������������������������������������������������������������������������������
   //��ҳ��ʾ�����Ʊ�ű�(tb_rkph)�е���Ϣ
   String pages=request.getParameter("pages");//���յ�ǰҳ����������ҳ��ʾ
   String cif=request.getParameter("cif");//���ղ�ѯ����
   String ccif=request.getParameter("ccif");//���ղ�ѯ����
   String qvalue=trans.trans(request.getParameter("qvalue"));//���ղ�ѯ�ؼ���
   String table="tb_rkph";//������Ҫ��ѯ�ı���
   String httpFile="sprkjz.jsp";//���崦�������JSP�ļ�
   //����ѯ����Ҫ��������JavaBean������
   qu.setCif(cif);qu.setQValue(qvalue);qu.setCcif(ccif);
   qu.setPageSize(1);//����ÿҳ��ʾ�ļ�¼��Ϊ1��
   String strCount=qu.getXSCount(table);//�����Ҫ��ѯ�ļ�¼����
   if(pages==null||pages.equals("null")){
     pages="0";
   }
   //����JavaBean�еķ���������Bean�е�һЩ����(��Ҫ�Ƿ�ҳ����Ҫ������)
   qu.setQuerySql(httpFile,pages,strCount);
   //�������Ҫ��ѯ�Ľ����
   ResultSet rs=rst.getResult((String)qu.getXSString(table));
   //��ȡ��ǰҳ����ÿҳ��ʾ�ļ�¼��
   int i=0,Page=qu.getCurPage(),pagesize=qu.getPageSize();
   while(rs.next()){
     if(i>(Page-1)*pagesize-1){
%><form name="form1" action="sprkPayFor.jsp" method="POST">
   <table width="450" height="112"  border="0" align="center" cellpadding="1" cellspacing="1">

        <tr><td height="25">���Ʊ��:
          <input type="text" name="rkph" readonly="readonly" value="<%=rs.getString("rkph")%>">
              <font color="#585858"></font></td>
            <td>��&nbsp;&nbsp;��:<input type="text" name="sl" readonly="readonly"
                         value="<%=rs.getString("sl")%>">
              <font color="#585858"></font></td>
        </tr>
        <tr><td height="25">��Ӧ��:
          <input type="text" name="gysname" readonly="readonly"
                         value="<%=rs.getString("gysname")%>">
              <font color="#585858"></font></td>
            <td>Ӧ&nbsp;&nbsp;��:<input type="text" name="yf" readonly="readonly"
                         value="<%=rs.getString("yf").substring(0,rs.getString("yf").length()-2)%>">Ԫ
              <font color="#585858"></font></td>
        </tr>
        <tr><td height="25">ʵ&nbsp;&nbsp;&nbsp;&nbsp;��:
          <input type="text" name="sf" readonly="readonly"
                         value="<%=rs.getString("sf").substring(0,rs.getString("sf").length()-2)%>">Ԫ
              <font color="#585858"></font></td>
             <td>δ&nbsp;&nbsp;��:<input type="text" name="wf" readonly="readonly"
                         value="<%=rs.getString("wf").substring(0,rs.getString("wf").length()-2)%>">Ԫ
              <font color="#585858"></font></td>
        </tr>
        <tr><td height="25">�������:
          <input type="text" name="rkdate" readonly="readonly"
                         value="<%=rs.getString("rkdate").substring(0,10)%>">
              <font color="#585858"></font></td>
            <td>����Ա:<input type="text" name="czy" readonly="readonly"
                         value="<%=rs.getString("czy")%>">
              <font color="#585858"></font></td>
        </tr>
        <tr><td height="25">���㷽ʽ:
          <input type="text" name="jsfs" readonly="readonly"
                         value="<%=rs.getString("jsfs")%>">
              <font color="#585858"></font></td>
             <td>������:<input type="text" name="jsr" readonly="readonly"
                         value="<%=rs.getString("jsr")%>">
              <font color="#585858"></font></td>
        </tr>
  </table>

    <table width="450" height="10"  border="0" align="center" cellpadding="1" cellspacing="1">
       <tr><td height="25">���Ʊ��:<input type="text" name="jkph" readonly="readonly"
                         value="<%=jkph%>">
              <font color="#585858"></font></td>
           <td>�������:<input type="text" name="jkdate" readonly="readonly"
                         value="<%=calendar.getDate()%>">
              <font color="#585858"></font></td>
        </tr>
       <tr><td height="25">���ν��:<input type="text" name="bcjk" onBlur="autoje()">
              <font color="#585858"></font></td>
           <td>��&nbsp;&nbsp;&nbsp;&nbsp;��:<input type="text" name="ye" readonly="readonly">
              <font color="#585858"></font></td>
        </tr>
        <tr><td height="25">��&nbsp;��&nbsp;Ա:<input type="text" name="czy1" readonly value="<%=session.getAttribute("username")%>">
              <font color="#585858"></font></td>
            <td>��&nbsp;��&nbsp;��:<input type="text" name="jsr1"></td>
        </tr>
        <tr><td height="40" colspan="2" align="center"><input name="submit1"  type="button" class="btn_grey"  onclick="check()" value="ȷ��">
        &nbsp;
        <input type="reset" class="btn_grey" value="ȡ��" onClick="myreset()"></td></tr>
    </table> 
</form>
<%}i++;}
rs.close();
String str_parameter="&cif="+qu.getCif()+"&ccif="+qu.getCcif()+"&qvalue="+qu.getQValue()+"";
session.setAttribute("str_parameter",str_parameter);
qu.setStr_parameter(str_parameter);
%>
<%=qu.pageFooter()%>
  </body>
</html>
<script language="javascript">
function autoje()
{
  if(form1.wf.value-form1.bcjk.value<0){
    alert("����Ӧ����δ�����!");form1.bcjk.focus();return;}
  form1.ye.value=form1.wf.value-form1.bcjk.value;
}
function check()
{
  if(form1.bcjk.value==0){
    alert("��������˽��!");form1.bcjk.focus();return;}
  if(form1.jsr.value==0){
    alert("�����뾭����!");form1.jsr.focus();return;}
  if(isNaN(form1.bcjk.value)){
    alert("�������,����������!");form1.bcjk.focus();return;}
  form1.submit();
}
function myreset()
{
  form1.bcjk.value="";form1.ye.value="";form1.jsr1.value="";
}
</script>












