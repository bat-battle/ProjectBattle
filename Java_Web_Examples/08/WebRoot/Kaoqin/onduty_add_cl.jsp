<%@ page language="java" pageEncoding="gb2312"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.hiernate.util.*,com.hiernate.persistence.*"/>
<jsp:directive.page import="java.util.Date"/>
<%
  Onduty onduty = new Onduty();                                 //����Onduty����
  onduty.setName1(request.getParameter("name1"));               //���ν�������������Ϊ���ύ����Ϣ
  onduty.setDepartment(request.getParameter("department"));
  onduty.setEnroltype(request.getParameter("enroltype"));
  onduty.setEnrolremark(request.getParameter("enrolremark"));
  if(request.getParameter("enroltype").equals("�ϰ�Ǽ�")){       //�ж��û����е����ϰ���°�Ǽ�
	  Date d = GetTime.getDate();
	  SimpleDateFormat strup = new SimpleDateFormat("yyyy-MM-dd 08:20:00");  //��˾�涨���ϰ�ʱ��
	  String strDate = strup.format(d);                          
	  String strEtime = GetTime.getDateTime();                   //ǩ��ʱ��,���ù������з���
	  boolean bb = GetTime.isDateBefore(strDate,strEtime);       //���ù������бȽ�ʱ�䷽��
	  if(bb==true){
		  onduty.setState("�ٵ�");                                //�Ǽ�ʱ�䳬���涨ʱ�䣬��Ϊ�ٵ�
	  }
	  if(bb==false){    
		  onduty.setState("����");                                //�Ǽ�ʱ���ڹ涨ʱ��֮ǰ���򱣴�����
	  }
	  onduty.setDefinetime(strDate);                              //����˾�涨�ϰ�ʱ������onduty�����Definetime����
	  onduty.setEnroltime(strEtime);                              //���û�ǩ��ʱ������onduty�����Enroltime����
  }
  if(request.getParameter("enroltype").equals("�°�Ǽ�")){
	  Date dd = new Date();
	  SimpleDateFormat sdfgo = new SimpleDateFormat("yyyy-MM-dd 17:10:00");  //��˾�涨�°�ʱ�� 
	  String strDate = sdfgo.format(dd);                             
	  String strDatet = GetTime.getDateTime();                           //���ù����෽����õ�ǰʱ��
	  boolean b = GetTime.isDateBefore(strDate,strDatet);                //���ù��������ж�ʱ��ǰ�󷽷�
	  if(b==true){                                                       //����û��Ǽ�ʱ�����°�ʱ��֮ǰҳ����������ˡ�	
		  onduty.setState("����");
	  }
	  if(b==false){
		  onduty.setState("����");                                        //�û��Ǽ�ʱ�����°�֮��ҳ����ʾ��������
	  }
	  onduty.setDefinetime(strDate);                                     //���ö�����°�ʱ��
	  onduty.setEnroltime(strDatet);                                     //���ö���ĵǼ�ʱ��
  }
   HibernateUtil.saveOnduty(onduty);                                     //����Ǽ���Ϣ
  %>
<script language="javascript">
alert("�Ǽ���Ϣ��ӳɹ���");
opener.location.reload();
window.location.href='onduty_index.jsp';
window.close();
</script>



