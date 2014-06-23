
<%@ page language="java" contentType="text/html; charset=GBK" import="java.util.*"
	pageEncoding="GBK"%>
	
<%@ page import="com.zx.shopping.user.*" %>
<%@ page import="com.zx.shopping.product.*"%>
<%@ page import="com.zx.shopping.category.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.zx.kuangjia.po.Sjzdfl"%>
<%@ page import="com.zx.kuangjia.po.Sjzdxx"%>
<%@ page import="com.zx.shopping.client.*"%>
<%
Cart cart = (Cart)session.getAttribute("cart");
Cart cart1=new Cart();
if(cart == null) {
	cart = new Cart();
}
ProductMySQLDAO p1=new ProductMySQLDAO();
%>



<%

//SjzdflService sjzdflService =new SjzdflServiceImpl();
//SjzdxxService sjzdxxService = new SjzdxxServiceImpl();



ProductMySQLDAO p=new ProductMySQLDAO();
String[] s;
Sjzdfl sf;
Sjzdxx si;
int setmealId=0;
 Product d;
 Iterator<Sjzdxx> its;
 Sjzdfl sjzdflk;
 List<Sjzdxx> allSjzdxx ;
  List<Sjzdfl> allSjzdfl;
  
  
allSjzdxx=(List<Sjzdxx>)request.getAttribute("allSjzdxx2");
	//for(Iterator<Sjzdxx> its1=allSjzdxx1.iterator();its1.hasNext();){
	//		System.out.println(its1.next().getSjzzxxmc());
	//	}
  
//String statu;
%>




<%
request.setCharacterEncoding("GBK");
response.setCharacterEncoding("GBK");
User u = (User)session.getAttribute("user");
//System.out.println("zhong"+u.getId());
//String addr=u.getAddr();
//if(u == null) {
//	response.sendRedirect("UserLogin.jsp");
//	return;
//}
if(u == null) {
	//response.sendRedirect("Loginin.jsp");
	u=new User();
	String na="匿名用户";
	u.setUsername(na);
	u.setRdate(new Date());
	//u.save();
	session.setAttribute("user",u);
	}
Cart c = (Cart)session.getAttribute("cart");
if(c == null) {
	c = new Cart();
	session.setAttribute("cart", c);
}
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

String action = request.getParameter("action");
if(action != null && action.trim().equals("update")) {
System.out.println(request.getParameter("name1"));
	u.setUsername(request.getParameter("name1"));
	u.setAddr(request.getParameter("addr"));
	u.setPhone(request.getParameter("phone"));
	u.setEmail(request.getParameter("email"));
	u.setRdate(new Date());
	session.setAttribute("user",u);
	System.out.println(u.getId());
	//u.update();
	}
	

 %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>index</title>
<link href="css/verify_order.css" rel="stylesheet" type="text/css" />
<link href="css/myorder.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>

<style type="text/css">
<!--
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
-->
</style></head>
<body>
<br><br><!--wrap-->
<div id="wrap">
	<!--top-->
	<div id="header">
    	<h1><img src="images/h1.jpg" alt="Gopile" width="105" height="57" /></h1>
     <div id="welcome">
      <%if(u.getId()==0){ %> <p>您好，欢迎来到水果帮商城！[<a href="Register.jsp">免费注册</a>]</p> 
      <%} else{%> 
        <p>您好，[<a href="UserAccount.jsp"><%=u.getUsername() %></a>]欢迎来到水果帮商城！</p>
       <%} %>
      </div>
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
    <form action="verify_order.jsp" method="post" accept-charset="GBK" onsubmit="document.charset = 'GBK';"  >
     <input type="hidden" name="action" value="update"/>
                	
                    
                
    <div id="content">
   	  <p>请确认以下信息，然后提交订单</p>
        <!--content----board1-->
        <div id="board1">
        <%if(u.getId()==0){%>
        <p><span>收货人信息</span></p>
            <div id="size">
            	
        <input type="hidden" name="name1" class="text1" value="<%=u.getUsername() %>" /></div>
        <% }else{%>
        	<p><span>收货人信息</span></p>
            <div id="size">
            	<P>收货人：</P>
                <input type="text" name="name1" class="text1" value="<%=u.getUsername() %>" />
            </div>
            <%} %>
            <div id="size">
            	<p>区域：</p>
                <select name="country" class="select1">
                	<option selected="selected">苏州</option>
                    </select>
                <select name="province" class="select1">
                	<option selected="selected">请选择</option>
                </select>
            </div>
            <div id="size">
            	<p>收货地址：</p>
                <input type="text" name="addr" class="text2"  value="<%=u.getAddr() %>"/>
            </div>
            <div id="size">
            	<p>邮编：</p>
                <input type="text"  class="text1"  value="215123"/>
            </div>
            <div id="size">
            	<p>手机：</p>
                <input type="text"  name="phone" class="text1"  value="<%=u.getPhone() %>"/> 
            	<span>或者</span>eamil：
              	<input type="text"  class="text1"  name="email" value="<%=u.getEmail() %>"/>
            </div>
            <div id="btn1">
            	<input type="submit" class="btn" value="确认收货人信息" />
            </div>
        </div>
       </form>	
      
      <!--//content----board1-->
        <!--content----board2-->
        <div id="content">
       	  	<p>商品清单</p>
            <!--content----board2----package1-->
          	<div id="package">
            	<p>包裹一：预计1月13日送达 <span><a href="#">详细信息><img src="images/pd5.jpg" alt="pd" /></a>></span></p>
                <div id="header">
                	<div class="head1">商品名称</div>
                	<div class="head2"> 普通价格</div>
                    <div class="head2">&nbsp; &nbsp; &nbsp; &nbsp;会员价格</div>
                    <div class="head2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;数量</div>
                    <div class="head2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;  小计</div>
              
                </div>
        </div> 
        
