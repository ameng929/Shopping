<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.client.*, com.zx.shopping.user.*,com.zx.shopping.product.*" %>





<%

Cart c = (Cart)session.getAttribute("cart");
if(c == null) {
	c = new Cart();
	session.setAttribute("cart", c);
}

%>
<%
User u = (User)session.getAttribute("user");
//String addr=u.getAddr();
if(u == null) {
	//response.sendRedirect("Loginin.jsp");
	u=new User();
	String na="匿名用户";
	u.setUsername(na);
	u.setRdate(new Date());
	//u.save();
	session.setAttribute("user",u);
	}
	//需要找到相对应的用户id
	//List<User> ar=new ArrayList<User>();
	//ar=u.getUsers1("匿名用户");
	//if(ar.size()>0){
	//Iterator<User> it = ar.iterator(); 
  //  u=it.next();
	//session.setAttribute("user",u);
//	System.out.println("匿名用户id为"+u.getId());
	
	//return;
//}

%>




<%
request.setCharacterEncoding("GBK");
String action = request.getParameter("action");
if(action != null && action.trim().equals("add")) {
	int id = Integer.parseInt(request.getParameter("id"));
	Product p = ProductMgr.getInstance().loadById(id);
	CartItem ci = new CartItem();
	ci.setProduct(p);
	ci.setCount(1);
	c.add(ci);
}

if(action != null && action.trim().equals("delete")) {
	int id = Integer.parseInt(request.getParameter("id"));
	c.deleteItemById(id);
}

if(action != null && action.trim().equals("update")) {
	for(int i=0; i<c.getItems().size(); i++) {
		CartItem ci = c.getItems().get(i);
		//String pp1=request.getParameter("pp"+ci.getProduct().getId());
		//int pp=Integer.parseInt(pp1);
		///if(pp==ci.getProduct().getId()){
		int count = Integer.parseInt(request.getParameter("p" + ci.getProduct().getId()));
		ci.setCount(count);//}
	}
}
 %> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
List<CartItem> items = c.getItems();
String pname;
int count;
double price;
double total;
int pid;
double f=0;
%>



	
	
<%
//可以为后面匿名用户做功能扩展
	//Iterator<CartItem> it = items.iterator();
	//	CartItem ci = it.next();
	//	ci.getProduct().getId();
	//	ci.getProduct().getName();	
		//ci.getProduct().getNormalPrice();
//	double f=ci.getProduct().getNormalPrice()*ci.getCount();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="css/mycab.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--wrap-->
<div id="wrap">
	<!--top-->
	<div id="header">
    	<h1><img src="images/h1.jpg" alt="Gopile" /></h1>
    	<%if(u.getId()==0){ %><div id="welcome">您好，欢迎来到网上水果商城![<a href="Register.jsp">免费注册</a>]</div>
      <%} else{%>
        <div id="welcome">您好，欢迎[<a href="UserAccount.jsp"><%=u.getUsername() %></a>]来到商城！</div>
        <%} %>
        <div id="phoneno">18036095723</div>
        <div id="search">
        	<input type="text" class="t" />
            <input type="button" value="搜索" class="b" />
            <div id="circle"></div>
        </div>
        <div id="cab"><a href="#this"><img src="images/cab0.png" alt="购物车" /></a></div>
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
    	<div id="header">
        	<div class="head1">商品名称</div>
            <div class="head2">价格</div>
            <div class="head2">数量</div>
            <div class="head2">操作</div>
        </div>
        <!--content----prod1-->
        <%
	for(Iterator<CartItem> it = items.iterator(); it.hasNext(); ) {
		
		CartItem ci = it.next();
		
			 pid =ci.getProduct().getId(); 
			 pname=ci.getProduct().getName();
			 count=ci.getCount();
			 price=ci.getProduct().getMemberPrice();
			 total=ci.getProduct().getMemberPrice()*ci.getCount();
			 f=total+f;
		
			
		
	
	%>
        <div id="prod1">
        	<div class="name">
            	<a href="#"><img  src="upload/<%=pid %>.jpg" alt="图片" width="72" height="58"/>特产<%=pname %></a>
            </div>
            <div class="price"><%=price%></div>
            <div class="price">
            	<div class="center">
                <form name="<%="ud"+pid %>" action="maycab.jsp" method="get">
                    <input type="hidden" name="action" value="update"/>
                    <input type="hidden" name="<%="pp"+pid %>" value=""<%=pid %>/>
                	<%=count%>&nbsp;斤
                    
                </form>	
              <div class="pd">
                    	<br />&nbsp;
                        
                    </div>
                </div>
            </div>
            <div class="action"><a href="maycab.jsp?action=delete&id=<%=pid %>">删除</a></div>
        </div>
     <%      total=ci.getProduct().getMemberPrice()*ci.getCount();
			 f=total+f;
	
	%>
        
      <%}
	 %>
        <!--//content----prod2-->
        
        <div id="amount">
            <input type="hidden" name="action" value="update"/>
    		<p>总计（不含运费）：<span><%=c.getTotalMemberPrice()%>元</span><input type="button" value="继续购买" class="btn" onclick="javascript:location='Index.jsp';"/></p>
         <input type="button" value="结算" class="btn" onclick="javascript:location='verify_order.jsp';" />
          
        </div>
    </div>
     
    <!--//content-->
    <!--ads--><!--//ads-->
    <!--bottom-->
    <div id="bottom">
   		<p>苏州独墅湖水果商城</p>
        <p>联系电话：0000-00000000</p>
        <p>Copyright 2010-2013 Vanvl.com All Rights京ICP证100557号</p>
    </div>
    <!--//bottom-->
</div>
<!--//wrap-->
</body> 
</html>
