<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="data1" scope="page" class="cars.Bean1" />
<table width="164" height="564" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160" height="20" bgcolor="#FFCC99">&nbsp;������Ϣ</td>
      </tr>
      <tr>
        <td height="104" valign="top">
		<table width="160" height="80" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="20" colspan="2"><div align="center">δ �� �� �� Ϣ</div></td>
            </tr>
          <tr>
            <td width="91" height="25"><div align="right">�� �� �� ����</div></td>
            <td width="69" height="25">&nbsp;
			<%
			String sql1="select count(*) as counts from tb_OrderForm where Whether='δ����'";
			ResultSet rs1=data1.getrs(sql1);
			rs1.beforeFirst();
			if(rs1!=null&&rs1.next()){
			%>
			<%=rs1.getInt("counts")%> ��
			<%}%>
			</td>
          </tr>
          <tr>
            <td height="25"><div align="right">�� �� �� �룺</div></td>
            <td height="25">&nbsp;
						<%
			sql1="select count(*) as counts from tb_Tenancy where Whether='δ����'";
			ResultSet rs2=data1.getrs(sql1);
			rs2.beforeFirst();
			if(rs2!=null&&rs2.next()){
			%>
			<%=rs2.getInt("counts")%> ��
			<%}%>
			</td>
          </tr>
          <tr>
            <td height="25"><div align="right">�� �� �� �룺</div></td>
            <td height="25">&nbsp;
						<%
			sql1="select count(*) as counts from tb_Permute where Whether='δ����'";
			ResultSet rs3=data1.getrs(sql1);
			rs3.beforeFirst();
			if(rs3!=null&&rs3.next()){
			%>
			<%=rs3.getInt("counts")%> ��
			<%}%>
			</td>
          </tr>
        </table>
		</td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;������</td>
      </tr>
      <tr>
        <td valign="top"><table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="30">&nbsp;</td>
            <td width="120">&nbsp;</td>
          </tr>
          <tr>
            <td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
            <td width="120" height="36"> <a href="Manage_Cars.jsp" style="color:#000000 ">���۳�������</a></td>
          </tr>
          <tr>
            <td height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
            <td height="36"><a href="Manage_Destine.jsp" style="color:#000000 ">���޳�������</a></td>
          </tr>
          <tr>
            <td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
            <td width="120" height="36"><a href="Manage_SparePart.jsp" style="color:#000000 ">�������ݹ���</a></td>
          </tr>
                       <tr>
						<td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
						<td height="36"><a href="Manage_OrderForm.jsp" style="color:#000000 ">������Ϣ����</a></td>
					  </tr>
					  <tr>
						<td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
						<td height="36"><a href="Manage_Tenancy.jsp" style="color:#000000 ">������Ϣ����</a></td>
					  </tr>
					  <tr>
						<td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
						<td height="36"><a href="Manage_Permute.jsp" style="color:#000000 ">�û���Ϣ����</a></td>
					  </tr>
					<tr>
						<td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
						<td height="36"><a href="Manage_News.jsp" style="color:#000000 ">������Ϣ����</a></td>
				    </tr>
					  <tr>
						<td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
						<td height="36"><a href="Manage_About.jsp" style="color:#000000 ">������Ϣ����</a></td>
					  </tr>
          <tr>
            <td width="30" height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
            <td width="120" height="36"><a href="Manage_Record.jsp" style="color:#000000 ">�ͻ�Ͷ�߹���</a></td>
          </tr>
          <tr>
            <td height="36"><div align="center"><img src="Image/F_CLOSED.GIF" width="16" height="17"></div></td>
            <td height="36"><a href="Manage_Enterprise.jsp" style="color:#000000 ">������ҵ����</a></td>
          </tr>
        </table></td>
      </tr>
    </table>