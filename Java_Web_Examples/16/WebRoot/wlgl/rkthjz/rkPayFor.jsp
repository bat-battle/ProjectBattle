<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<%
   request.setCharacterEncoding("gb2312");//��ֹ��������
   String id=request.getParameter("jkph");
   String thph=request.getParameter("thph");
   String gysname=request.getParameter("gysname");
   String bcjk=request.getParameter("bcjk");
   String ye=request.getParameter("ye");
   String jkdate=request.getParameter("jkdate");
   String czy=request.getParameter("czy1");
   String jsr=request.getParameter("jsr1");
   String whether="";//�ж��Ƿ������ɣ�����Ƿ���δ����
   if(ye.equals("0")||ye=="0"){
     whether="��";
   }
   else{
     whether="��";
   }
   //��������˻�������Ϣ
   String strInsert="insert into tb_thjz_rk values('"+id+"','"+thph+"','"+gysname+"',"+
       ""+bcjk+","+ye+",'"+jkdate+"','"+czy+"','"+jsr+"')";
   //��������˻�Ʊ�����ݱ�(tb_thph_rk)
   String strUpdate="update tb_thph_rk set ss=ss+"+bcjk+", ws="+ye+", whether='"+whether+
       "' where thph='"+thph+"'";
   rst.doExecute(strInsert);
   rst.doExecute(strUpdate);
%>
<script language="javascript">
   alert("����˻����˳ɹ�");window.location.href='../main.jsp';
</script>