<% 
               
     for(its = allSjzdxx.iterator(); its.hasNext(); ) {
			si = its.next();
			s=si.getSjzzxxmc().split("-");
			System.out.println(s[1]);
			setmealId=Integer.parseInt(s[0]);
            d=p.loadById(setmealId);
            
           if(si.getQiyong().equalsIgnoreCase("yes")){
	          CartItem item = new CartItem();
	          item.setCount(1);
	          item.setProduct(d);
	          cart1.add(item);
	          
	          
	          
	
%>	
	 <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
 
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" onmouseover="changeto()"  onmouseout="changeback()">
      <tr>
        <td  width="20%" height="20" bgcolor="#E8E8E8" class="STYLE6"><div align="center"><span class="STYLE10"><img src="upload/<%=d.getId() %>.jpg" alt="图片" width="51" height="52" /> <h4><font color="red">特产新鲜<%=d.getName()%></font></h4></span></div></td>
        <td width="12%" height="20" bgcolor="#E8E8E8" class="STYLE6"><div align="center"><span class="STYLE10"><%=d.getNormalPrice()%></span></div></td>
        <td width="12%" height="20" bgcolor="#E8E8E8" class="STYLE6"><div align="center"><span class="STYLE10"><%=d.getMemberPrice()%></span></div></td>
        <td width="10%" height="20" bgcolor="#E8E8E8" class="STYLE6"><div align="center"><span class="STYLE10">1</span></div></td>
        <td width="15%" height="20" bgcolor="#E8E8E8" class="STYLE6"><div align="center"><span class="STYLE10"><%=total=d.getMemberPrice()%></span></div></td>
        </tr>
      	
      
				
    </table></td>
  </tr>
  
</table>
                
            
              
                    <%} }
                    
                    session.setAttribute("cart",cart1);
                    
                    %>
              
     
            
           
         
            <!--//content----board2----package1-->
        </div>
       <br></br>
       <div></div>
         <div align="right"><span style="border-bottom-color: red"><h1><br/><font color="red">需支付总金额: &nbsp;</font></h1></span></div>
         <div align="right"><span style="border-bottom-color: red"><h1><%=cart1.getTotalMemberPrice()%>元  &nbsp;&nbsp;&nbsp;    </h1></span></div>
        
        <!--//content----board2-->
        <br/><br/>
        <div id="btn2">
        <form action="subm_order.jsp" method="post">
        	<input type="submit" class="btn" align="right" value="确认提交信息" />
        	</form>
        </div>
    </div>
   
     
      
   
    <!--//content-->
    
    <!--bottom-->
    <div>  &nbsp; &nbsp; &nbsp; &nbsp;
    <p>&nbsp; &nbsp; &nbsp; &nbsp;</p>
     <p>&nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p>&nbsp; &nbsp; &nbsp; &nbsp;</p>
       <p>&nbsp; &nbsp; &nbsp; &nbsp;</p> 
       <p>&nbsp; &nbsp; &nbsp; &nbsp;</p>
    </div>
      <div align="center" id="bottom">
    
   		<p>苏州独墅湖水果商城</p>
        <p>联系电话：18036095723</p>
        <p>Copyright 2013-2014 水果帮</p>
      </div>
     <div> 
    <p>&nbsp; &nbsp; &nbsp; &nbsp;</p>
    <p>&nbsp; &nbsp; &nbsp; &nbsp;</p>   
    <p>&nbsp; &nbsp; &nbsp; &nbsp;</p>
     </div>

</div>
<!--//wrap-->
</body> 
</html>
