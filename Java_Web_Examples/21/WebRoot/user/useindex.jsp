<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page import="com.bwm.db.Condb"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����ɹ�ͳ��ҳ</title>
</head>

<body>
<%
	Condb con=new Condb();
	String sql="select * from tb_Con where GroupID='"+session.getAttribute("groupid")+"'";
	ResultSet rs=con.executeQuery(sql);
	int tem=0;
	int temp=0;
	int num=0;
	int tnum=0;
	int ttem=0;
	int ttemp=0;
	while(rs.next()){
		tnum++;
		String result=rs.getString(2);
		String strr="select * from tb_Result where Resultname='"+result+"'";
		String strt="select * from tb_Task where Taskname='"+result+"'";
		ResultSet rst=con.executeQuery(strt);
		while(rst.next()){
			int wether1=rst.getInt("Whether");
			if(wether1==0){
				ttem++;//ͳ�ƿ���δ�����
			}else{
				ttemp++;//ͳ�ƿ����������
			}
		}
		ResultSet rss=con.executeQuery(strr);
		while(rss.next()){
			num++;//ͳ�����ݿ��������󱨵����гɹ���
			int wether=rss.getInt(12);
			if(wether==0){
				tem++;//ͳ�����ݿ������󱨵�δ���ɹ���
			}else{
				temp++;//ͳ�����ݿ������󱨵������ɹ���
			}
			
		}
	}
con.close();
%>
<div align="left">&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/kyw_net.gif" width="521" height="241" align="texttop">
</div>

<table width="548" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr>
    <td width="548" height="31" align="center"><font color="#0000CC" size="4" face="����">�����걨�˿���<%=(tnum-num)%>��</font></td>
  </tr>
  <tr>
    <td align="center"><font color="#0000CC" size="4" face="����">�����걨�˳ɹ�<%=num%>��</font></td>
  </tr>
  <tr>
    <td align="center"><font color="#0000CC" size="4" face="����">����������<%=ttemp%>��</font></td>
  </tr>
  <tr>
    <td align="center"><font color="#0000CC" size="4" face="����">δ��������<%=ttem%>��</font></td>
  </tr>
  <tr>
    <td align="center"><font color="#0000CC" size="4" face="����">�����ɹ���<%=temp%>��</font></td>
  </tr>
  <tr>
    <td align="center"><font color="#0000CC" size="4" face="����">δ���ɹ���<%=tem%>��</font></td>
  </tr>
  <tr>
    <td align="center"><font color="#0000CC" size="+1" face="����">&nbsp;</font></td>
  </tr>
</table>
</body>
</html>
