<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.user.*" %>
<%@ page import="com.zx.shopping.client.*" %>
<%@ page import="com.zx.shopping.product.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
ProductMySQLDAO p=new ProductMySQLDAO();
Product d=p.loadById(19);
Cart cart=new Cart();
CartItem c =new CartItem();
c.setProduct(d);
cart.add(c);
session.setAttribute("cart",cart);%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="css/single.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}
.STYLE1 {
	color: #0033FF;
	font-weight: bold;
}
.STYLE2 {color: #000000}
.STYLE4 {color: #FF0000}
-->
</style></head>
<body>
<!--wrap-->
<div id="wrap">
	<!--top-->
	<div id="header">
    	<h1><img src="images/h1.jpg" alt="Gopile" /></h1>
        <div id="welcome">
          <p>您好，欢迎来到水果帮商城！</p>
          <p>[<a href="Longinin.jsp">登录</a>][<a href="Register.jsp">免费注册</a>]</p>
      </div>
        <div id="phoneno">400-600-4008</div>
        <div id="search">
        	<input type="text" class="t" />
            <input type="button" value="搜索" class="b" />
            <div id="circle"></div>
        </div>
        <div id="cab"><a href="#this"><img src="images/cab0.png" alt="购物车" /></a></div>
    </div>
	<!--//top-->
    <!--gnb-->
    <div id="gnb">
    	<div class="ttl">所有分类</div>
        <ul>
        	<li class="li1">首页</li>
            <li>特惠专区</li>
            <li>进口水果</li>
            <li>国产水果</li>
            <li>水果礼品</li>
            <li>水果套餐</li>
          <li><a href="#">在线帮助</a></li>
        </ul>
    </div>
    <!--//gnb-->
    <!--content-->
    <div id="content">
        <!--content----left-->
        <div id="left">
        	<!--content----left----board-->
        	<div id="board">
            	<div id="ttl">推荐商品</div>
                <!--content----left----board----thum-->
                <div id="thum">
                	<div id="prod1">
                		<div id="show"><a href="#"><img src="images/nanfeicheng1.jpg" alt="商品" width="54" height="54" /></a></div>
                      <div id="itd">
                        <p><a href="#">【南非】南非橙</a></p>
                        <span><a href="#">￥29.9</a></span><span class="STYLE4">0</span></div>
               	  </div>
                    <div id="prod1">
                		<div id="show"><a href="#"><img src="images/apple1.jpg" alt="商品" width="54" height="54" /></a></div>
                      <div id="itd">
                        <p><a href="#">【新疆】阿克苏苹果</a></p>
                        <span><a href="#">￥39.30</a></span></div>
                  	</div>
                    <div id="prod1">
                		<div id="show"><a href="#"><img src="images/qiyiguo1.jpg" alt="商品" width="54" height="54" /></a></div>
                      <div id="itd">
                        <p><a href="#">【海口】奇异果</a></p>
                      <span><a href="#">￥28.90</a></span></div>
                  	</div>
                    <div id="prod1">
                		<div id="show"><a href="#"><img src="images/huolongguo1.jpg" alt="商品" width="54" height="54" /></a></div>
                      <div id="itd">
                        <p><a href="#">【夏威夷】狂热火龙果</a></p>
                        <p><span><a href="#">￥58.00</a></span>
                          </p>                    
                        </p>
                        </div>
                  	</div>
<div id="prod1">
                		<div id="show"><a href="#"><img src="images/AmericaHongti.jpg" alt="商品" width="54" height="54" /></a></div>
            <div id="itd">
              <p><a href="#">【美国】美国红提</a></p>
              <span><a href="#">￥88.00</a></span></div>
                  	</div>
                   
                </div>
                <!--//content----left----board----thum-->
            </div>
        	<!--//content----left----board-->
        </div>
        <!--//content----left-->
        <!--content----right-->
        <div id="right">
        	<!--content----right----board1-->
            <div id="board1">
            	<div id="ttl1"><span class="STYLE1"><span class="STYLE2">【</span>海口<span class="STYLE2">】</span></span>  特产新鲜香蕉</div>
                <div id="pit"><a href="#"><img src="images/banana1.jpg" alt="商品" width="318" height="318" /></a></div>
<div id="brief_itd1">
                	<div id="size">价格：<span>220.00</span></div>
                    <div id="size">
                    	到
                    	  <select name="select" id="select" >
                    	    <option>吴中区</option>
                    	    <option>姑苏区</option>
                    	    <option>独墅湖高教区</option>
                    	    <option>园区</option>
                    	    <option>虎丘区</option>
                    	    <option>昆山市</option>
                          </select>
                    	  快递：<span>8</span>元
                    	  <form id="form1" name="form1" method="post" action="">
                    	    <label></label>
                  	    已售出：<span>0</span>件
                    	  </form>
       	  </div><div>&nbsp;&nbsp;</div></br>
          <div id="size">评价：<img src="images/star.jpg" alt="star" /><span> 5.0</span>分（已有0人评论）</div>
                    <div id="size">支付方式：<span>全额付款</span></div>
                    <div id="size">礼盒包装：</div>
                    <div id="size">
                   		<div class="text">
                   		  <input type="text" value="包装" class="txt" />
                   		</div>
                  <div class="text">
                          	<input type="text" value="散装" class="txt" />
                        </div>
                    </div>
                    <div id="size">数量：</div>
                    <div id="size">
                   		<div class="text1">
                   			<input type="text" value="1" class="txt1" />
                      	</div>
                        件 （库存200件）
                    </div>
                    <div id="button">
                    <form name="panzi" action="Buy.jsp" method="get">
                    	<div id="btn1">
                    	  <input type="submit" class="btn1" value="立即购买" />
                    	</div>
                    	</form>
                        <div id="btn1">
                    	  <input type="button" class="btn2" value="加入购物车" />
                    	</div>

                    </div>
	
                </div>
            </div>
        	<!--//content----right----board1-->
            <!--content----right----board2-->
            <div id="board2">
            	<div id="ttl2">
                	<div class="t2">商品详情</div>
                </div>
                <div id="brief_itd2">
                	<div class="itd1">
                    	<p>产品名称：海口特产新鲜香蕉</p>
                      <p> 产地：海南海口</p>
                        <p>产品类型：香蕉类</p>
                        <p>产品大小：3斤起</p>
                      <p>产品信誉：绝对保新鲜</p>
                        <p>同城服务:同城买家送货上门</p>
                    </div>
                    <div class="itd2">
                        <p>产品功效：养颜美容</p>
                  </div>
                </div>
            </div>
            <!--//content----right----board2-->
            <!--content----right----board3-->
         	<div id="board3">
           	<div id="ttl2">
           	  <div class="t2">评价详情</div>
                </div>
                <div class="b1">
                	<dl>
                    	<dt><a href="#"><img src="images/admin.jpg" alt="admin" /></a></dt>
                        <dd><a href="#">无昵称用户</a></dd>
                    </dl>
                    <div id="assess">
                    	<span>发表于2012-12-14 13:14:15</span>
                        <p>和同学买了两个，很好吃，我们很喜欢。一贯好评。。。</p>
                  </div>
                </div>
                <div class="b1">
                	<dl>
                    	<dt><a href="#"><img src="images/admin.jpg" alt="admin" /></a></dt>
                        <dd><a href="#">无昵称用户</a></dd>
                    </dl>
                    <div id="assess">
                    	<span>发表于2012-12-14 13:14:15</span>
                        <p>和同学买了两个，很香很好吃，我们很喜欢。一贯好评。。。</p>
                    </div>
                </div>
                <div class="b1">
                	<dl>
                    	<dt><a href="#"><img src="images/admin.jpg" alt="admin" /></a></dt>
                        <dd><a href="#">无昵称用户</a></dd>
                    </dl>
                    <div id="assess">
                    	<span>发表于2012-12-14 13:14:15</span>
                        <p>很喜欢。一贯好评。。。</p>
                  </div>
                </div>
                <div id="page"><a href="#">首页</a> <a href="#">上一页</a> <a href="#">5 </a>/<a href="#"> 10</a> <a href="#">下一页</a> <a href="#">末页</a></div>
          </div>
            <!--//content----right----board3-->
        </div>
        <!--//content----right-->
    </div>
    <!--//content-->
    <!--ads-->
    <div id="ads"></div>
    <!--//ads-->
    <!--bottom-->
    <div id="bottom">
   		<p class="STYLE2">四海兴唐股份有限公司</p>
        <p class="STYLE2">联系电话：0000-00000000</p>
        <p class="STYLE2">Copyright 2010-2013 Vanvl.com All Rights京ICP证100557号</p>
  </div>
  <!--//bottom-->
</div>
<!--//wrap-->
</body> 
</html>
