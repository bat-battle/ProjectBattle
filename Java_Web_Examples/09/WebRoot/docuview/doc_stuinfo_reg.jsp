<%@ page language="java"  pageEncoding="gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/style.css" rel="stylesheet">
<script type="text/javascript" src="js/checkform.js"></script>
<script language="javascript">
	function opendialog(){
		//var someValue=window.showModalDialog('getAllstuinfo.htm','','dialogWidth:600px;dialogHeight:320px;status:no;help:no;scrolling=no;scrollbars=yes;');
		var someValue=window.location.href='getAllstuinfo.htm';
		stuid.value=someValue;	
	}
	function openurl(sid){
		//alert(sid);
		window.location.href = "stureginfoList.htm?stuid="+sid;
	}
	function deal(){		
		if(confirm("�Ƿ����ѧ���Ǽ���Ϣ���ݴ��̲�����")){
			form1.submit();
		}
	}	
</script>
<html>
<head>

<c:if test="${sessionScope.loginUser==null}">
	<script language="javascript">
		alert("��δ��¼�����߳�ʱ�����¼ϵͳ");
		window.location.href="Content.jsp";		
	</script>  
</c:if>
</head>
<body>
<tr>
		 <td height="44" colspan="6">
			&nbsp;
		 </td>
		</tr>
<form method="POST" action="stuInfoInsert.htm?ctname=dsg" name="form1" onsubmit="return sturegvalid(form1)">
     <table width="520" height="50" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td><div align="center">ѧ�����		  
				     <input type="text" name="stuid" value="${messages.stuId}" onkeypress="if(event.keyCode==13){openurl(stuid.value)}"/>				
				     <input type="button" name="ok" value="ȷ��" onClick="openurl(stuid.value)"/>
				     <input type="submit" name="submit" value="�ύ" />
	                </div>        
				</td>
			</tr>			
		</table>
		
			<p align="center">
            <table width="520" height="149" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="94" height="35">ѧ������</td>
                <input type="hidden" name="stu_id" value="${messages.stuId}">
                <td width="188"><input type="text" name="name" value="${messages.name}" readonly="readonly"></td>
                <td>�༶����</td>
                <td><input name="bjmc" type="text" value="${messages.classmc}" readonly="readonly"></td>
              </tr>
              <tr>
                <td height="34">רҵ����</td>
                <td><input type="text" name="zymc" value="${messages.zymc}" readonly="readonly"></td>
                <td> ��ѧ���� </td>
                <td><input type="text" name="djrq" value="${messages.djrq}" readonly></td>
              </tr>
              <tr>
                <td height="30"><font color="red"> ������ </font></td>
                <td><input type="text" name="jbr"></td>
                <td><font color="red"> ��ѧ����</font> </td>
                <td><input type="text" name="lqfs"></td>
              </tr>
              <tr>
                <td colspan="4">
	               <input type="hidden" name="classid" value="${messages.classid}"/>
    	           <input type="hidden" name="lsh" value="${messages.lsh}"/>
				</td>
              </tr>
          </table>
          <center><FONT color="red" size="4">${messages.msg}</Font></center>
		</form>		
		   ${sysMsgInf}
</body>
</html>