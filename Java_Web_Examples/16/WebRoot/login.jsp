<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>
<jsp:useBean id="calendar" scope="page" class="com.mingri.showtime.ShowTime"/>
<%
   request.setCharacterEncoding("gb2312");//���������ͳһ���룬��������������
   String username=request.getParameter("username"); //���ձ��е�username����
   String password=request.getParameter("password");//���ձ��е�password����
   String str="select * from tb_user where "+
               "username='"+username+"' and password='"+password+"'";
   ResultSet rs=rst.getResult(str);//ִ��SQL����ý��������
   session.setAttribute("isLog",new String("0"));//�ж��û��Ƿ��¼����isLog������Ϊ0ʱ��˵���û���û�е�¼
   if(!rs.next())//�����û���ҵ���Ҫ���ҵ���
   {
    out.println("<script language='javascript'>alert('�û������������');"+
                "parent.location.href='index.jsp';</script>");
   }
   else
   {
     session.setAttribute("username",rs.getString("username"));//�����¼��Ϣ��session������
     session.setAttribute("password",rs.getString("password"));
     session.setAttribute("isLog",new String("1"));//��isLog��������Ϊ1
     //����û��ϴε�¼ϵͳ��ʱ��
     session.setAttribute("userLastLogTime",rs.getString("userLastLogTime"));
     String strsql=calendar.getDate();
     int id=rs.getInt("ID");
     //�����û����ε�¼ϵͳ��ʱ�����û���Ϣ���и���
     String strUpdate="update tb_user set userLastLogTime='"+strsql+"' where ID="+id+"";
     rst.getResult(strUpdate);//ִ��SQL���
     response.sendRedirect("chat.jsp");//��¼�ɹ���ת��ϵͳ��ҳ��
   }
%>


















