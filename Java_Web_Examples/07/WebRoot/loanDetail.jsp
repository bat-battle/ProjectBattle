<%@page contentType="text/html; charset=gb2312" language="java"%>
<%@page import="com.actionForm.GoodsForm"%>
<%@page import="com.actionForm.LoanForm"%>
<%@page import="com.dao.GoodsDAO"%>
<%@page import="com.core.GetTime"%>
<%@page import="java.util.Date"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title>���ʹ���ϵͳ</title>
<link rel="stylesheet" href="Css/style.css">
</head>
<body>
<table width="757" height="174" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="133" align="center" valign="top"><%@include file="top.jsp"%>
    </td>
  </tr>
  <tr>
    <td><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" background="images/area_bg.jpg">
        <tr>
          <td width="26%" align="center" class='word_white'>��ǰ��¼�û���<%=session.getAttribute("username")%></td>
          <td width="4%">&nbsp;</td>
          <td width="70%" valign="bottom"> ��ǰλ�ã���ѯͳ��
            &gt; �����ѯ&nbsp;&gt; �������ϸ��Ϣ            &gt;&gt;&gt; </td>
        </tr>
      </table>
      <table width="100%" height="385" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td width="5" valign="top" background="images/left.gif">&nbsp;</td>
          <td align="center" valign="top">&nbsp;
            <table width="96%" height="487"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center" valign="top"><%
				try{
		LoanForm LoanForm=(LoanForm)request.getAttribute("loanDetail");
if(LoanForm==null){
%>
                  <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
                    <tr>
                      <td height="36" align="center">û�з��������Ľ������Ϣ��</td>
                    </tr>
                  </table>
                  <%
}else{
  String strState="";
  int id=LoanForm.getId();
  String lno=LoanForm.getLno();
  GoodsForm goodsF=LoanForm.getGoods();
  String goodsname=goodsF.getName();
  String spec=goodsF.getSpec();
  float price=goodsF.getPrice();
  String unit=goodsF.getUnit();
  int number=LoanForm.getNumber();
  String principal=LoanForm.getPrincipal();
  String borrowperson=LoanForm.getBorrowperson();
  String borrowunit=LoanForm.getBunit();
  String btel=LoanForm.getBtel();
  String username=LoanForm.getUsername();
  java.sql.Date createTime=new java.sql.Date(LoanForm.getCreatetime().getTime());
  String taster=LoanForm.getTaster();
  Date approveTime;
  if(LoanForm.getApprovetime()!=null){
  	approveTime=LoanForm.getApprovetime();
  }else{
  	approveTime=null;
  }
  String backperson=LoanForm.getBackperson();
  Date backtime;
  if(LoanForm.getBacktime()!=null){
  	backtime=LoanForm.getBacktime();
  }else{
  	backtime=null;
  }
  short state=LoanForm.getState();
    switch(state){
    case 0:
    strState="δ���";
    break;
    case 1:
    strState="�����";
    break;
    default:
    strState="�ѹ黹";
	}
%>
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center"><table width="98%" height="137"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6">
                          <tr>
                            <td width="16%" style="padding:4px;">������ţ�</td>
                            <td width="36%" style="padding:4px;"><%=lno%></td>
                            <td width="13%" style="padding:4px;">���ʱ�䣺</td>
                            <td width="35%" style="padding:4px;"><%=createTime%></td>
                          </tr>
                          <tr>
                            <td style="padding:4px;">�������ƣ�</td>
                            <td style="padding:4px;"><%=goodsname%></td>
                            <td style="padding:4px;">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
                            <td style="padding:4px;"><%=spec%></td>
                          </tr>
                          <tr>
                            <td style="padding:4px;">���ʵ��ۣ�</td>
                            <td style="padding:4px;"><%=price%></td>
                            <td style="padding:4px;">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
                            <td style="padding:4px;"><%=number%>(<%=unit%>)</td>
                          </tr>
                          <tr>
                            <td style="padding:4px;">��&nbsp;��&nbsp;�ˣ�</td>
                            <td style="padding:4px;"><%=borrowperson%></td>
                            <td style="padding:4px;">�����˵绰��</td>
                            <td style="padding:4px;"><%=btel%></td>
                          </tr>
                          <tr>
                            <td style="padding:4px;">�����˹�����λ��</td>
                            <td style="padding:4px;"><%=borrowunit%></td>
                            <td style="padding:4px;">��&nbsp;��&nbsp;�ˣ�</td>
                            <td style="padding:4px;"><%=principal%></td>
                          </tr>
                          <tr>
                            <td style="padding:4px;">��&nbsp;��&nbsp;Ա��</td>
                            <td style="padding:4px;"><%=username%></td>
                            <td style="padding:4px;">״&nbsp;&nbsp;&nbsp;&nbsp;̬��</td>
                            <td style="padding:4px;"><%=strState%></td>
                          </tr>
						   <%if(approveTime!=null){%>
                          <tr>
                            <td style="padding:4px;">��&nbsp;��&nbsp;�ˣ�</td>
                            <td style="padding:4px;"><%=taster%></td>
                            <td style="padding:4px;">���ʱ�䣺</td>
                            <td style="padding:4px;"><%=approveTime%></td>
                          </tr>
						  <%}%>
						  <%if(backperson!=null && approveTime!=null){%>
                          <tr>
                            <td style="padding:4px;">��&nbsp;��&nbsp;�ˣ�</td>
                            <td style="padding:4px;"><%=backperson%></td>
                            <td style="padding:4px;">�黹ʱ�䣺</td>
                            <td style="padding:4px;"><%=backtime%></td>
                          </tr>
						  <%}%>
                        </table>
                        <%}
						}catch(Exception e){
							System.out.println(e.getMessage());
						}
						%>
                  </td>
                    </tr>
                  </table>
                  <table width="98%" height="46" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="right">&nbsp;<a href="#" onClick="history.back()">[����]</a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td width="10" valign="top" background="images/right.jpg">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="55" valign="top" background="images/bottom.jpg"><%@include file="copyright.jsp"%>
    </td>
  </tr>
</table>
</body>
</html>
