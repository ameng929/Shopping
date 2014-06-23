<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.product.*"%>
<%@ page import="com.zx.shopping.category.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<%
List<Product> products = new ArrayList<Product>();
		products = ProductMgr.getInstance().getProducts();
		
 %>
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
	<!--top--></div><!--//right-->
    </div>
    <!--//menu-->
    <!--content-->
    <div id="content">
    <!---------------------------------board1--------------------------------->
   	  <div id="board">
      <!--content----lnb-->
      	<div id="lnb">
                <div id="clothing">特惠专区</div>
        <a href="More.jsp"><img src="images/more2.jpg" alt="更多" class="img2" /></a>        </div>
      <!--//content----lnb-->
      <!--content----gallery-->	
      <table width="100%">
     <tr>
      
      <% 
        for (int i = 0; i < 6; i++) {
			Product p = products.get(i);
		
			
      %>
   <td>
      <div id="class1">
      
        
             <div id="pit1"><a href="single.jsp?id=<%= p.getId() %>"><img src="upload/<%= p.getId() %>.jpg" alt="图片" width="110" height="110"/></a></div>
            <div id="introduction"><span><a href="single.jsp?id=<%= p.getId() %>">海南阿克苏<%=p.getName() %></>原箱装毛重约15斤 新鲜到货 </a></span></div>
            <div id="price">
            	<a href="#">￥<%= p.getMemberPrice() %></a> 
                <span><a href="#">￥<%=p.getNormalPrice() %></a></span>
            </div>
        
        <%
        }
         %>
        
      <!--//content----gallery-->
      </div>
      </td>
      </tr>
      </table>
    <!---------------------------------//board1--------------------------------->
    <!---------------------------------board2--------------------------------->
       <div id="board">
      <!--content----lnb-->
      	<div id="lnb">
                <div id="clothing">进口水果</div>
        <a href="More.jsp"><img src="images/more2.jpg" alt="更多" class="img2" /></a>        </div>
      <!--//content----lnb-->
      <!--content----gallery-->	
      <table width="100%">
     <tr>
      
      <% 
        for (int i = 0; i < 6; i++) {
			Product p = products.get(i);
		
			
      %>
   <td>
      <div id="class1">
      
        
             <div id="pit1"><a href="single.jsp?id=<%= p.getId() %>"><img src="upload/<%= p.getId() %>.jpg" alt="图片" width="110" height="110"/></a></div>
            <div id="introduction"><span><a href="single.jsp?id=<%= p.getId() %>">海南阿克苏<%=p.getName() %></>原箱装毛重约15斤 新鲜到货 </a></span></div>
            <div id="price">
            	<a href="#">￥<%= p.getMemberPrice() %></a> 
                <span><a href="#">￥<%=p.getNormalPrice() %></a></span>
            </div>
        <%
        }
         %>
        
      <!--//content----gallery-->
      </div>
      </td>
      </tr>
      </table>
    <!---------------------------------//board2--------------------------------->
    <!---------------------------------board3--------------------------------->
       <div id="board">
      <!--content----lnb-->
      	<div id="lnb">
                <div id="clothing">国产水果</div>
        <a href="More.jsp"><img src="images/more2.jpg" alt="更多" class="img2" /></a>        </div>
      <!--//content----lnb-->
      <!--content----gallery-->	
      <table width="100%">
     <tr>
      
      <% 
        for (int i = 0; i < 6; i++) {
			Product p = products.get(i);
		
			
      %>
   <td>
      <div id="class1">
      
        
             <div id="pit1"><a href="single.jsp?id=<%= p.getId() %>"><img src="upload/<%= p.getId() %>.jpg" alt="图片" width="110" height="110"/></a></div>
            <div id="introduction"><span><a href="single.jsp?id=<%= p.getId() %>">海南阿克苏<%=p.getName() %></>原箱装毛重约15斤 新鲜到货 </a></span></div>
            <div id="price">
            	<a href="#">￥<%= p.getMemberPrice() %></a> 
                <span><a href="#">￥<%=p.getNormalPrice() %></a></span>
            </div>
        
        <%
        }
         %>
        
      <!--//content----gallery-->
      </div>
      </td>
      </tr>
      </table>
    <!---------------------------------//board3--------------------------------->
    <!---------------------------------board4--------------------------------->
       <div id="board">
      <!--content----lnb-->
      	<div id="lnb">
                <div id="clothing">水果礼盒</div>
        <a href="More.jsp"><img src="images/more2.jpg" alt="更多" class="img2" /></a>        </div>
      <!--//content----lnb-->
      <!--content----gallery-->	
      <table width="100%">
     <tr>
      
      <% 
        for (int i = 0; i <6; i++) {
			Product p = products.get(i);
		
			
      %>
   <td>
      <div id="class1">
      
        
            <div id="pit1"><a href="single.jsp?id=<%= p.getId() %>"><img src="upload/<%= p.getId() %>.jpg" alt="图片" width="110" height="110"/></a></div>
            <div id="introduction"><span><a href="single.jsp?id=<%= p.getId() %>">海南阿克苏<%=p.getName() %></>原箱装毛重约15斤 新鲜到货 </a></span></div>
            <div id="price">
            	<a href="#">￥<%= p.getMemberPrice() %></a> 
                <span><a href="#">￥<%=p.getNormalPrice() %></a></span>
            </div>
        
        <%
        }
         %>
        
      <!--//content----gallery-->
      </div>
      </td>
      </tr>
      </table>
    <!---------------------------------//board4---------------------------------></div>
    <!--//content-->
    <!--bottom-->
    <div id="bottom">
   		<p>苏州独墅湖水果商城</p>
        <p>联系电话：18036095723</p>
        <p>Copyright 2013-2014 Vanvl.com All Rights京ICP证100557号</p>
    </div>
    <!--//bottom-->
</div>
<!--//wrap-->
</body>
</html>
