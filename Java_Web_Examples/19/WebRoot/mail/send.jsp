<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.bwm.db.Conn"%>
<%@ page import="com.bwm.page.Show" %>
<%
request.setCharacterEncoding("GB2312");
Show show=new Show();
Conn con=new Conn();
boolean blnError=true;
boolean blnSend=false;
String strFrom ="";
String strUserName=(String)session.getAttribute("name");
String strUse=(String)session.getAttribute("use");
String strSql="";
if(strUse!=null&&strUse.equals("student")){
        strSql="SELECT email FROM tb_student WHERE sname='"+strUserName+"'";
}else if(strUse!=null&&strUse.equals("company")){
        strSql="SELECT email FROM tb_company WHERE cname='"+strUserName+"'";
}else {
        out.print(show.errorBox("�㻹û�е�¼���ܷ���Email","������Ϣ"));
        return;
}
ResultSet rs=con.getRs(strSql);
if(rs.next()){
        strFrom=rs.getString(1);
}
//send Email
InternetAddress[] address = null;
String strMailserver   = "bwm";
String [] arrstrTo=request.getParameterValues("from");
String strSubject = request.getParameter("subject");
String strMessage = request.getParameter("message");
if(arrstrTo.length>0){
        int intI=0;
        for(intI=0;intI<arrstrTo.length;intI++){
                if(!arrstrTo[intI].equals("")){
                        try {
                                // �趨��Ҫ�õ�Mail ����������ʹ�õĴ���Э��
                                java.util.Properties props = System.getProperties();
                                props.put("mail.host",strMailserver);
                                props.put("mail.transport.protocol","smtp");

                                // �����µ�Session ����
                                javax.mail.Session mailSession = javax.mail.Session.getDefaultInstance(props,null);
                                mailSession.setDebug(false);

                                Message msg = new MimeMessage(mailSession);

                                // �趨�����ʼ��ķ�����
                                msg.setFrom(new InternetAddress(strFrom));

                                // �趨�����ʼ��������˵�����
                                address = InternetAddress.parse(arrstrTo[intI],false);
                                msg.setRecipients(Message.RecipientType.TO, address);

                                // �趨���е�����
                                msg.setSubject(strSubject);

                                // �趨���ŵ�ʱ��
                                msg.setSentDate(new java.util.Date());

                                // �趨�����ŵ�MIME Type
                                msg.setText(strMessage);

                                // ����
                                Transport.send(msg);

                                out.print("�ʼ���˳�����͵�"+arrstrTo[intI]+" <br>");
                                blnSend=true;
                        }catch (Exception e) {
                                if(blnError)
                                        out.print(show.errorBox(e.getMessage(),"����ʧ��"));
                                blnError=false;
                                e.printStackTrace();
                        }
                }
        }
}else{
        out.print(show.errorBox("����д������Ϣ��","������Ϣ"));
}
if(blnSend){
        out.print(show.errorBox("�ʼ����ͳɹ���","������Ϣ"));
}else if(blnError&!blnSend){
        out.print(show.errorBox("�ʼ�����ʧ�ܣ�","������Ϣ"));
}
%>