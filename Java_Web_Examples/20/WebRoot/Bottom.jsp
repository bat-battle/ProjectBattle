<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="bottom" scope="session" class="cars.Bean3" />
<table width="744" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="center"><img src="Image/audi.gif" alt="�µ�" width="55" height="40"></div></td>
    <td><div align="center"><img src="Image/bmw.gif" alt="����" width="55" height="40"></div></td>
    <td><div align="center"><img src="Image/Buck.gif" alt="���" width="55" height="40"></div></td>
    <td><div align="center"><img src="Image/ford.gif" alt="����" width="55" height="40"></div></td>
    <td><div align="center"><img src="Image/NISSAN.gif" alt="��ɣ" width="55" height="40"></div></td>
    <td><div align="center"><img src="Image/TOYOTA.gif" alt="����" width="55" height="40"></div></td>
    <td><div align="center"><img src="Image/NHL.gif" alt="NHL" width="55" height="40"></div></td>
  </tr>
</table>
<table width="744" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="center">
      <p><%=bottom.seturl("����ʡ���������տƼ����޹�˾","www.mingrisoft.com")%> <a style="color:#000000;" onClick="javascript:window.open('M_Login.jsp','','width=528,height=218,toolbar=no,location=no,status=no,menubar=no')">��̨���</a><%=bottom.setnumbers("0431-4972266")%><br>
        <%=bottom.setemail("mingrisoft@mingrisoft.com")%><br>
        Copyright &copy; 2005-2008</p>
    </div></td>
  </tr>
</table>
