<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.*,com.hiernate.persistence.Menu"%>

<table width="100%"  border="0" cellpadding="0" cellspacing="0">
<%  
		      List listfather = (List)session.getAttribute("menulist");     //������˵�����
			  if(listfather.isEmpty()){                                     //�ж����˵��Ƿ�Ϊ��
%>
<tr>
			<td align="center">���޹��ܷ�����Ϣ!</td>
		</tr>
		   <%}
		     else{                                                           //������˵���Ϊ�գ��������²���
			   int m=1;                                  
			   for(int j=0;j<listfather.size();j++){
			     Menu menufather = (Menu)listfather.get(j);
			     List listsun = (List)session.getAttribute("menuNameid"+j+"");//����Ӳ˵�����
			%>
		<tr>
			<td height="27" valign="top">
				<%
				  if(listsun.isEmpty()){
					 for(int i=1;i<listsun.size();i++){
				%>
				&nbsp;
				<img src="Images/jian_null.gif" width="38" height="16" border="0">
				<%=menufather.getMenuName()%>                                <!-- ����Ӳ˵�����Ϊ�գ���ʾ���˵��� -->
				<%}}
				else{%>
				&nbsp;                                                      <!-- ����Ӳ˵����ϲ�Ϊ�գ�������״����ͼ -->
				<a href="Javascript:ShowTR(img<%=m%>,OpenRep<%=m%>)"><img
						src="Images/jia.gif" border="0" alt="չ��" id="img<%=m%>">
				</a>
				<a href="Javascript:ShowTR(img<%=m%>,OpenRep<%=m%>)">
					<%=menufather.getMenuName()%>                            <!-- �����˵�����ʾ��ҳ���� -->
				</a>
				<%}%>
		  </td>
				<%
				  if(listsun.size()>0){                                 // �ж��Ӳ˵����ϵĳ����Ƿ���ڣ�
				%>
  <tr id="OpenRep<%=m%>" style="display:none;">                         <!-- ��״����ͼ��ʾ�Ӳ˵� -->
			<td colspan="6">
				<% for(int k=0;k<listsun.size();k++){
				    Menu menusun = (Menu)listsun.get(k);                   //����ѭ�����Ӳ˵���ʾ��ҳ����
				  %>
				<table width="94%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="25" align="center">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="7%" align="left">
										&nbsp;&nbsp;&nbsp;
										<img src="Images/folder.gif" width="16" height="16" border="0">
									</td>
									<td width="93%" align="left">
										&nbsp;
										<a href="<%=menusun.getLinkurl()%>" target="mainFrame"> <!-- �õ������ӵ�ַ -->
										<%=menusun.getMenuName()%>                  <!-- �õ��Ӳ˵����� -->
										</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<%m=m+1;}%>
			</td>
			<%}%>
		</tr>
		<%}}%>
		</table>
 <script language="javascript">
  ShowTR(img1,OpenRep1)  //���õ�1�����Ϊչ��״̬
  function ShowTR(objImg,objTr)             //Ӧ��javascript���ҳ����ʾЧ��
    {
	if(objTr.style.display == "block")
	{
		objTr.style.display = "none";
		objImg.src = "Images/jia.gif";
		objImg.alt = "չ��";		
	}
	else
	{
		objTr.style.display = "block";
		objImg.src = "Images/jian.gif";
		objImg.alt = "�۵�";		
	}
    }
</script>