<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="calendar" scope="page" class="com.mingri.showtime.ShowTime"/>
<html>
<title>��Ʒ�����Ϣ</title>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<%
   request.setCharacterEncoding("gb2312");//���ַ���ͳһ���������ύ�е�������������
   String strSql="select * from tb_brand";
   String maxCount="select max(id) from tb_ruku";//�������в��ҳ�����id��
   ResultSet rs=rst.getResult(strSql);//�������б�����ʾ��Ʒ����
   String jc=""; String gg="";String bz="";String spid="";String spname="";
   String gysname="";String cd="";String dw="";String theMax="";
   String rkspname=(String)request.getParameter("rkspname");//����û���ѡ��Ʒ�ļ��
   String rkStr="select * from tb_brand where spname='"+rkspname+"'";
   ResultSet rs1=rst.getResult(rkStr);//������Ʒ���Ʋ�ѯ���û���ѡ��Ʒ

   if(rs1.next()){
     jc=rs1.getString("jc");gg=rs1.getString("gg");bz=rs1.getString("bz");
     gysname=rs1.getString("gysname"); cd=rs1.getString("cd");dw=rs1.getString("dw");
     spid=rs1.getString("ID");spname=rs1.getString("spname");
   }
   ResultSet rs2=rst.getResult(maxCount);//���tb_ruku�����ֶ�"id"���ļ�¼
   if(rs2.next()){
     theMax=rs2.getString(1);
   }
   //�������ֶμ�1
   String rkbh="RK"+calendar.getDateString()+(Integer.parseInt(theMax.substring(10))+1);
%>
<table width="584" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" colspan="6" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> ��ǰλ�ã�������> </span>��Ʒ��� &gt;&gt;&gt;</td>
  </tr>
    <tr><td valign="top" height="83"><br>
    <table width="98%" height="112"  border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#F2F2F2">
         <tr><td width="274" >
    <form  name="form1" method="post" action="sprk.jsp" >
       <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="rkspname" onChange="spchange()">
         <option selected="selected">��ѡ�������Ʒ����Ʒ����</option>
        <%while(rs.next()){%>
        <option value=<%=rs.getString("spname")%>> <%=rs.getString("spname")%> </option>
        <%}%>
        </select></td><td width="276"> ע:��*��Ϊ������ </td></tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����:<font color="#585858"><%=rkbh%></font></td></tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��Ʒ����:<font color="#585858"><%=spname%></font></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;��:<font color="#585858"><%=jc%></font></td>
        </tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;��:<font color="#585858"><%=gg%></font></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;װ:<font color="#585858"><%=bz%></font></td>
        </tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��Ӧ��ȫ��:<font color="#585858"><%=gysname%></font></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;��:<font color="#585858"><%=cd%></font></td>
        </tr>
    </form>

    <form  name="form2" method="post" action="spChange.jsp" >
      <%
         session.setAttribute("jc",jc); session.setAttribute("spname",spname);
         session.setAttribute("gg",gg); session.setAttribute("bz",bz);
         session.setAttribute("cd",cd); session.setAttribute("rkbh",rkbh);
         session.setAttribute("dw",dw); session.setAttribute("spid",spid);
         session.setAttribute("gysname",gysname);
      %>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;��:<input type="text" name="sl" onBlur="autoje()">
              (<%=dw%>)*</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;��:<input type="text" name="je" readonly></td>
        </tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;��:<input type="text" name="dj" onBlur="autoje()">
              (Ԫ)*</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ӧ&nbsp;&nbsp;��:<input type="text" name="yf" readonly></td>
        </tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ʵ&nbsp;&nbsp;��:<input type="text" name="sf" onBlur="autoje()">
              (Ԫ)*</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;δ&nbsp;&nbsp;��:<input type="text" name="wf" readonly></td>
        </tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����Ա:<input type="text" name="czy" readonly value="<%=session.getAttribute("username")%>">
              </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������:<input type="text" name="jsr">*</td>
        </tr>
        <tr><td height="27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������:<input type="text" name="rkdate" readonly value="<%=calendar.getDate()%>">
             </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���㷽ʽ:<select name="jsfs">
            <option value="�ֽ�" selected>�ֽ�</option>
            <option value="yf" >Ԥ��</option>
            <option value="zp" >֧Ʊ</option>
            <option value="gz" >����</option></select></td>
        </tr>

        <input type="hidden" name="hjc" value=<%=jc%>></form>
        <tr><td height="40" colspan="2" align="center">
          <input name="mySubmit"  type="button" value="������Ϣ"  onclick="check()" class="btn_grey"> 
          &nbsp;        
            <input name="myeset"type="reset" class="btn_grey" value="�������" onClick="myreset()"></td>
        </tr>
</form>
</table>      </td></tr>
</table>
</body>
</html>
<script language='JavaScript'>
function spchange()
{
  form1.submit();
}
function autoje()
{
    str=form2.sl.value;
    if(isNaN(str)){//�ж������Ƿ�Ϊ����
      form2.sl.value=0;
      alert("�������,����������");form2.sl.focus();retrun;}
    str=form2.dj.value;
    if(isNaN(str)){
      form2.dj.value=0;
      alert("�������,����������");form2.dj.focus();retrun;}
    str=form2.sf.value;
    if(isNaN(str)){
      form2.sf.value=0;
      alert("�������,����������");form2.sf.focus();retrun;}
    //�Զ������Ӧ�ռ�δ�տ�
    form2.je.value=form2.dj.value*form2.sl.value;
    form2.yf.value=form2.je.value;
    form2.wf.value=form2.yf.value-form2.sf.value;
    if(form2.sf.value-form2.yf.value>0){
      form2.sf.value=0;
      form2.wf.value=form2.yf.value;
      alert("ʵ����Ӧ����Ӧ�����!");form2.sf.focus();return;
    }
}
function check()
{
  if(form2.sl.value==0){
    alert("����������");form2.sl.focus();return;}
  if(form2.dj.value==0){
    alert("�����뵥��");form2.dj.focus();return;}
  if(form2.sf.value==0){
    alert("������ʵ��");form2.sf.focus();return;}
  if(form2.jsr.value==""){
    alert("�����뾭��������");form2.jsr.focus();return;}
  form2.submit();
}
function myreset()
{
  form2.reset();
}
</script>




















