<%@ page contentType="text/html;charset=gb2312" language="java"%>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="calendar" scope="page" class="com.mingri.showtime.ShowTime"/>
<html>
<title>��Ʒ������Ϣ</title>
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<%
   request.setCharacterEncoding("gb2312");
   String strSql="select * from tb_kucun";
   String strKh="select * from tb_customer";
   String maxCount="select max(id) from tb_sell";
   ResultSet rs=rst.getResult(strSql);//�������б�����ʾ������Ʒ����
   ResultSet rsKh=rst.getResult(strKh);

   String jc=""; String gg="";String bz="";String spid="";String spname="";
   String dj="";String cd="";String dw="";String kcsl="";String theMax="";
   String xsspname=(String)request.getParameter("xsspname");//����û���ѡ��Ʒ�ļ��
   String rkStr="select * from tb_kucun where jc='"+xsspname+"'";
   ResultSet rs1=rst.getResult(rkStr);//���ݼ�Ʋ�ѯ���û���ѡ��Ʒ

   if(rs1.next()){
     jc=rs1.getString("jc");gg=rs1.getString("gg");bz=rs1.getString("bz");
     cd=rs1.getString("cd");dw=rs1.getString("dw");kcsl=rs1.getString("kcsl");
     spid=rs1.getString("ID");spname=rs1.getString("spname");
     dj=rs1.getString("dj");
   }
   ResultSet rs2=rst.getResult(maxCount);//���tb_ruku�����ֶ�"id"���ļ�¼
   if(rs2.next()){
     theMax=rs2.getString(1);
   }
   //�������ֶμ�1
   String xsph="XS"+calendar.getDateString()+(Integer.parseInt(theMax.substring(10))+1);
%>
<table width="584" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" colspan="6" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> ��ǰλ�ã����۹��� > </span>��Ʒ���� &gt;&gt;&gt;</td>
  </tr>
    <tr><td valign="top" height="83"><br>
<table width="98%" height="112"  border="0" align="center" cellpadding="1" cellspacing="1">
    <form  name="form1" method="post" action="spxs.jsp" >
       <tr><td height="25"><select name="xsspname" onChange="spchange()">
         <option >��ѡ�����۵���Ʒ����</option>
        <%while(rs.next()){%>
        <option value=<%=rs.getString("jc")%>> <%=rs.getString("spname")%> </option>
        <%}%>
        </select></td><td> <font color="#585858">ע:��*��Ϊ������ </font></td></tr>
        <tr><td height="25">����Ʊ��:<font color="#585858"><%=xsph%></font></td></tr>
        <tr><td height="25">��Ʒ����:<font color="#585858"><%=spname%></font></td>
            <td>��&nbsp;&nbsp;��:<font color="#585858"><%=jc%></font></td>
        </tr>
        <tr><td height="25">��&nbsp;&nbsp;��:<font color="#585858"><%=gg%></font></td>
            <td>��&nbsp;&nbsp;װ:<font color="#585858"><%=bz%></font></td>
        </tr>
        <tr><td height="25">��&nbsp;&nbsp;��:<font color="#585858"><%=cd%></font></td>
            <td>��&nbsp;&nbsp;��:<font color="#585858"><%=dj%>Ԫ</font></td>
        </tr>
    </form>

    <form  name="form2" method="post" action="xsChange.jsp" >
      <%
         session.setAttribute("jc",jc); session.setAttribute("spname",spname);
         session.setAttribute("gg",gg); session.setAttribute("bz",bz);
         session.setAttribute("cd",cd); session.setAttribute("xsph",xsph);
         session.setAttribute("dw",dw); session.setAttribute("spid",spid);
         session.setAttribute("dj",dj);
      %>
       <tr><td height="25">�ͻ�ȫ��:
         <select name="xskhname">
          <%while(rsKh.next()){%>
          <option value="<%=rsKh.getString("khname")%>"> <%=rsKh.getString("khname")%></option>
          <%}%>
        </select></td>
        <td>�������:<input type="text" name="kcsl"  readonly value="<%=kcsl%>">        </td></tr>
        <tr><td height="25">��&nbsp;&nbsp;&nbsp;&nbsp;��:
          <input type="text" name="dj" value="<%=dj%>">
              <font color="#585858">(Ԫ)</font></td>
            <td>��&nbsp;&nbsp;&nbsp;&nbsp;��:<input type="text" name="je" readonly></td>
        </tr>
        <tr><td height="25">��&nbsp;&nbsp;&nbsp;&nbsp;��:
          <input type="text" name="sl" onBlur="autoje()">
              <font color="#585858">(<%=dw.trim()%>)*</font></td>
            <td>Ӧ&nbsp;&nbsp;&nbsp;&nbsp;��:<input type="text" name="ys" readonly></td>
        </tr>
        <tr><td height="25">ʵ&nbsp;&nbsp;&nbsp;&nbsp;��:
          <input type="text" name="ss" onBlur="autoje()">
              <font color="#585858">(Ԫ)*</font></td>
            <td>δ&nbsp;&nbsp;&nbsp;&nbsp;��:<input type="text" name="ws" readonly></td>
        </tr>
        <tr><td height="25">��&nbsp;��&nbsp;Ա:
          <input type="text" name="czy" readonly value="<%=session.getAttribute("username")%>">
              <font color="#585858"></font></td>
            <td>��&nbsp;��&nbsp;��:<input type="text" name="jsr">*</td>
        </tr>
        <tr><td height="25">��������:
          <input type="text" name="xsdate" value="<%=calendar.getDate()%>">
              <font color="#585858"></font></td>
            <td>���㷽ʽ:<select name="jsfs">
            <option value="�ֽ�" selected>�ֽ�</option>
            <option value="Ԥ��" >Ԥ��</option>
            <option value="֧Ʊ" >֧Ʊ</option>
            <option value="����" >����</option></select></td>
        </tr>

        <input type="hidden" name="hjc" value=<%=jc%>></form>
        <tr><td height="36" colspan="2" align="center"><input name="submit"  type="button" class="btn_grey"  onclick="check()" value="������Ϣ">          &nbsp;
          <input type="reset" class="btn_grey" value="�������" onClick="myreset()"></td>
        </tr>
    </form>
	</table>
      </td></tr>
