<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.user.*" %>
<%
session.removeAttribute("user"); 
session.invalidate(); 
out.print("<script>alert('用户即将退出，确定后退出该页面。');window.location.href='Index.jsp'</script>"); 
%> 