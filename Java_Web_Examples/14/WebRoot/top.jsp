<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.core.BasetableFactory" %>
<%@ page import="com.model.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script src="js/onclock.JS"></script>
<script language="JavaScript">
function popUp(menu) {
newX = window.event.x + document.body.scrollLeft
newY = window.event.y + document.body.scrollTop
  if ( menu.style.display == ""){
    menu.style.display = "none" }
  else {
    menu.style.display = ""}
    menu.style.pixelLeft = newX-5
    menu.style.pixelTop =  newY-5
}
function popmenu(menu) {
  if ( menu.style.display == ""){
    menu.style.display = "none" }
  else {
    menu.style.display = ""}
}
function pu(e){
cc=e.srcElement;
cc.style.background="#eeeeee";
}
function po(e){
cc=e.srcElement;
cc.style.background="";
}
</script>
<%BasetableFactory bf=BasetableFactory.getInstance();%>
<table id="cpdd" class='box'  style='display:none' onMouseOver="popmenu(this)" onMouseOut="popmenu(this)"  align="center" > 
  <%Collection cpdd=bf.ListSsort("");if(cpdd!=null&&cpdd.size()>0){    Iterator it=cpdd.iterator();    while(it.hasNext()){        Ssort s=(Ssort)it.next();
%> 
  <tr> 
    <td onMouseOver="pu(event)" onMouseOut="po(event)" onClick="javascript:window.location.href='list_softsort.jsp?sid=<%=s.getSid()%>';" style="cursor:hand; color:#000000"><%=s.getName()%></td> 
  </tr>   <%}}%> 
</table> 
<table id="jjfa" class='box'  style='display:none' onMouseOver="popmenu(this)" onMouseOut="popmenu(this)" align="center"> 
  <%Collection jjfa=bf.ListResolvent("");
if(cpdd!=null&&jjfa.size()>0){    Iterator it=jjfa.iterator();
    while(it.hasNext()){        Resolvent s=(Resolvent)it.next();%> 
  <tr> 
    <td  onMouseOver="pu(event)" onMouseOut="po(event)" onClick="javascript:window.location.href='resolvent.jsp?rid=<%=s.getRid()%>';" style="cursor:hand; color:#000000"><%=s.getName()%></td> 
  </tr>   <%}}%> 
</table> 
<table id="jszc" class='box'  style='display:none' onMouseOver="popmenu(this)" onMouseOut="popmenu(this)"  align="center"> 
  <tr> 
    <td onMouseOver="pu(event)" onMouseOut="po(event)" onClick="javascript:window.location.href='question.jsp';" style="cursor:hand; color:#000000">��������</td> 
  </tr> 
  <tr> 
    <td onMouseOver="pu(event)" onMouseOut="po(event)" onClick="javascript:window.location.href='tools.jsp?action=tool';" style="cursor:hand; color:#000000">��������</td> 
  </tr> 
  <tr> 
    <td onMouseOver="pu(event)" onMouseOut="po(event)" onClick="javascript:window.location.href='tools.jsp?action=mend';" style="cursor:hand; color:#000000">��������</td> 
  </tr> 
</table> 
<table id="khqd" class='box'  style='display:none' onMouseOver="popmenu(this)" onMouseOut="popmenu(this)" align="center"> 
  <tr> 
    <td onMouseOver="pu(event)" onMouseOut="po(event)" onClick="javascript:window.location.href='user_reg.jsp';" style="cursor:hand; color:#000000">�û�ע��</td> 
  </tr> 
  <tr> 
    <td onMouseOver="pu(event)" onMouseOut="po(event)" onClick="javascript:window.location.href='user_logon.jsp';" style="cursor:hand; color:#000000">�û���¼</td> 
  </tr> 
  <tr> 
    <td onMouseOver="pu(event)" onMouseOut="po(event)" onClick="javascript:window.location.href='user_update.jsp';" style="cursor:hand; color:#000000">�û��޸�</td> 
  </tr>
<%
User u=(User)session.getAttribute("user");
if(u!=null &&u.getStatus()==1){
	out.println("<tr><td onMouseOver='pu(event)' onMouseOut='po(event)' onClick=javascript:window.location.href='admin/index.jsp'; style='cursor:hand; color:#000000'>�����̨</td> </tr>");
} 
%>
</table> 
<table width="781" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="31" height="76" background="images/banner_bg.gif">&nbsp;</td>
    <td width="175" background="images/banner_bg.gif"><img src="images/logo.gif" width="173" height="76" /></td>
    <td width="267" background="images/banner_bg.gif">��â�Ƽ���ӭ����</td>
    <td width="267" background="images/banner_bg.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/top_homepage.GIF" width="11" height="10" /></td>
        <td><a href="#" onclick="this.style.behavior='url(#default#homepage)';this.sethomepage('htttp://www.mingrisoft.com')">��Ϊ��ҳ</a></td>
        <td><img src="images/top_favorite.GIF" width="11" height="9" /></td>
        <td><a href="JavaScript:window.external.AddFavorite('Http://www.mingrisoft.com','���տƼ�')">�ղر�վ</a></td>
        <td><img src="images/top_contact.GIF" width="11" height="8" /></td>
        <td><a href="mailto:mingrisoft@mingrisoft.com">��ϵ����</a></td>
        <td><img src="images/top_about.gif" width="11" height="10" /></td>
        <td><a href="http://www.mingrisoft.com">����</a></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="781" height="252" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="11" height="252" rowspan="2" align="center" valign="top" background="images/bg_ad.GIF">&nbsp;</td>
    <td width="189" height="30" align="center" background="images/bg_navigation.GIF"><div id="bgclock" class="word_white"></div></td>
    <td width="570" align="center" background="images/bg_navigation.GIF"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0"> 
  <tr> 
    <td width="20" height="22" align="center" valign="middle"><img src="images/index_separate.gif" width="6" height="9"></td> 
    <td align="left"><a href="index.jsp" class="word_white">��ҳ</a></td> 
    <td width="20" align="center" valign="middle"><img src="images/index_separate.gif" width="6" height="9"></td> 
    <td align="left"><a onMouseOver="popUp(cpdd)" onMouseOut="popUp(cpdd)" class="word_white">��Ʒ�ش�</a></td> 
    <td width="20" align="center" valign="middle"><img src="images/index_separate.gif" width="6" height="9"></td> 
    <td align="left"> <a onMouseOver="popUp(jjfa)" onMouseOut="popUp(jjfa)" class="word_white">�������</a> </td> 
    <td width="20" align="center" valign="middle"><img src="images/index_separate.gif" width="6" height="9"></td> 
    <td align="left"> <a onMouseOver="popUp(jszc)" onMouseOut="popUp(jszc)" class="word_white">����֧��</a></td> 
    <td width="20" align="center" valign="middle"><img src="images/index_separate.gif" width="6" height="9"></td> 
    <td> <a onMouseOver="popUp(khqd)" onMouseOut="popUp(khqd)" class="word_white">�û�����</a>      </td> 
    <td width="20" align="center" valign="middle"><img src="images/index_separate.gif" width="6" height="9"></td> 
    <td align="left"> <a href="list_guestboard.jsp" class="word_white">���Բ�</a></td> 
  </tr> 
</table></td>
    <td width="11" rowspan="2" align="center" valign="top" background="images/bg_ad.GIF">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top"><img src="images/ad.JPG" width="759" height="222" /></td>
  </tr>
</table>