<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/style.css" type="text/css" rel="stylesheet">
<title>���ղ��͵ش�-��ҳ</title>
</head>
<%@ taglib prefix="s" uri="/struts-tags" %>

<script language="javascript">
function manage(){
		var hdc=window.open('blog/userManager/checkUser.jsp','','width=480,height=147');
		width=screen.width;
		height=screen.height;
		hdc.moveTo((width-480)/2,(height-147)/2);
	}
</script>

<body>

  <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="65" align="center"><img src="images/f_top1.gif" width="800" height="173"></td>
    </tr>   
  </table>
   
  <table width="800" height="28" border="0" align="center" cellpadding="0" cellspacing="0" background="images/f_top2.gif">
    <tr>    
      <td align="right">
	  <s:if test="%{#session.account==null}">    
    <a href="#" onClick="manage()" class="a1">��¼</a> | <a href="blog/userManager/addUserInfo.jsp" class="a1">ע��</a>   
    </s:if>
    <s:else>
    ��ӭ����<s:property value="%{#session.account}"/> | <a href="userInfo_landOutUser.htm" class="a1">��ȫ�˳�</a>  
    <s:if test="%{#session.freeze=='�ⶳ'}">| <a href="userInfo_goinUser.htm?account=${sessionScope.account}" target="_blank" class="a1">�����ҵĲ��Ϳռ�</a> 
    </s:if>
    </s:else>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	  
</td>
    </tr>
  </table>







  <table width="800" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td height="174"><table width="754" border="0" align="center" cellpadding="0" cellspacing="0">
	  
	  
        <tr align="center">
          <td width="160" height="152" valign="top"><br>
     
      <table width="103" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	      <td><img src="images/f_commend_blog.gif"></td>
	  </tr>
        <s:iterator value="%{#request.userCommned}" id="commned">
        <tr align="center">
          <td height="30" background="images/f_certer.gif"><a href="userInfo_goinUser.htm?account=<s:property value="#commned.account"/>" target="_blank"><s:property value="#commned.account"/></td>
        </tr>
        </s:iterator>
	  <tr>
	      <td><img src="images/f_down.gif"></td>
	  </tr>
      </table>
	  
	  
	  
	  
      <br></td>
          <td width="398" height="381" rowspan="2">
		  <br>		  <table width="398" height="374" border="0" cellpadding="0" cellspacing="0" background="images/f_main.gif">
            <tr>
              <td height="245">&nbsp;</td>
            </tr>
            <tr>
              <td height="129" valign="top">
			  <br>
			  <table width="371" height="70" border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="371"> <font color="A1882E">��ӭ�������ղ��͵ش��������������Ծ����㷢������С�<br>
                    ��������������������飬ע�����Է������ѵ����£�������<br>
                    �Ķ������˵����£����Խ��кܺõĹ�ͨ���ύ��������ѡ�<br>
������ɣ�ף�������зݺ�����!</font></td>
                </tr>
              </table></td>
            </tr>
          </table>		  <p>&nbsp;</p>          </td>
          <td width="160" valign="top"><br>
    
	
	  
      <table width="103" border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td><img src="images/f_hot_blog.gif"></td>
	  </tr>
	  
	  
        <s:iterator value="%{#request.userVistor}" id="vistor">
        <tr align="center">
          <td height="30" background="images/f_certer.gif"><a href="userInfo_goinUser.htm?account=<s:property value="#vistor.account"/>" target="_blank"><s:property value="#vistor.account"/></td>
        </tr>
        </s:iterator>
		 <tr>
	      <td><img src="images/f_down.gif"></td>
	  </tr>
      </table>
      <br>
          </td>
        </tr>
        <tr align="center">
          <td height="152" valign="top"><br>
           
            <table width="103" border="0" cellspacing="0" cellpadding="0">
			   <tr>
	             <td><img src="images/f_commend_article.gif"></td>
	           </tr>
			
			
              <s:iterator value="%{#request.articleCommend}" id="articleCommend">
              <tr align="center">
                <td height="30" background="<%=request.getContextPath()%>/images/f_certer.gif"><a href="articleInfo_f_article_query.htm?id=<s:property value="#articleCommend.id"/>" target="_blank"><s:property value="#articleCommend.title"/></td>
              </tr>
              </s:iterator>
			   <tr>
	      <td><img src="<%=request.getContextPath()%>/images/f_down.gif"></td>
	  </tr>
            </table>
            <br>
          </td>
          <td width="160" valign="top"><br>
         
            <table width="103" border="0" cellspacing="0" cellpadding="0">
			
			   <tr>
	             <td><img src="<%=request.getContextPath()%>/images/f_hot_article.gif"></td>
	           </tr>
			
              <s:iterator value="%{#request.articleVistor}" id="articleVistor">
              <tr align="center">
                <td height="30" background="<%=request.getContextPath()%>/images/f_certer.gif"><a href="articleInfo_f_article_query.htm?id=<s:property value="#articleVistor.id"/>" target="_blank"><s:property value="#articleVistor.title"/></td>
              </tr>
              </s:iterator>
			   <tr>
	      <td><img src="<%=request.getContextPath()%>/images/f_down.gif"></td>
	  </tr>
            </table>
            <br>
          </td>
        </tr>
      </table></td>
    </tr>
  </table>
  <table width="800" height="80" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr align="center">
      <td>
	  <hr width="780" color="#000000" size="2">
	  <br>       
      <font color="979797">����ʡ���տƼ����޹�˾   &nbsp;&nbsp;���ߵ绰��</font><font color="#8E335F">0431-84948981 &nbsp;84948981</font>
	  
	  
	  </td>
    </tr>
  </table>



</body>
</html>
