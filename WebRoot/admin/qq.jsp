<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.user.*"%>
<%@ page import="QQ.*"%>
<%

String action = request.getParameter("action");
String action1 = request.getParameter("action1");
if(action != null && action.trim().equals("startserver")) {
	new Server(8888).start();
}
if(action1 != null && action1.trim().equals("login"))
{
 new Login();
}
 %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>QQ</title>
<h1> 注意：请先开启通信服务器然后再登入qq！</h1>
      <span> <form name="form" action="qq.jsp" method="post">
		<input type="hidden" name="action" value="startserver"/>
        <input type="submit" value="开启qq通信服务器"/>
      
   
        </form></span> 
        <span>
        <form name="qq1" action="qq.jsp" method="post">
        <input type="hidden" name="action1" value="login"/>
      
        <input type="submit" value="登入管理员qq"/>
        </form></span>
</body>
</html>
