<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<title>�������߿��ԡ�����̨����</title>
<link href="../CSS/style.css" rel="stylesheet">
<script language="javascript" src="../JS/AjaxRequest.js">
</script>
</head>
<script language="javascript">

function F_getTaoTi(val){
	var loader=new net.AjaxRequest("questions.do?action=queryTaoTi&id="+val+"&nocache="+new Date().getTime(),deal,onerror,"GET");
}
function onerror(){
	alert("������");
}
function deal(h){
	whichTaoTi.innerHTML=this.req.responseText;
}
function checkForm(form){
	if(form.name.value==""){
		alert("�����뿼����Ŀ����!");form.name.focus();return false;
	}
}
function show(val){
		if(val=="��ѡ��"){
		sOption.style.display="";
		mOption.style.display="none";
	}else if(val=="��ѡ��"){
		sOption.style.display="none";
		mOption.style.display="";		
	}
}
</script>
<body onLoad="F_getTaoTi(questionsForm.lessonId.value)">
<%@ include file="top.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="left.jsp"%></td>
    <td width="602" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="78%" class="word_grey">&nbsp;��ǰλ�ã�<span class="word_darkGrey">������Ŀ���� &gt; ��ӿ�����Ŀ &gt;&gt;&gt;</span></td>
              <td align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;��ǰ����Ա��<%=session.getAttribute("manager")%>&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
</tr>
</table> 
<html:form action="/manage/questions.do?action=questionsAdd" method="post" onsubmit="return checkForm(questionsForm)">
  <table width="85%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr>
    <td height="30" align="left" style="padding:5px;">�����γ̣�</td>
    <td align="left">
	 <html:select property="lessonId" onchange="F_getTaoTi(this.value)">
		<html:options collection="lessonList" property="ID" labelProperty="name"/>
	 </html:select>
     </td>
    </tr>
    <tr>
    <td height="30" align="left" style="padding:5px;">�������⣺</td>
    <td align="left" id="whichTaoTi">
     </td>
    </tr>
  <tr align="center">
    <td width="15%" height="30" align="left" style="padding:5px;">������Ŀ��</td>
    <td width="85%" align="left">
      <html:text property="subject" size="40"/> *
	  </td>
    <tr>
    <tr>
    <td height="30" align="left" style="padding:5px;">�������ͣ�</td>
    <td align="left">
	 <html:select property="type" onchange="show(this.value)">
		<html:option value="��ѡ��">��ѡ��</html:option>
		<html:option value="��ѡ��">��ѡ��</html:option>
	 </html:select>
     </td>
    </tr>	
    <tr align="center">
    <td width="15%" height="30" align="left" style="padding:5px;">ѡ��A��</td>
    <td width="85%" align="left">
      <html:text property="optionA" size="40"/> *
	  </td>
    </tr>
	  <tr align="center">
    <td width="15%" height="30" align="left" style="padding:5px;">ѡ��B��</td>
    <td width="85%" align="left">
      <html:text property="optionB" size="40"/> *
	  </td>
    </tr>
	  <tr align="center">
    <td width="15%" height="30" align="left" style="padding:5px;">ѡ��C��</td>
    <td width="85%" align="left">
      <html:text property="optionC" size="40"/> *
	  </td>
    </tr>
  <tr align="center">
    <td width="15%" height="30" align="left" style="padding:5px;">ѡ��D��</td>
    <td width="85%" align="left">
      <html:text property="optionD" size="40"/> *
	  </td>
    </tr>
    <tr align="center">
    <td width="15%" height="30" align="left" style="padding:5px;">��ȷ�𰸣�</td>
    <td width="85%" align="left" id="sOption">
      <html:select property="answer">
		<html:option value="A">A </html:option>
		<html:option value="B">B </html:option>
		<html:option value="C">C </html:option>
		<html:option value="D">D </html:option>		
	 </html:select>
	  </td>	
    <td width="85%" align="left" id="mOption" style="display:none">
 	<html:multibox property="answerArr" styleClass="noborder">A</html:multibox>A
	<html:multibox property="answerArr" styleClass="noborder">B</html:multibox>B
	<html:multibox property="answerArr" styleClass="noborder">C</html:multibox>C
	<html:multibox property="answerArr" styleClass="noborder">D</html:multibox>D
	  </td>		  
    </tr>
	
	  <tr align="center">
    <td width="15%" height="30" align="left" style="padding:5px;">��ע��</td>
    <td width="85%" align="left">
      <html:text property="note" size="40"/>
	  </td>
    </tr>	
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><html:submit property="submit" styleClass="btn_grey" value="����"/>
        &nbsp;
        <html:reset property="reset" styleClass="btn_grey" value="ȡ��"/>
		&nbsp;
		<html:button property="button" styleClass="btn_grey" value="����" onclick="window.location.href='questions.do?action=questionsQuery'"/>		</td>
    </tr>
</table>
</html:form>
</td>
      </tr>
    </table>
</td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
