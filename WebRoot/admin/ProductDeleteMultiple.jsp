<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.product.*"%>

<%
String[] idArray = request.getParameterValues("id");
if(idArray == null || idArray.length == 0) {
	out.println("ID���������");
	return;
}
ProductMgr.getInstance().delete(idArray);
%>
<meta http-equiv="refresh" content="1;url=../admin/ProductList.jsp">
<html>
	<head>
		<title>ɾ����Ʒ</title>
	</head>
	<center>
		ɾ���ɹ���
	</center>
	<body>
		<script type="text/javascript">	
			parent.main.location.reload();
		</script>
	</body>
</html>