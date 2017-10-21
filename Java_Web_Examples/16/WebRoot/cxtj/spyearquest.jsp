<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.data.category.DefaultCategoryDataset" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation" %>
<%@ page import="org.jfree.chart.entity.StandardEntityCollection" %>
<%@ page import="org.jfree.chart.ChartRenderingInfo" %>
<%@ page import="org.jfree.chart.servlet.ServletUtilities" %>

<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.mingri.dbconn.DBResult"/>

<%
   String year=request.getParameter("year");
   //���ĳ�갴�·ݷ���������۶��SQL���
 	String strSql="select * from (select sum(je) as sumje,month(xsdate) as xsmonth from tb_sell  where  year(xsdate)='"+
 			year+"' group by month(xsdate) union select 0,MonthName from GetMonth() where MonthName not in (select month(xsdate) as xsmonth from tb_sell where year(xsdate)='"+
 					year+"' group by month(xsdate))) temp order by temp.xsmonth";  
   ResultSet rs=rst.getResult(strSql);
   int counts=0;
   if(!rs.next()){
     out.println("<script language='javascript'>alert('"+year+"��û�����ۼ�¼');"+
                "window.location.href='main.jsp';</script>");
   }
%>


<%
DefaultCategoryDataset dataset1=new DefaultCategoryDataset();
for(int j=1;j<=12;j++){   //ѭ����1ѭ����12
	float sumje=Float.valueOf(rs.getString("sumje"));
	int y=rs.getInt("xsmonth");
	dataset1.addValue(sumje,y+"��",y+"��");
	rs.next();
}
//����JFreeChart�����ͼ�����
JFreeChart chart=ChartFactory.createBarChart3D(
									year+"�����۶����ͼ",		//ͼ�����
									"�·�",					//x�����ʾ����
									"����",					//y�����ʾ����
									dataset1,				//���ݼ�
									PlotOrientation.VERTICAL,//ͼ����(��ֱ)
									true,					//�Ƿ����ͼ��
									false,					//�Ƿ������ʾ
									false					//�Ƿ����URL
									);
//����ͼ����ļ���
// �̶��÷�
ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
String fileName=ServletUtilities.saveChartAsPNG(chart,500,300,info,session);
String url=request.getContextPath()+"/servlet/DisplayChart?filename="+fileName;

%>
<html>
<title>�����۶����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;<img src="<%=url %>"></td>
  </tr>
</table>
</body>
</html>
