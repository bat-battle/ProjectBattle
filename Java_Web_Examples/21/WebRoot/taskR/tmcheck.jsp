<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page import="com.bwm.db.Condb"%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
</head>

<body>
<%
	Condb con=new Condb();
	String result=request.getParameter("result");
	String mname=request.getParameter("mname");
	String munit=request.getParameter("munit");
	String moffice=request.getParameter("moffice");
	int inttem=0;
	if(result!=null||result.equals("")||mname!=null||munit!=null||moffice!=null){
		String str="select Member from tb_Member where MemID='"+result+"'";
		ResultSet rs=con.executeQuery(str);
		while(rs.next()){
			inttem++;
			}
			if(inttem==1){
	%>
		<a href="memberadd.htm"><center>
		  <p>&nbsp;</p>
		  <p>&nbsp;</p>
		  <p><font size="+3" color="#0033CC" face="�����п�">
          <%out.println("�˳�ԱID�Ѿ���ռ�÷�����������!");%>
            </font></p>
		</center></a>
	<%
		}
		else if(inttem==0){ 
			String sql="insert into tb_Member(MemID,Member,Munit,Moffice)values('"+result+"','"+mname+"','"+munit+"','"+moffice+"')";
			con.executeUpdate(sql);
			
	%>
	<center>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p><font size="+3" face="�����п�" color="#0033FF">
      <%out.println("��ӳɹ�");%>
        </font></p>
	</center>
	<center>
	  <p>&nbsp;</p> 
	  <p>&nbsp;</p>
	  <p><a href="tmember.htm"><font size="+1" color="#0033FF" face="����">����³�Ա</font></a></p>
	</center>
	<center>
	  <p><a href="taskadd.htm"><font size="+1" color="#0033FF" face="�����п�">����&#30003;��ϵͳ</font></a></p>
    </center>
	<%
		}
	}
	con.close();
%>

</body>
</html>