</table>
</body>
</html>
<script language='JavaScript'>
function spchange()
{
  document.form1.submit();
}
function autoje()
{
    str=form2.sl.value;
    if(isNaN(str)){
      form2.sl.value=0;
      alert("�������,����������");form2.sl.focus();return;}
    str=form2.dj.value;
    if(isNaN(str)){
      form2.dj.value=0;
      alert("�������,����������");form2.dj.focus();return;}
    str=form2.ss.value;
    if(isNaN(str)){
      form2.ss.value=0;
      alert("�������,����������");form2.ss.focus();return;}
    form2.je.value=form2.dj.value*form2.sl.value;
    form2.ys.value=form2.je.value;
    form2.ws.value=form2.ys.value-form2.ss.value;
    if(form2.ss.value-form2.ys.value>0){
      form2.ss.value=0;
      form2.ws.value=form2.ys.value;
      alert("ʵ�ս�Ӧ����Ӧ�ս��!");form2.ss.focus();return;
    }
}
function check()
{
  if(form2.sl.value==0){
    alert("����������");form2.sl.focus();return;}
  if(form2.dj.value==0){
    alert("�����뵥��");form2.dj.focus();return;}
  if(form2.ss.value==0){
    alert("������ʵ��");form2.ss.focus();return;}
  if(form2.jsr.value==""){
    alert("�����뾭��������");form2.jsr.focus();return;}
  if(form2.kcsl.value-form2.sl.value<0){
    alert("�����������!���֤���������");
    form2.sl.value=0;
    form2.sl.focus();return;
  }
  if(CheckDate(form2.xsdate.value)){
      alert("�������׼����(��-��-�ջ���/��/��)");
      form2.xsdate.value="";
      form2.xsdate.focus();return;
    }
    form2.submit();
}
function CheckDate(INDate)
{ if (INDate=="")//�����������Ϊ��
    {return true;}
	subYY=INDate.substr(0,4)//��ȡ�������ڵ�ǰ4λ
	if(isNaN(subYY) || subYY<=0){//�������Ĳ������ֻ����Ǹ���
		return true;
	}
	//ת���·�
        //�ӵ��������ֵĵ�0λ��ʼ���ң��ж��Ƿ����ַ���"-",����н�separate��ֵ����Ϊ"-"
	if(INDate.indexOf('-',0)!=-1){	separate="-"}
	else{
		if(INDate.indexOf('/',0)!=-1){separate="/"}
		else {return true;}
		}
                //���ַ����ĵ�һ��λ�ÿ�ʼ���ң������ض��ַ���λ��
		area=INDate.indexOf(separate,0)
		subMM=INDate.substr(area+1,INDate.indexOf(separate,area+1)-(area+1))
		if(isNaN(subMM) || subMM<=0){
		return true;
	}
		if(subMM.length<2){subMM="0"+subMM}//����·ݵ�ֻ��һλ��ô������ǰ���"0"
	//ת����
	area=INDate.lastIndexOf(separate)//���ַ��������һλ��ʼ���ң������ض��ַ���λ��
	subDD=INDate.substr(area+1,INDate.length-area-1)
	if(isNaN(subDD) || subDD<=0){
		return true;
	}
	if(eval(subDD)<10){subDD="0"+eval(subDD)}//����Ϊ���ֱ��ʾ���ַ�����ֵ
	NewDate=subYY+"-"+subMM+"-"+subDD
	if(NewDate.length!=10){return true;}//����������ڵĳ���С��10
    if(NewDate.substr(4,1)!="-"){return true;}//����������ڵĵ�5λ����"-"
    if(NewDate.substr(7,1)!="-"){return true;}//����������ڵĵ�8λ����"-"
	var MM=NewDate.substr(5,2);//�ӵ�5λ��ʼ��ȡ�ַ�������ȡ2Ϊ��������·�
	var DD=NewDate.substr(8,2);//�ӵ�8λ��ʼ��ȡ�ַ�������ȡ2Ϊ���������
        //�ж��Ƿ�Ϊ���꣨�ܱ�4���������ܹ���100��������ֻ�ܱ�400��������ݾ�Ϊ���꣩
	if((subYY%4==0 && subYY%100!=0)||subYY%400==0){
		if(parseInt(MM)==2){//��MMת��Ϊ����
			if(DD>29){return true;}
		}
	}else{
		if(parseInt(MM)==2){
			if(DD>28){return true;}
		}
	}
	var mm=new Array(1,3,5,7,8,10,12); //�ж�ÿ���е��������
	for(i=0;i< mm.length;i++){
		if (parseInt(MM) == mm[i]){//�ж��·��Ƿ�Ϊ�����е�ֵ
			if(parseInt(DD)>31){return true;}
		}else{
			if(parseInt(DD)>30){return true;}
		}
	}
	if(parseInt(MM)>12){return true;}//����·ݴ���12
   return false;}//���������������Ƿ���false

function myreset()
{
  form2.reset();
}
</script>




















