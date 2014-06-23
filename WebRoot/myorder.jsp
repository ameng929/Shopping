<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.product.*"%>
<%@ page import="com.zx.shopping.category.*"%>
<%@ page import="java.sql.*, com.zx.shopping.order.*,com.zx.shopping.user.*, java.util.*" %>

<%
User u = (User)session.getAttribute("user");
int id=u.getId();
if(u == null) {
	response.sendRedirect("Loginin.jsp");
	return;
}

%>



<%

List<SalesOrder> orders = new OrderMySQLDAO().loadByUId(id);


String statu;
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="css/myorder.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--wrap-->
<div id="wrap">
	
    <!--content-->
    <div id="content">
    	<div id="ttl">我的订单</div>
        <!--content----header-->
        <div id="header">
        	<div class="head1">商品名称</div>
            <div class="head2">单价（元）</div>
            <div class="head2">数量</div>
            <div class="head2">实付款（元）</div>
            <div class="head2">交易状态</div>
            <div class="head2">交易操作</div>
        </div>
        <!--//content----header-->
        <!--content----order1-->
        <% //显示所有的订单
		for(Iterator<SalesOrder> it = orders.iterator(); it.hasNext(); ) {
			SalesOrder so = it.next();
			if(so.getStatus()==0)
			{
			statu="待处理";
			}
			else
			{
			statu="交易成功";
			}
			System.out.println(so.getId());
		%>
        <div id="order1">
        	<div id="no">订单编号：<%=so.getId()%> 成交时间：<%=so.getODate() %></div>
        	
        <%//得到订单里面的每一项
        List<SalesItem> items = new OrderMySQLDAO().getSalesItems(so.getId());
        for(Iterator<SalesItem> its = items.iterator(); its.hasNext(); ) {
			SalesItem si = its.next();
		%>
            <div id="prod1">
                <div class="name"><img src="upload/<%=si.getProduct().getId() %>.jpg" alt="pan" width="72" height="58"/><%=si.getProduct().getName() %></div>
                <div class="price">￥<%=si.getProduct().getMemberPrice() %></div>
                <div class="amount"><%=si.getCount() %></div>
                <div class="amount">￥<%=si.getCount()*si.getProduct().getMemberPrice() %></div>
                <div class="amount"><%=statu %></div>
                <%
                OrderMySQLDAO OM=new OrderMySQLDAO();
                
                if(OM.judge(si)==0){
                
                %>
                <div class="price"><a href="Comment.jsp?oid=<%=si.getOrderId() %>&pid=<%=si.getProduct().getId() %>&siid=<%=si.getId() %>" target="main">追加评论</a></div>
            <%}else{ %>
            <div class="price"><a href="#" target="main">已评价</a></div>
            <%} %>
            </div>
             <%
        }
        %>
        </div>
        
        
         
         <%
        }
        %>
        <!--//content----order1-->
        
    </div>
	<!--//content-->
    <!--ads-->
    <div id="ads"></div>
    <!--//ads-->
    <!--bottom-->
    <div id="bottom">
   		<p>独墅湖高教区水果商城</p>
        <p>联系电话：18036095723</p>
        <p>Copyright 2013-2014 水果帮</p>
    </div>

</div>
<!--//wrap-->
</body> 
</html>
