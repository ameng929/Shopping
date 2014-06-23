<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@taglib  prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ShowSjzdfl</title>
</head>
<body>
	<form action="updateSjzdfl.action" method="post">
	<center><img src="image/user.gif"> <font size="2">录入数据字典分类</font></center>
			<table align="center" border="1"  cellspacing="0">
			<tr bgcolor="#666666" height="27">
				<td align="center"><font color="#FFFFFF" size="2">序号</font></td>
				<td align="center"><font color="#FFFFFF" size="2">启用</font></td>
				<td align="center"><font color="#FFFFFF" size="2">选项内容</font></td>
			</tr>
			<s:iterator value="#request.allSjzdfl" id="sjzdfl">
				<tr bgcolor="#E3E3E3">
				<td align="center"><s:property value="#sjzdfl.sjzdflId"/></td>
				<s:hidden name="sjzdflIds" value="%{#sjzdfl.sjzdflId}"></s:hidden>
				<td align="center"><input type="checkbox"
				 <s:if test="#sjzdfl.qiyong == 'yes'">
				 checked="checked"
				 </s:if>
				  name="checks" value='qiyong<s:property value="#sjzdfl.sjzdflId"/>'> </td>
				<td align="center"><input type="text" name="sjzdflmcs" value='<s:property value="#sjzdfl.sjzdflmc"/>'/></td>
			</tr>
			</s:iterator>
		</table><br>
			<center><input type="submit" value="提交"></center>
		</form>
</body>
</html>