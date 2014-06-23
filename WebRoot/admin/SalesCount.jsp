<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GB18030"%>
<%@ page import="com.zx.shopping.stat.*, java.util.*"%>

<%
List<ProductStatItem> items = StatService.getProductsBySaleCount(); 
String imgName = (String)request.getAttribute("imgName");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>水果销量统计</title>
</head>
<body>
<table align="left" border="1">
	<tr>
		<td bgcolor="yellow">水果名称</td>
		<td bgcolor="yellow">水果数量</td>
		
	</tr>
	<%
	for(int i=0; i<items.size(); i++) {
		ProductStatItem p = items.get(i);
		%>
		<tr>
			<td><%=p.getProductName() %></td>
			<td><%=p.getTotalSalesCount() %></td>
			
		</tr>
		<%
	}
	%>
	
</table>

<img src="<%=request.getContextPath()%>/admin/images/stat/<%=imgName%>"></img>
</body>
</html>