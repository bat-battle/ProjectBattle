<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.Date" %>

<%
	//��ȡ����ڲ˵����е�ʱ��
    String[] weekdays={"","��","һ","��","��","��","��","��"};
    String[] days=new String[42];
    for(int i=0;i<42;i++)
    	days[i]="";

    Date currentDay = new Date();
    int year=1900+currentDay.getYear();
    int month=currentDay.getMonth();
    int today=currentDay.getDate();
    int weekday=currentDay.getDay()+1;
    
    String now=year+"��"+(month+1)+"��"+today+"��"+" ����"+weekdays[weekday];
%>
<script type="text/javascript" src="js/showTime.js"></script>
<body onload="showTime(time)">
	<%=now %>
	<input type="text" style="border:0;background-color:white" disabled id="time" size="9">
</body>