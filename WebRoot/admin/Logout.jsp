<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.user.*" %>
<%
session.removeAttribute("user"); 
session.invalidate(); 
out.print("<script>alert('�û������˳���ȷ�����˳���ҳ�档');window.location.href='Index.jsp'</script>"); 
%> 