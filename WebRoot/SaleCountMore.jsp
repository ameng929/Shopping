<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.product.*"%>
<%@ page import="com.zx.shopping.category.*"%>
<%@ page import="com.zx.shopping.stat.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
String action = request.getParameter("action");
int status=2;
if(action != null && action.equals("modify") ) {
	status = Integer.parseInt(request.getParameter("status"));
	
}
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>更多</title>
<link href="css/category.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--wrap-->
<div id="wrap">
	<!--top-->
	<div id="header">
    	<h1><img src="images/h1.jpg" alt="Gopile" /></h1>
        <div id="welcome">您好，欢迎来到水果帮商城！[登录][免费注册]</div>
        <div id="phoneno">18036095723</div>
         <form name="simple" action="LikeSearch.jsp" method="get">
        <div id="search">
        
        	<input type="text" size="10" name="keyword" class="t"/>
            <input type="submit" value="搜索" class="b" />
            
            <div id="circle"></div>
        </div>
        </form>
        <div id="cab"><a href="#this"><img src="images/cab0.png" alt="购物车" /></a></div>
    </div>
	<!--//top-->
    <!--gnb-->
    <div id="gnb">
    	<div class="ttl">商品分类</div>
        <ul>
        	<li class="li1"><a href="Index.jsp"><span>首页</span></a></li>
            <li><a href="#">特惠专区</a></li>
            <li><a href="#">进口水果</a></li>
            <li><a href="#">国产水果</a></li>
            <li><a href="#">水果礼品</a></li>
            <li><a href="#">水果套餐</a></li>
            <li><a href="#">在线帮助</a></li>
        </ul>
    </div>
    <!--//gnb-->
    <!--catlist-->
    <div id="catlist"> 
    	<div id="size"><span>全部分类：共 11条</span></div>
    
        <div id="size">
        	<ul>
            	<li><span>包装：</span></li>
            	<li><span><a href="#">全部</a></span></li>
                <li><a href="#">礼盒</a></li>
                <li><a href="#">称重</a></li>
                <li><a href="#">特价</a></li>
            </ul>
        </div>
        <div id="size">
        	<ul>
            	<li><span>进口/国产：</span></li>
            	<li><span><a href="#">全部</a></span></li>
                <li><a href="#">国产</a></li>
                <li><a href="#">进口</a></li>
            </ul>
        </div>
        <div id="size">
        	<ul>
            	<li><span>价格：</span></li>
            	<li><span><a href="#">全部</a></span></li>
                <li><a href="#">0-30元</a></li>
                <li><a href="#">30-60元</a></li>
                <li><a href="#">60-120元</a></li>
                <li><a href="#">120-200元</a></li>
                <li><a href="#">200元以上</a></li>
            </ul>
        </div>
        
    </div>
    <!--//catlist-->
    <!--path-->
    <div id="path">
    
    	您已选择：
        <select name="status" onchange="window.location.href='More.jsp?status='+this.value;" class="s1">
        	<option value="2" ><span>按人气排序</span></option>	
        	<option value="0" selected="selected">按销量排序</option>
        </select>
        <br>
        </form>
    </div>
    <!--//path-->
    <!--product_gallery-->
    <div id="prodgal">
    <%
    Product pro =new Product();
    ProductMySQLDAO pr =new ProductMySQLDAO();
    if (status==2){
	
        
        	List<ProductStatItem> items = StatService.getProductsBySaleCount();
			for (int i = 0; i < items.size(); i++) {
			ProductStatItem p = items.get(i);
			pro=pr.loadById(p.getProductId());
			
			
		
        
		
 
     %>
      
      <%
       	if((i+1)%5!=0){
      %>
    	<dl>
        	<dt><a href="single.jsp?id=<%=p.getProductId()%>"><img src="upload/<%=p.getProductId()%>.jpg" alt="水果" width="189" height="199"/></a></dt>
            <dd><a href="single.jsp?id=<%=p.getProductId()%>" ><%=p.getProductName()%></a></dd>
            <dd><span><a href="single.jsp?id=<%=p.getProductId()%>">会员价：￥<%=pro.getMemberPrice() %></a></span></dd>
            <p align="center">普通价：￥<%=pro.getNormalPrice() %></p> 
        </dl>
        <%
        }
        else{
         %>
       
       <dl class="dl5">
       		<dt><a href="single.jsp?id=<%=p.getProductId()%>"><img src="upload/<%=p.getProductId()%>.jpg" alt="水果" width="189" height="199"/></a></dt>
            <dd><a href="single.jsp?id=<%=p.getProductId()%>"><%=pro.getName()%></a></dd>
            <dd><span><a href="single.jsp?id=<%=p.getProductId()%>">会员价：￥<%=pro.getMemberPrice()%></a></span></dd>
                                                                   <p align="center">普通价：￥<%=pro.getNormalPrice()%></p> 
        </dl>
          
       <%} %>
     
       <% }%>
       <%
       }
        %>
       
     </div> 
      
    <!--//product_gallery-->
    <!--bottom-->
    <div id="bottom">
   		<p>四海兴唐股份有限公司</p>
        <p>联系电话：0000-00000000</p>
        <p>Copyright 2010-2013 Vanvl.com All Rights京ICP证100557号</p>
    </div>
    <!--//bottom-->
</div>
<!--//wrap-->
</body> 
</html>
