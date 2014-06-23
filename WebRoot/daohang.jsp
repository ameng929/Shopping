<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.zx.shopping.user.*" %>
<%
User u = (User)session.getAttribute("user");
if(u==null) {
	response.sendRedirect("Loginin.jsp");
	return;
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script src="script/SlideTrans.js"></script>
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<link href="SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
body,td,th {
	font-family: Times New Roman, Times, serif;
	font-weight: bold;
}
-->
</style></head>
<body>
<!--wrap-->
<div id="wrap">
	<!--top-->
<div id="header" style="font-weight: normal;">
    	<h1><a href="category.html"> <img src="images/h1.jpg" alt="Gopile" width="105" height="57" /></h1>
      <div id="welcome"><a href="UserAccount.jsp">您好，欢迎[<%=u.getUsername() %>]来到水果商城!</a></div>
      <div id="myacount"></div>
     
      <div id="cab"><a href="maycab.jsp"><img src="images/cab0.png" alt="购物车" /></a></div>
      <div id="phoneno">18036095723</div>
     <div id="search">
        	<input type="text" class="t" />
            <input type="button" value="搜索" class="b" />
            <div id="circle"></div>
     </div>
    </div>
	<!--//top-->
    <!--menu-->
   	<div id="menu">
    	<!--gnb-->
    	<div id="gnb">
        	<div class="ttl" style="font-weight: normal;">会员中心</div>
   	      <ul>
   	  			<li class="li1" style="font-weight: normal;"><a href="Index.jsp" target="_blank"><span >我的账号</span></a></li>
                <li><a href="Index.jsp" target="_blank"><span >首页</span></a></li>
        		<li><a href="More.jsp">特惠专区</a></li>
                <li><a href="More.jsp">进口水果</a></li>
                <li><a href="More.jsp">国产水果</a></li>
                <li><a href="More.jsp">水果礼品</a></li>
                <li><a href="getSjzdflxx.action">套餐</a></li>
            
          </ul>
        </div>
     </div>
</body>
</html>
