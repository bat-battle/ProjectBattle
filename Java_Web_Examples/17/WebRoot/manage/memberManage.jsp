<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
ResultSet rs=connDB.executeQuery("select * from tb_Member");

%>
<html>
<head>
<title>����ͼ�鳬��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
<script src="../JS/check.jsp"></script>
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" background="../Images/bg.gif">
  <tr>
    <td>
<table width="777" height="609"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td valign="top">
	<jsp:include page="Top.jsp"/>
	<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="tableBorder_LTR">
      <tr>
        <td height="30" align="center" bgcolor="#eeeeee">�ԡԡ� �û���Ϣ���� �ԡԡ�</td>
      </tr>
    </table>
	<table width="100%" height="396"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LBR">
        <tr>
          <td width="26%" height="395" valign="top"><table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="55%" height="82" align="center" class="word_grey">&nbsp;<img src="../Images/reg.gif" width="84" height="54"></td>
              <td width="45%" align="left" class="word_grey">�û���Ϣ����</td>
            </tr>
            <tr>
              <td height="112" colspan="2" valign="top" class="word_grey" style="line-height:200%;"><ul>
                <li>�û���Ϣ����/�ⶳ���û���Ϣ���Ա������ⶳ������������ӡ��޸ĺ�ɾ�������������/�ⶳ�����еġ���ͷ��ͼ����Զ����û������������/�ⶳ�����еġ�Կ�ס�ͼ����Խⶳ�û���</li>
                <li>�û���Ϣ�鿴�����Բ鿴�û��Ļ�����Ϣ���������Բ鿴�û����롣</li>
                </ul></td>
            </tr>
            <tr align="center">
              <td colspan="2" valign="middle" class="word_grey"></td>
            </tr>
          </table></td>
          <td width="5" valign="top" background="../Images/Cen_separate.gif"></td>
          <td width="73%" valign="top"><table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="13" align="center">&nbsp;</td>
            </tr>
          </table>
            <table width="100%" height="48"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
              <tr>
                <td width="14%" height="27" align="center">
                  �û���</td>
                <td width="14%" align="center">��ʵ����</td>
                <td width="10%" align="center">����</td>
                <td width="15%" align="center">�绰</td>
                <td width="26%" align="center">Email</td>
                <td width="10%" align="center">���Ѷ�</td>
                <td width="11%" align="center">����/�ⶳ</td>
              </tr>
<%
String str=(String)request.getParameter("Page");
if(str==null){
	str="0";
}
int pagesize=10;
rs.last();
int RecordCount=rs.getRow(); 
int maxPage=0;
maxPage=(RecordCount%pagesize==0)?(RecordCount/pagesize):(RecordCount/pagesize+1);

int Page=Integer.parseInt(str);
if(Page<1){
	Page=1;
}else{
	if(((Page-1)*pagesize+1)>RecordCount){
		Page=maxPage;
	}
}
rs.absolute((Page-1)*pagesize+1);
for(int i=1;i<=pagesize;i++){
	  int ID=rs.getInt("ID");
	  String username=rs.getString("username");
	  String Truename=rs.getString("Truename");
	  String city=rs.getString("city");
	  if(city==null||city.equals("")){
		  city="&nbsp;";
	  }
	  String CardNO=rs.getString("CardNO");
	  String CardType=rs.getString("CardType");	  
	  float Amount=rs.getFloat("Amount");
	  String Tel=rs.getString("Tel");	
	  if(Tel==null||Tel.equals("")){
		  Tel = "&nbsp;";
	  }
	  String Email=rs.getString("Email");	
	  int freeze=rs.getInt("freeze"); 
	  %>

              <tr style="padding:5px;">
                <td height="24" align="center"><a href="member_detail.jsp?ID=<%=ID%>"><%=username%></a></td>
                <td align="center"><%=Truename%></td>
                <td align="center"><%=city%></td>
                <td align="center"><%=Tel%></td>
                <td align="center"><%=Email%></td>
                <td align="center"><%=Amount%></td>
                <td align="center"><%if(freeze==0){%><a href="member_freeze.jsp?ID=<%=ID%>"><img src="../Images/freeze.gif" alt="����" width="13" height="15"></a>
                  <%}%>
				<%if(freeze==1){%><a href="member_thaw.jsp?ID=<%=ID%>"><img src="../Images/thaw.gif" alt="�ⶳ" width="15" height="15"></a>
				<%}%>				</td>
              </tr>
<%
	try{
		if(!rs.next()){break;}
		}catch(Exception e){}
}
%>
            </table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="right">��ǰҳ����[<%=Page%>/<%=maxPage%>]&nbsp;
	<%if(Page>1){%>
	<a href="index.jsp?Page=1">��һҳ</a>��<a href="index.jsp?Page=<%=Page-1%>">��һҳ</a>
	<%
	}
	if(Page<maxPage){
	%>
	��<a href="index.jsp?Page=<%=Page+1%>">��һҳ</a>��<a href="index.jsp?Page=<%=maxPage%>">���һҳ&nbsp;</a>
	<%}
	%>
	</td>
  </tr>
</table>			</td>
        </tr>
      </table>
      <jsp:include page="copyright.jsp"/>
    </td>
  </tr>
</table>
</td>
  </tr>
</table>
</body>
</html>
