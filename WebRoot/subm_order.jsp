<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=GBK"
	import="com.zx.shopping.user.*,com.zx.shopping.client.*,com.zx.shopping.order.*,java.util.*"
	pageEncoding="GBK"%>


<%
	request.setCharacterEncoding("GBK");

	User u = (User) session.getAttribute("user");
	if (u == null) {
		response.sendRedirect("UserLogin.jsp");
		return;
	}

	Cart c = (Cart) session.getAttribute("cart");
	if (c == null) {
		c = new Cart();
		session.setAttribute("cart", c);
	}
	System.out.println(c.getTotalMemberPrice());

	//String addr = request.getParameter("addr");
	//u.setAddr(addr);

	int orderId = u.buy(c); 

	//session.removeAttribute("cart");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="css/subm_order.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}
.STYLE1 {color: #FF0000}
.STYLE4 {color: #0033FF}
-->
</style></head>
<body>
<!--wrap-->
<div id="wrap">
	<!--top-->
	<div id="header">
    	<h1><img src="images/h1.jpg" alt="Gopile" /></h1>
        <div id="welcome">
           <%if(u.getId()==0){ %> <p>您好，欢迎来到水果帮商城！[<a href="Register.jsp">免费注册</a>]</p> 
      <%} else{%> 
          <p>您好，欢迎[<a href="UserAccount.jsp"><%=u.getUsername() %></a>]来到水果帮商城！</p>
          <%} %>
        </div>
      <div id="phoneno">400-600-4008</div>
        <div id="search">
        	<input type="text" class="t" />
            <input type="button" value="搜索" class="b" />
            <div id="circle"></div>
        </div>
        <div id="cab"><a href="maycab.jsp"><img src="images/cab0.png" alt="购物车" /></a></div>
    </div>
	<!--//top-->
    <!--path-->
   	<div id="path">
    	<div class="path1">1、我的购物车</div>
        <div class="path2">2、确认订单信息</div>
        <div class="path3">3、成功提交订单</div>
    </div>
    <!--//path-->
    <!--content-->
    <div id="content">
    	<div id="head">订单<span class="STYLE4">已生成! 单号:
<%=orderId%></span>已提交。<a href="currentmyorder.jsp">查看订单状态</a></div>
      <p>&nbsp;</p>
        <div id="head">订单<span class="STYLE4">已生成! 单号:
<%=orderId%></span>已生成，将于<span class="STYLE1">三天内</span>发货。<a href="Index.jsp">继续浏览商品</a></div>
      <div id="warn">*您可以在“<a href="myorder.jsp">我的订单</a>”中查看或取消您的订单，由于系统需要进行预约处理，您可能不会立即查询到刚提交的订单。</div>
    </div>
    <%
    if(u.getId()==0){session.removeAttribute("user"); 
     session.invalidate();} %>
    <!--//content-->
    <!--ads-->
    <div id="ads"></div>
    <!--//ads-->
    <!--bottom-->
    <div id="bottom">
   		
        <p>联系电话：18036095723</p>
        <p>Copyright 2013-2014 苏州独墅湖水果商城</p>
    </div>

</div>
<!--//wrap-->
</body> 
</html>
