<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
	<link rel="stylesheet" type="text/css" href="../images/css.css">
    <style type="text/css">
<!--
.STYLE5 {font-size: 9pt}
-->
    </style>
  </head>
  
  <body>
  	  	<table width="955px" align="center" cellspacing="0">
		<tr>
			<td height="20" colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td width="25" valign="middle">&nbsp;<img src="../images/jiantou.jpg" width="15" height="17" /></td>
		    <td colspan="3" valign="middle"><span class="STYLE1">��ǰλ�ã�</span>רҵ����-&gt;�����רҵ</td>
		</tr>
		<tr>
			<td height="20" colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;			</td>
		    <td width="61">&nbsp;</td>
		    <td width="605" align="left">
				<html:form action="/specialty.do?method=insert">
					<table border="0" align="center" cellpadding="0" cellspacing="1"
						bgcolor="#c2d3b0">
						<tr>
							<td width="20%" height="24" bgcolor="#FFFFFF" class="td0">
								&nbsp;��ѧ��ݣ�&nbsp;
							</td>
							<td width="43%" bgcolor="#FFFFFF">
								&nbsp;
								<html:select property="enterYear">
									<html:option value="2005">2005��</html:option>
									<html:option value="2006">2006��</html:option>
									<html:option value="2007">2007��</html:option>
									<html:option value="2008">2008��</html:option>
									<html:option value="2009">2009��</html:option>
									<html:option value="2010">2010��</html:option>
								</html:select>
							</td>
							<td width="37%" bgcolor="#FFFFFF" class="STYLE2">
								&nbsp;��ѡ����רҵ����ѧ���&nbsp;
							</td>
						</tr>
						<tr>
							<td height="24" bgcolor="#FFFFFF" class="td0">
								&nbsp;רҵ���ƣ�&nbsp;
							</td>
							<td bgcolor="#FFFFFF">
								&nbsp;
								<html:text property="name" />
							</td>
							<td bgcolor="#FFFFFF" class="STYLE2">
								&nbsp;��������רҵ����&nbsp;
							</td>
						</tr>
						<tr>
							<td height="24" bgcolor="#FFFFFF" class="td0">
								&nbsp;ѧ�ƣ�&nbsp;
							</td>
							<td bgcolor="#FFFFFF">
								&nbsp;
								<html:select property="langthYear">
									<html:option value="2">2��</html:option>
									<html:option value="3">3��</html:option>
									<html:option value="4">4��</html:option>
									<html:option value="5">5��</html:option>
								</html:select>
							</td>
							<td bgcolor="#FFFFFF" class="STYLE2">
								&nbsp;��ѡ����רҵ��ѧ��&nbsp;
							</td>
						</tr>
						<tr>
							<td height="24" colspan="3" align="center" bgcolor="#FFFFFF">
								<html:submit value="ȷ��" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		    <td width="124">&nbsp;</td>
		</tr>
  </table>
  </body>
</html:html>
