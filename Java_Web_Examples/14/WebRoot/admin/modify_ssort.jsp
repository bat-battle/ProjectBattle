<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Ssort" %>
<%@ page import="com.core.*" %>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<%
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
session.removeAttribute("error");
String action =request.getParameter("action").toString();
int sid=ParamUtils.getIntParameter(request,"sid");
BasetableFactory bf=BasetableFactory.getInstance();
if(action==null||"".equals(action)){return;}
else if("add".equals(action)&&bf.CreateSsort(request)){
        response.sendRedirect("manage_ssort.jsp");}
else if("del".equals(action)){
if(bf.SearchMend("WHERE sid="+sid).getMid()!=0){
        session.setAttribute("error","������ɾ������𣬸�����ڹ��������б�ʹ��");
        response.sendRedirect("error.jsp");        }
else if(bf.SearchResolvent("WHERE sid="+sid).getRid()!=0){
        session.setAttribute("error","������ɾ������𣬸�����ڽ�������б�ʹ��");
        response.sendRedirect("error.jsp");        }
else if(bf.SearchSoft("WHERE sid="+sid).getSfid()!=0){
        session.setAttribute("error","������ɾ������𣬸�����������Դ�б�ʹ��");
        response.sendRedirect("error.jsp");        }
else if(bf.DeleteSsort("WHERE sid="+sid)){
        response.sendRedirect("manage_ssort.jsp");        }
else{
        session.setAttribute("error","ɾ��ʧ��");
        response.sendRedirect("error.jsp");}}
else if("modify".equals(action)){
        Ssort l=bf.SearchSsort("WHERE sid="+sid);
        l.setName(ParamUtils.getRequestString(request,"name"));
        l.setResume(ParamUtils.getRequestString(request,"resume"));
        response.sendRedirect("manage_ssort.jsp");
}else{        session.setAttribute("error","����������в���ʧ��");
        response.sendRedirect("error.jsp");}
%>
