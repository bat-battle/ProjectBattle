<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/common_admin.jsp"%>
<s:form action="category_save" namespace="/admin/product">
	<s:hidden name="pid"></s:hidden>
	<s:hidden name="level"></s:hidden>
	<div id="right">
	<div id="right_top"><img
		src="${context_path}/css/images/blue.gif" width="16" height="16" /> <span
		class="word01">添加商品类别</span></div>
	<div id="right_mid">
	<div id="tiao">
	<table width="685" height="24" border="0">
		<tr>
			<td colspan="2">
			<span style="color: red;">
				<s:fielderror></s:fielderror>
			</span>
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">类别名称：</td>
			<td><s:textfield name="name"></s:textfield></td>
		</tr>
	</table>
	</div>
	</div>
	<div id="right_foot"><s:submit type="image"
		src="%{context_path}/css/images/ht_02_18.gif"></s:submit></div>
	</div>
</s:form>