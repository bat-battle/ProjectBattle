<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <link href="images/css.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  	<table align="center" width="90%">
		<tr>
			<td colspan="2">
				<table width="750px">
					<tr>
						<td align="right" valign="middle">
							&nbsp;
							<a href="manager/addSpecialty.jsp"><img
									src="images/addSpecialty.gif" border="0" />
							</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="34" height="32" valign="middle">
				&nbsp;
				<span class="STYLE1"><img src="images/jiantou.jpg" width="15"
						height="17" />
				</span>
			</td>
			<td width="779" valign="middle">
				<span class="STYLE1">��ǰλ�ã�</span>רҵ����
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<p>
				<table border="0" align="center" cellpadding="0" cellspacing="0"
					width="750">
					<tr>
						<td class="td0">
							רҵ���
						</td>
						<td class="td0">
							רҵ����
						</td>
						<td class="td0">
							�������
						</td>
						<td class="td0">
							רҵѧ��
						</td>
						<td class="td0">
							�Ƿ��ҵ
						</td>
						<td class="td0">
							����
						</td>
					</tr>
					<logic:iterate id="specialty" name="list">
						<tr>
							<td class="td1">
								${specialty.id}
							</td>
							<td class="td1">
								${specialty.name}
							</td>
							<td class="td1">
								${specialty.enterYear}
							</td>
							<td class="td1">
								${specialty.langthYear}
							</td>
							<td class="td1">
								${specialty.isFinish?"��":"��"}
							</td>
							<td class="td1">
								<logic:equal name="specialty" value="true" property="isFinish">
    				�ѽ�ҵ    			</logic:equal>
								<logic:equal name="specialty" value="false" property="isFinish">
									<html:link page="/specialty.do?method=updateIsFinish"
										paramId="id" paramName="specialty" paramProperty="id">����Ϊ�ѽ�ҵ</html:link>
								</logic:equal>
							</td>
						</tr>
					</logic:iterate>
				</table>
			</td>
		</tr>
	</table>
  </body>
</html:html>
