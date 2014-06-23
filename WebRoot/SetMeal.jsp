<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.product.*"%>
<%@ page import="com.zx.shopping.category.*"%>
<%@ page import="java.sql.*,  java.util.*,com.zx.kuangjia.service.*" %>
<%@ page import="com.zx.kuangjia.po.Sjzdfl"%>
<%@ page import="com.zx.kuangjia.po.Sjzdxx"%>
<%@ page import="com.zx.shopping.client.*"%>
<%
Cart cart = (Cart)session.getAttribute("cart");
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
  
  
allSjzdfl=(List<Sjzdfl>)request.getAttribute("allSjzdfl");
	//for(Iterator<Sjzdxx> its1=allSjzdxx1.iterator();its1.hasNext();){
	//		System.out.println(its1.next().getSjzzxxmc());
	//	}
  
//String statu;
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="css/myorder.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#button .btn1{width:133px; height:32px; background:url(images/bg_btn1.jpg) no-repeat; font-weight:bold; font-size:16px; color:#FFFFFF;}
#button1{width:133px; height:32px;  font-weight:bold; font-size:25px;}

</style>
</head>
<body>
<!--wrap-->
<div id="wrap">
	
    <!--content-->
    <div id="content">
    	<div id="button1">套餐推荐</div>
    	<br/>
        <!--content----header-->
        <div id="header">
        	<div class="head1">商品名称</div>
            <div class="head2">会员价（元）</div>
            <div class="head2">普通价（元）</div>
            <div class="head2">商品描述</div>
            <div class="head2">操作</div>
    
        </div>
        <!--//content----header-->
        <!--content----order1-->
        
        <% //显示所有的套餐
        int i=0;
		for(Iterator<Sjzdfl> it = allSjzdfl.iterator(); it.hasNext(); ) {
		//Iterator<Sjzdfl> it = allSjzdfl.iterator(); 
		//for(int k=0;k<5;k++){
			//sf = (Sjzdfl)allSjzdfl.get(0);
			sf = it.next();
		    i++;
		%>
		<%
        //}
        %>
        <div id="order1">
        	<div id="ttl">套餐名称：<%=sf.getSjzdflmc()%> </div>
        	
        <%//得到套餐里面的每一项
        
       
       
        allSjzdxx =(List<Sjzdxx>)request.getAttribute("allSjzdxx"+sf.getSjzdflId());
		//request.setAttribute("allSjzdxx", allSjzdxx);
        for(its = allSjzdxx.iterator(); its.hasNext(); ) {
			si = its.next();
			s=si.getSjzzxxmc().split("-");
			System.out.println(s[1]);
			setmealId=Integer.parseInt(s[0]);
            d=p.loadById(setmealId);
            
           if(si.getQiyong().equalsIgnoreCase("yes")){
		%>
            <div id="prod1">
                <div class="name"><img src="upload/<%=d.getId() %>.jpg" alt="pan" width="72" height="58"/><%=d.getName() %></div>
                <div class="price">￥<%=d.getMemberPrice() %></div>
                <div class="amount">￥<%=d.getNormalPrice() %></div>
                <div class="name"><%=d.getDescr()%></div>
             
              
            </div>
             <%
                    
             }
      
        }
        
     
        %>
        
        </div>
        <form id="button" name="panzi" action="setMealOrder.action" method="post">
        <input type="hidden" name="id" value="<%=i%>">
        <div id="btn1" align="right">
        <br/>
         <input type="submit" class="btn1" value="购买该套餐" />
         <br/>
         <br/>
         <br/>
        </div>
        
        </form>
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
