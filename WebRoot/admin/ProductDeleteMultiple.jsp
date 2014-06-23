<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.product.*"%>

<%
String[] idArray = request.getParameterValues("id");
if(idArray == null || idArray.length == 0) {
	out.println("ID号输入错误！");
	return;
}
ProductMgr.getInstance().delete(idArray);
%>
<meta http-equiv="refresh" content="1;url=../admin/ProductList.jsp">
<html>
	<head>
		<title>删除产品</title>
	</head>
	<center>
		删除成功！
	</center>
	<body>
		<script type="text/javascript">	
			parent.main.location.reload();
		</script>
	</body>
</html>