<%@ page contentType="text/html; charset=gb2312" language="java"%>
<jsp:useBean id="sysDAO" class="com.dao.SysDAO" scope="request"/>
<%
int rtn=sysDAO.sysinitialize();
if(rtn==0){
	out.println("<script>alert('ϵͳ��ʹ��ʧ�ܣ�');window.location.href='initialize.jsp';</script>");
}else{

	out.println("<script>alert('ϵͳ��ʹ���ɹ���\\r��ǰϵͳ��ֻ��mrһ���û��������µ�¼��');window.location.href='index.jsp'</script>");
	//out.println("<script>alert('ϵͳ��ʹ���ɹ���\\r��ǰϵͳ��ֻ��mrһ���û��������µ�¼��');</script>");
}
%>