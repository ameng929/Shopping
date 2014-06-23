<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.user.*" %>
<% request.setCharacterEncoding("gbk");
   response.setContentType("text/html;charset=gbk"); %> 
<%
User u = (User)session.getAttribute("user");
if(u==null) {
	response.sendRedirect("Index.jsp");
	return;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户管理</title>
<html>
<script language="javascript">
	state = 0 ;
	menuState = 0;
	mainState = 0;
</script>

<head>
<title>自助服务</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">


</head>

 <frameset rows="140,*" frameborder="0" border="0" framespacing="0" cols="*" scrolling="YES" >
  <frame name="top" scrolling="NO" noresize src="daohang.jsp">
  <frameset cols="8%,15%,70%,*" frameborder="0" border="0" framespacing="0" rows="*" scrolling="YES" name="mleft">
    <frame name="left" frameborder="0" border="0" framespacing="0" rows="*" scrolling="NO" >
    <frame src="YHMenu.jsp" frameborder=NO border="0" scrolling="NO" >
     <frame src="myorder.jsp" frameborder=0  name="main" marginwidth="0" marginheight="0" scrolling="YES">
     <frame name="right" frameborder="0" border="0" framespacing="0" rows="*" scrolling="NO" >
  </frameset>
 </frameset>


<noframes>
</noframes>
</html>