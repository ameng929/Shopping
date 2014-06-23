<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.user.*" %>
<%@ page import="com.zx.shopping.collect.*" %>
<%@ page import="com.zx.shopping.client.*" %>
<%@ page import="com.zx.shopping.product.*" %>
<%@page import="com.zx.shopping.comment.Comment"%>
<%@page import="com.zx.shopping.comment.CommentMySQLDAO"%>
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
    	<div id="ttl">商家推荐的商品</div>
        <!--content----header-->
        <div id="header">
        	<div class="head1">商品名称</div>
            <div class="head2">会员价（元）</div>
            <div class="head2">普通价格（元）</div>
            <div class="head2">商品描述</div>
            
        </div>
        <!--//content----header-->
        <!--content----order1-->
      <%
                   List<Product> products=new ArrayList<Product>();
                   products=ProductMgr.getInstance().getRecommendProducts();                
                 %>
                  <% 
       			 for (int i = 0; i < products.size(); i++) {
				 Product p1 = products.get(i);
		
			
      			%>
        <div id="order1">
            <div id="prod1">
                <div class="name"><a href="single.jsp?id=<%=p1.getId() %>" target="yy"><img src="upload/<%=p1.getId() %>.jpg" alt="pan" width="72" height="58"/><%=p1.getName() %></a></div>
                <div class="price">￥<%=p1.getMemberPrice() %></div>
                <div class="amount">￥<%=p1.getNormalPrice() %></div>
                <div class="name"><%=p1.getDescr() %></div>
              
              
            </div>
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
