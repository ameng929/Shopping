<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import=" com.zx.shopping.order.*, java.util.*" %>


<%
int id = Integer.parseInt(request.getParameter("id"));
SalesOrder so = OrderMgr.getInstance().loadById(id); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   	 	<title>苏州独墅湖水果商城</title>
    </head>
    <frameset rows="30,*,30" cols="*">
      <frame src="top.html" frameborder="0" scrolling="no">
      <frame src="main.jsp?id=<%=so.getId() %>" frameborder="0" scrolling="auto">
      <frame src="copyright.html" frameborder="0" scrolling="no">
    </frameset><noframes></noframes>
    <noframes>
</html>
