<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
ResultSet rs=connDB.executeQuery("select * from tb_bookinfo order by INTime Desc");
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
        <td height="30" align="center" bgcolor="#eeeeee">�ԡԡ� <span class="word_grey"><a href="book_add.jsp">���ͼ����Ϣ</a></span> �ԡԡ�</td>
      </tr>
    </table>
	<table width="100%" height="396"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LBR">
        <tr>
          <td width="26%" height="395" valign="top"><table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="55%" height="82" align="center" class="word_grey">&nbsp;<img src="../Images/reg.gif" width="84" height="54"></td>
              <td width="45%" align="left" class="word_grey">ͼ�����</td>
            </tr>
            <tr>
              <td height="112" colspan="2" valign="top" class="word_grey"><ul>
                <li> ���ͼ����Ϣ����������ͼ����Ϣ�������ӿ��Խ���ͼ����Ϣ����ӡ�</li>
                <li>�޸�ͼ����Ϣ�����ÿ��ͼ����Ϣ����ġ��޸ġ���ť�����޸�ͼ����Ϣ��</li>
                <li>ɾ��ͼ����Ϣ�����ÿ��ͼ����Ϣ����ġ�ɾ������ť����ɾ��ͼ����Ϣ��</li>
                <li>�Ƽ�ͼ�飺������Ƽ�ͼ�飬���Ե��ָ��ͼ���ġ��޸ġ���ť��</li>
                <li>�Ƿ����飺����뽫ͼ����Ϣ�����������ϼ��У����Ե��ָ��ͼ���ġ��޸ġ���ť��</li>
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
                <td width="18%" height="27" align="center">
                  ���</td>
                <td width="36%" align="center">����</td>
                <td width="20%" align="center">������</td>
                <td width="8%" align="center">�����</td>
                <td width="8%" align="center">�Ƽ���</td>
                <td width="5%" align="center">�޸�</td>
                <td width="5%" align="center">ɾ��</td>
              </tr>
<%
String str=(String)request.getParameter("Page");
if(str==null){
	str="0";
}
int pagesize=10;
rs.last();
int RecordCount=rs.getRow(); 
//out.println(String.valueOf(RecordCount));
int maxPage=0;
maxPage=(RecordCount%pagesize==0)?(RecordCount/pagesize):(RecordCount/pagesize+1);

int Page=Integer.parseInt(str);
if(Page<1){
	Page=1;
}else{
	if(Page>maxPage){
		Page=maxPage;
	}
}
rs.absolute((Page-1)*pagesize+1);
for(int i=1;i<=pagesize;i++){
	  String ISBN=rs.getString("ISBN");
	  String BookName=rs.getString("BookName");
	  String publisher=rs.getString("publisher");
	  String newbook=rs.getInt("newbook")==0 ? "��":"��";
	  String commend=rs.getInt("commend")==0 ? "��":"��"; 
	  %>

              <tr style="padding:5px;">
                <td height="24" align="center"><%=ISBN%></td>
                <td align="center"><a href="book_detail.jsp?ISBN=<%=ISBN%>"><%=BookName%></a></td>
                <td align="center"><%=publisher%></td>
                <td align="center"><%=newbook%></td>
                <td align="center"><%=commend%></td>
                <td align="center"><a href="book_modify.jsp?ISBN=<%=ISBN%>"><img src="../Images/modify.gif" width="15" height="15"></a></td>
                <td align="center"><a href="book_del.jsp?ISBN=<%=ISBN%>"><img src="../Images/del.gif" width="16" height="16"></a></td>
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
