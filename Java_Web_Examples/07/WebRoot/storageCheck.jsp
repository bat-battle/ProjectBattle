<%@page contentType="text/html; charset=gb2312" language="java"%>
<%@page import="com.actionForm.GoodsForm"%>
<%@page import="com.actionForm.StorageForm"%>
<%@page import="com.dao.OutStorageDAO"%>
<%@page import="java.util.*"%>
<%
  //��ȡȫ��������Ϣ
    List listgoods = null;
    OutStorageDAO outStorageDAO = new OutStorageDAO();
    listgoods = outStorageDAO.storage_query();     //��ѯ�������
	java.util.Date date=new java.util.Date();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<link rel="stylesheet" href="Css/style.css">
<title></title>
<style>
@media print{
div{display:none}
.bgnoprint{
	background:display:none;
}
.noprint{
	display:none
}
}
</style>
</head>
<body onLoad="clockon(bgclock)" class="bgnoprint">
<table width="757" height="174" border="0" align="center"cellpadding="0" cellspacing="0">
  <tr class="noprint">
    <td height="133" align="center" valign="top"><%@include file="top.jsp"%>
    </td>
  </tr>
  <tr>
    <td><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" background="images/area_bg.jpg" class="noprint">
        <tr>
          <td width="26%" align="center" class='word_white'>��ǰ��¼�û���<%=session.getAttribute("username")%></td>
          <td width="4%">&nbsp;</td>
          <td width="70%" valign="bottom"> ��ǰλ�ã����ʴ���
            &gt; ����̵�
            &gt;&gt;&gt; </td>
        </tr>
      </table>
      <table width="100%" height="385" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td width="5" valign="top" background="images/left.gif" class="bgnoprint">&nbsp;</td>
          <td align="center" valign="top">&nbsp;
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="50" class="noprint" >&nbsp;</td>
                <td valign="top"><table width="90%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="27" align="center" style=" font-size:14px;"><b>����̵��</b></td>
                  </tr>
                  <tr>
                    <td height="13" align="right">��ӡ���ڣ�<%=new java.sql.Date(date.getTime())%></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                </table>
                  <table width="90%" border="1" cellpadding="0" cellspacing="0" bgcolor="#000000" id="pay" bordercolor="#00000" bordercolordark="#000000" bordercolorlight="#FFFFFF" >
				  <thead style="display:table-header-group;">
                    <tr>
                      <td width="7%" align="center" bgcolor="#FFFFFF">���</td>
                      <td width="21%" align="center" bgcolor="#FFFFFF">��������</td>
                      <td width="16%" align="center" bgcolor="#FFFFFF">���</td>
                      <td width="23%" align="center" bgcolor="#FFFFFF">��������</td>
                      <td width="9%" align="center" bgcolor="#FFFFFF">����(Ԫ)</td>
                      <td width="15%" align="center" bgcolor="#FFFFFF">�������(��λ)</td>
                      <td width="9%" align="center" bgcolor="#FFFFFF">�̵�����</td>
                    </tr>
					</thead>
                    <%
  if (listgoods.size() <= 0) {%>
                    <tr>
                      <td colspan="7" align="center" bgcolor="#FFFFFF">&nbsp;���޿����Ϣ!</td>
                    </tr>
                    <%  }else {
	  String Producer="";     //��������
	  String Unit="";     //��λ
	  float Price=0.0f;     //����
	  float amount=0.0f;
	  int storagenumber=0;     //�������
	  String goodsname="";     //��������
	  int goodsId=0;     //����ID
	  String spec="";     //���
                  for(int i=0;i<listgoods.size();i++){
      
                    Object obj[]=(Object[])listgoods.get(i);
                    GoodsForm goodsF=(GoodsForm)obj[0];
                    StorageForm storageF=(StorageForm)obj[1];
                    goodsId=goodsF.getId();
                    goodsname=goodsF.getName();
					spec=goodsF.getSpec();
                    Producer=goodsF.getProducer();
                    Unit=goodsF.getUnit();
                    Price=goodsF.getPrice();
					storagenumber=storageF.getNumber();
					amount=amount+Price*storagenumber;
%>
                    <tr<%if((i+1)%18==0){%> style="page-break-after:always;"<%}%>>
                      <td align="center" bgcolor="#FFFFFF">&nbsp;<%=i+1%></td>
                      <td bgcolor="#FFFFFF">&nbsp;<%=goodsname%></td>
                      <td bgcolor="#FFFFFF">&nbsp;<%=spec%></td>
                      <td bgcolor="#FFFFFF">&nbsp;<%=Producer%></td>
                      <td bgcolor="#FFFFFF">&nbsp;<%=Price%></td>
                      <td bgcolor="#FFFFFF">&nbsp;<%=storagenumber%>(<%=Unit%>)</td>
                      <td bgcolor="#FFFFFF">&nbsp;</td>
                    </tr>
                    <%}%>
    <tfoot style="display:table-footer-group;"><tr><td class="tableBorder_B1"></td></tr></tfoot>
  </table>
                  <table width="90%" height="43" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="18">&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="25" align="right"><div>����ܽ�<%=amount%>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="window.print();">��ӡ�̵㱨��</a></div></td>
                    </tr>
					<%}%>
                  </table></td>
                <td width="40">&nbsp;</td>
              </tr>
            </table>
	      </td>
          <td width="10" valign="top" background="images/right.jpg">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr class="noprint">
    <td height="55" valign="top" background="images/bottom.jpg"><%@include file="copyright.jsp"%>
    </td>
  </tr>
</table>
</body>
</html>

