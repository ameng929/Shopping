<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.product.*"%>
<%@ page import="com.zx.shopping.category.*"%>
<%@ page import="com.zx.shopping.stat.*"%>
<%@ page import="com.zx.shopping.user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<%
User u = (User)session.getAttribute("user");


%>
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
	font-weight: bold;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
}
div#welcome:hover {color:#FF0000;}
a#dl {color:#333333}
a#dl:hover, .STYLE4:hover{color:#FF0000; text-decoration:underline;} 
.STYLE1 {color: #FF0000}
.STYLE4 {color: #333333}
.STYLE7 {color: #FF0000; font-size: 12px; }
-->
</style></head>
<body>
<!--wrap-->
<div id="wrap">
	<!--top-->
	<div id="header">
    	<h1><a href="Index.jsp"> <img src="images/h1.jpg" alt="Gopile" width="120" height="57" /></h1>
      <%if(u.getId()==0){ %><div id="welcome">您好，欢迎来到网上水果商城!</div>
      <%} else{%>
      <div id="welcome"><a href="UserAccount.jsp">您好，欢迎[<%=u.getUsername() %>]来到网上水果商城!</a></div>
      <%} %>
      <div id="myacount"></div>
     
      <div id="cab" style="top: 25px; left: 863px;"><a href="maycab.jsp"><img src="images/cab0.png" alt="购物车" style="left: 27px; width: 101px; top: 8px; height: 18px;"/></a></div>
      <div id="phoneno">18036095723</div> 
      <form name="simple" action="LikeSearch.jsp" method="get">
        <div id="search">
        
        	<input type="text" size="10" name="keyword" class="t"/>
            <input type="submit" value="搜索" class="b" />
            
            <div id="circle"></div>
        </div>
        </form>
        <a href="AdminLogin1.jsp">后台登陆</a>
        <a href="Logout.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退出账号</a></div>
        </div>
        </div>
	<!--//top-->
    <!--menu-->
   	<div id="menu">
    	<!--gnb-->
    	<div id="gnb">
        	<div class="ttl">商品分类</div>
   	  <ul>
                <li class="li1"><a href="Index.jsp"><span>首页</span></a></li>
        		<li><a href="More.jsp">特惠专区</a></li>
                <li><a href="More.jsp">进口水果</a></li>
                <li><a href="More.jsp">国产水果</a></li>
                <li><a href="More.jsp">水果礼品</a></li>
                <li><a href="getSjzdflxx.action">套餐</a></li>
                <li><a href="#">在线帮助</a></li>
          </ul>
        </div>
        <!--//gnb-->
        <!--snb-->
		<div id="snb" >
        <p>&nbsp;&nbsp;</p>
		  <table width="174" border="0" cellpadding="0" cellspacing="0" class="index_cate_list">
              <tr>
                <td height="25" align="center" bgcolor="#F0F0F0" class="index_cate_tbg"><a href='More.jsp' class="STYLE7">
                    &nbsp;<span class="STYLE1">&nbsp;</span></a><a id="dl3" ><font size="4" ><span class="STYLE1">特惠专区 </span></font></a></td>
            </tr>
              <tr>
                <td height="4"> </td>
              </tr>
              <tr>
                <td align="center" valign="middle">
				<table id="SubCategory_Common_AllClass1___dlstMainCategories_ctl00_dlstSubCategries" cellspacing="0" border="0" style="border-collapse:collapse;">
			<tr>
				<td class="2">
				<table width="85" height="18" border="0" cellpadding="0" cellspacing="0" class="index_cate_small">
                  <tr>
                  <td height="18" align="center" valign="top"><a href='More.jsp'>
               <span class="STYLE4" id="SubCategory_Common_AllClass1___dlstMainCategories_ctl00_dlstSubCategries_ctl02_lbl_Private_Class_Name">限时抢购</span></a></td>
                  </tr>
                </table>
	            </td><td>
                            
                        </td><td class="2">
				<table width="85" height="21" border="0" cellpadding="0" cellspacing="0" class="index_cate_small">
                  <tr>
                    <td height="21" align="center" valign="top"><a href='More.jsp'>
               <span class="STYLE4" id="SubCategory_Common_AllClass1___dlstMainCategories_ctl00_dlstSubCategries_ctl02_lbl_Private_Class_Name">99元抢购</span></a></td>
                  </tr>
                </table>
				         </td><td></td>
			</tr>
		</table>
        
				</td>
              </tr>
            </table>
    </td>
	</tr><tr>
		<td>
        
    </td>
	</tr><tr>
		<td class="1" valign="top" style="width:95%;">
 
 
<table width="174" border="0" cellpadding="0" cellspacing="0" class="index_cate_list">
              <tr>
         <td height="25" align="center" bgcolor="#F0F0F0" class="index_cate_tbg"><a href='More.jsp' class="STYLE7">
                    &nbsp;<span class="STYLE1">&nbsp;</span></a><a id="dl3" ><font size="4" ><span class="STYLE1">进口水果 </span></font></a></td>
            </tr>
              <tr>
                <td height="7"> </td>
              </tr>
              <tr>
                <td align="left">
				
        
				</td>
              </tr>
            </table>
    </td>
	</tr><tr>
		<td>
        
    </td>
	</tr><tr>
		<td class="1" valign="top" style="width:95%;">
 
 
<table width="174" border="0" cellpadding="0" cellspacing="0" class="index_cate_list">
             <tr>
                <td height="21" align="center" valign="top"><a href="More.jsp">
               <span class="STYLE4" id="SubCategory_Common_AllClass1___dlstMainCategories_ctl00_dlstSubCategries_ctl02_lbl_Private_Class_Name">养颜水果</span></a></td>
                <td height="21" align="center" valign="top"><a href='More.jsp'>
               <span class="STYLE4" id="SubCategory_Common_AllClass1___dlstMainCategories_ctl00_dlstSubCategries_ctl02_lbl_Private_Class_Name">热带水果</span></a></td>
            </tr>
            </table>
    </td>
	</tr><tr>
		<td>
        
    </td>
	</tr><tr>
		<td class="1" valign="top" style="width:95%;">
 
 
<table width="174" border="0" cellpadding="0" cellspacing="0" class="index_cate_list">
              <tr>
                <td  height="21" width="16" align="left" valign="top" class="index_cate_tbg"><a href='More.jsp' class="STYLE4">
                    &nbsp;&nbsp;</a></td>
                <td width="73" align="left" valign="top" class="index_cate_tbg"><a href='More.jsp' class="STYLE4">小包装水果</a></td>
                <td width="85" height="21" align="center" valign="top"><a href='More.jsp'>
               <span class="STYLE4" id="SubCategory_Common_AllClass1___dlstMainCategories_ctl00_dlstSubCategries_ctl02_lbl_Private_Class_Name">水果礼盒</span></a></td>
            </tr>
            </table>
    </td>
	</tr><tr>
		<td>
        
    </td>
	</tr><tr>
		<td class="1" valign="top" style="width:95%;">
 
 
<table width="174" border="0" cellpadding="0" cellspacing="0" class="index_cate_list">
              <tr>
             <td height="21" align="center" valign="top"><a href='More.jsp'>
               <span class="STYLE4" id="SubCategory_Common_AllClass1___dlstMainCategories_ctl00_dlstSubCategries_ctl02_lbl_Private_Class_Name">水果拼装</span></a></td>
            </tr>
              <tr>
                <td height="21" align="center">
				<table id="SubCategory_Common_AllClass1___dlstMainCategories_ctl08_dlstSubCategries" cellspacing="0" border="0" style="border-collapse:collapse;">
			<tr>
				<td class="2">
				<table width="173" height="20" border="0" cellpadding="0" cellspacing="0" class="index_cate_small">
                  <tr>
                    <td width="173" align="center" valign="baseline"><a href='getSjzdflxx.action'>
              <span class="STYLE4" id="SubCategory_Common_AllClass1___dlstMainCategories_ctl08_dlstSubCategries_ctl00_lbl_Private_Class_Name">水果套餐</span></a></td>
                  </tr>
                </table>				         </td>
			</tr>
		</table>
        
				</td>
            </tr>
            </table>
    </td>
	</tr><tr>
		<td>
        
    </td>
	</tr><tr>
		<td class="1" valign="top" style="width:95%;">
 
 
<table width="174" border="0" cellpadding="0" cellspacing="0" class="index_cate_list">
              <tr>
                <td width="173" align="center" valign="baseline"><a href='More.jsp'>
              <span class="STYLE4" id="SubCategory_Common_AllClass1___dlstMainCategories_ctl08_dlstSubCategries_ctl00_lbl_Private_Class_Name">水果礼品</span></a></td>
              <td width="173" align="center" valign="middle"><a href='More.jsp'><span class="STYLE4" id="SubCategory_Common_AllClass1___dlstMainCategories_ctl08_dlstSubCategries_ctl00_lbl_Private_Class_Name">时鲜</span></a></td>
              
            </tr>
              <tr>
                <td height="5" colspan="2"> </td>
              </tr>
              <tr>
                <td colspan="2" align="left">
				<table id="SubCategory_Common_AllClass1___dlstMainCategories_ctl10_dlstSubCategries" cellspacing="0" border="0" style="border-collapse:collapse;">
			<tr>
				<td class="2">
				<table width="90" height="20" border="0" cellpadding="0" cellspacing="0" class="index_cate_small">
                  <tr>
                    <td width="10" align="center" valign="middle"><a href='More.jsp'><span class="STYLE4">&nbsp;</span></a></td>
                    <td width="80" align="center" valign="middle"><a href='More.jsp'><span class="STYLE4">礼篮</span></a></td>
                  </tr>
                </table>				         </td><td>
				  <table width="85" height="20" border="0" cellpadding="0" cellspacing="0" class="index_cate_small">
				    <tr>
				      <td align="center" valign="middle"><a href='More.jsp'>
				        <span class="STYLE4" id="SubCategory_Common_AllClass1___dlstMainCategories_ctl10_dlstSubCategries_ctl02_lbl_Private_Class_Name"> 礼盒</span></a></td>
                    </tr>
				      </table></td>
			</tr>
			
		</table>				</td>
              </tr>
            </table>
    </td>
	</tr><tr>
		<td>
        
    </td>
	</tr><tr>
		<td class="1" valign="top" style="width:95%;">
 
 
<table width="174" border="0" cellpadding="0" cellspacing="0" class="index_cate_list">
              <tr>
           <td height="25" align="center" bgcolor="#F0F0F0" class="index_cate_tbg"><a href='More.jsp' class="STYLE7">
                    &nbsp;<span class="STYLE1">&nbsp;</span></a><a id="dl3" href='More.jsp'><font size="4" ><span class="STYLE1">节日专区 </span></font></a></td>
            </tr>
              <tr>
                <td height="7" colspan="2"> </td>
              </tr>
              <tr>
                <td align="left">
				<table id="SubCategory_Common_AllClass1___dlstMainCategories_ctl12_dlstSubCategries" cellspacing="0" border="0" style="border-collapse:collapse;">
			<tr>
				<td class="2">
				<table width="175" height="20" border="0" cellpadding="0" cellspacing="0" class="index_cate_small">
                  <tr>
        <td width="175" height="21" align="center" valign="top"><a href='More.jsp'>
        <span class="STYLE4" id="SubCategory_Common_AllClass1___dlstMainCategories_ctl00_dlstSubCategries_ctl02_lbl_Private_Class_Name">中秋国庆专区</span></a></td>
                  </tr>
                </table>				         </td>
			</tr>
		</table>				</td>
                <td align="left">&nbsp;</td>
              </tr>
            </table>
    </td>
	</tr><tr>
		<td>
        
    </td>
	</tr><tr>
		<td class="1" valign="top" style="width:95%;">
 
 
<table width="174" border="0" cellpadding="0" cellspacing="0" class="index_cate_list">
              <tr>
                <td height="25" align="center" bgcolor="#F0F0F0" class="index_cate_tbg"><a href='More.jsp' class="STYLE7">
                    &nbsp;<span class="STYLE1">&nbsp;</span></a><a id="dl3" href='More.jsp'><font size="4" ><span class="STYLE1">果彩缤纷 </span></font></a></td>
            </tr>
              <tr>
                <td height="7"> </td>
              </tr>
              <tr>
                <td align="left">
				<table id="SubCategory_Common_AllClass1___dlstMainCategories_ctl14_dlstSubCategries" cellspacing="0" border="0" style="border-collapse:collapse;">
			<tr>
				<td class="2">
				<table width="85" height="20" border="0" cellpadding="0" cellspacing="0" class="index_cate_small">
                  <tr>
                    <td align="left" valign="middle"><a href='More.jsp'>
                                    <span id="SubCategory_Common_AllClass1___dlstMainCategories_ctl14_dlstSubCategries_ctl00_lbl_Private_Class_Name">&nbsp;<span class="STYLE4">&nbsp;</span></span></a><a href='More.jsp' class="STYLE4">国产水果 </a></td>
                  </tr>
                </table>
				         </td><td>
                            
                        </td><td class="2">
				<table width="85" height="20" border="0" cellpadding="0" cellspacing="0" class="index_cate_small">
                  <tr>
                    <td align="center" valign="middle"><a href='More.jsp'>
                                    <span class="STYLE4" id="SubCategory_Common_AllClass1___dlstMainCategories_ctl14_dlstSubCategries_ctl02_lbl_Private_Class_Name">新疆大枣</span></a></td>
                  </tr>
                </table>
				         </td><td></td>
			</tr>
		</table>
        
				</td>
              </tr>
            </table>
    </td>
	</tr>
</table>
		</div>
  <!--//snb-->
        <!--center-->
        <div id="center">
        	<div id="gallery">
           <style type="text/css"> 
.container, .container img{width:460px; height:300px;}
.container img{border:0;vertical-align:top;}
</style>
<script>
new SlideTrans("idContainer", "idSlider",1, { Vertical: false }).Run();
</script>
<br />
<style type="text/css">
.container ul, .container li{list-style:none;margin:0;padding:0;}

.num{ position:absolute; right:5px; bottom:5px; font:12px/1.5 tahoma, arial; height:18px;}
.num li{
	float: left;
	color: #d94b01;
	text-align: center;
	line-height: 16px;
	width: 16px;
	height: 16px;
	font-family: Arial;
	font-size: 11px;
	cursor: pointer;
	margin-left: 3px;
	border: 1px solid #f47500;
	background-color: #fcf2cf;
}
.num li.on{
	line-height: 18px;
	width: 18px;
	height: 18px;
	font-size: 14px;
	margin-top:-2px;
	background-color: #ff9415;
	font-weight: bold;
	color:#FFF;
}
</style>
<div class="container" id="idContainer2">
	<ul id="idSlider2">
		<li><a href="http://www.cnblogs.com/cloudgamer/archive/2009/12/22/ImagePreview.html"> <img src="images/boluo.jpg" alt="图片上传预览"  /> </a></li>
		<li><a href="http://www.cnblogs.com/cloudgamer/archive/2009/08/10/FixedMenu.html"> <img src="images/banana1.jpg" alt="多级联动菜单" /> </a></li>
		<li><a href="http://www.cnblogs.com/cloudgamer/archive/2009/07/07/FixedTips.html"> <img src="images/pinguo.jpg" alt="浮动定位提示"/> </a></li>
		<li><a href="http://www.cnblogs.com/cloudgamer/archive/2010/02/01/LazyLoad.html"><img src="images/putao.jpg" alt="简便文件上传"/> </a></li>
	</ul>
	<ul class="num" id="idNum">
	</ul>
</div>
<br />
<div>
	<input id="idAuto" type="button" value="停止" />
	<input id="idPre" type="button" value="&lt;&lt;" />
	<input id="idNext" type="button" value="&gt;&gt;" />
	<select id="idTween">
		<option value="0">默认缓动</option>
		<option value="1">方式1</option>
		<option value="2">方式2</option>
	</select>
</div>
<script>

var nums = [], timer, n = $$("idSlider2").getElementsByTagName("li").length,
	st = new SlideTrans("idContainer2", "idSlider2", n, {
		onStart: function(){//设置按钮样式
			forEach(nums, function(o, i){ o.className = st.Index == i ? "on" : ""; })
		}
	});
for(var i = 1; i <= n; AddNum(i++)){};
function AddNum(i){
	var num = $$("idNum").appendChild(document.createElement("li"));
	num.innerHTML = i--;
	num.onmouseover = function(){
		timer = setTimeout(function(){ num.className = "on"; st.Auto = false; st.Run(i); }, 200);
	}
	num.onmouseout = function(){ clearTimeout(timer); num.className = ""; st.Auto = true; st.Run(); }
	nums[i] = num;
}
st.Run();


$$("idAuto").onclick = function(){
	if(st.Auto){
		st.Auto = false; st.Stop(); this.value = "自动";
	}else{
		st.Auto = true; st.Run(); this.value = "停止";
	}
}
$$("idNext").onclick = function(){ st.Next(); }
$$("idPre").onclick = function(){ st.Previous(); }
$$("idTween").onchange = function(){
	switch (parseInt(this.value)){
		case 2 :
			st.Tween = Tween.Bounce.easeOut; break;
		case 1 :
			st.Tween = Tween.Back.easeOut; break;
		default :
			st.Tween = Tween.Quart.easeOut;
	}
}

</script>

<br />
 </div>
        
        </div>
        <!--//center-->
        
       
        <!--right-->
        <div id="right">
        	<div id="ttl">
                <span>销售排行</span>
                <a href="#"><img src="images/more.jpg" alt="more" /></a>            
            </div>
             <% 
        	List<ProductStatItem> items = StatService.getProductsBySaleCount();
			for (int i = 0; i < 6; i++) {
			ProductStatItem p = items.get(i);
			
		
        %>
			<div id="rank">
            	<div id="introd1"><a href="single.jsp?id=<%=p.getProductId() %>"><img src="upload/<%=p.getProductId() %>.jpg" alt="图片" width="40" height="40" /></a></div>
                <div id="introd2"><a href="single.jsp?id=<%=p.getProductId() %>"><%=p.getProductName() %></a></div>
                <div id="introd3"><a href="single.jsp?id=<%=p.getProductId() %>"><%=p.getTotalSalesCount() %>公斤/日</a></div>
          	</div>
          	<%
          	}
          	 %>
            </div>
        <!--//right-->
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
        for (int i = 0; i < 5; i++) {
			Product p = products.get(i);
		
			
      %>
   <td>
      <div id="class1">
      
        
             <div id="pit1"><a href="single.jsp?id=<%= p.getId() %>"><img src="upload/<%= p.getId() %>.jpg" alt="图片" width="100" height="100"/></a></div>
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
        for (int i = 0; i < 5; i++) {
			Product p = products.get(i);
		
			
      %>
   <td>
      <div id="class1">
      
        
             <div id="pit1"><a href="single.jsp?id=<%= p.getId() %>"><img src="upload/<%= p.getId() %>.jpg" alt="图片" width="100" height="100"/></a></div>
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
        for (int i = 0; i < 5; i++) {
			Product p = products.get(i);
		
			
      %>
   <td>
      <div id="class1">
      
        
             <div id="pit1"><a href="single.jsp?id=<%= p.getId() %>"><img src="upload/<%= p.getId() %>.jpg" alt="图片" width="100" height="100"/></a></div>
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
        for (int i = 0; i <5; i++) {
			Product p = products.get(i);
		
			
      %>
   <td>
      <div id="class1">
      
        
            <div id="pit1"><a href="single.jsp?id=<%= p.getId() %>"><img src="upload/<%= p.getId() %>.jpg" alt="图片" width="100" height="100"/></a></div>
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
