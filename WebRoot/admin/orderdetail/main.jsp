<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import=" com.zx.shopping.order.*, java.util.*" %>
<%@ page import="java.sql.*, com.zx.shopping.order.*, java.util.*" %>


<%
int id = Integer.parseInt(request.getParameter("id"));
SalesOrder so = OrderMgr.getInstance().loadById(id);

String action = request.getParameter("action");
if(action != null && action.equals("modify") ) {
	int status = Integer.parseInt(request.getParameter("status"));
	so.setStatus(status);
	so.updateStatus(); 
}
%>

<%

String statu;
double f=0;
if(so.getStatus()==0)
			{
			statu="待处理";
			}
			else
			{
			statu="交易成功";
			}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
        <title>苏州独墅湖水果商城</title>
        <link href="css/layout.css" rel="stylesheet" type="text/css"/>
        <script>
			<!--
				function setTab(m,n){
				var tli=document.getElementById("menu"+m).getElementsByTagName("li");
				var mli=document.getElementById("main"+m).getElementsByTagName("ul");
				for(i=0;i<tli.length;i++){
				   tli[i].className=i==n?"hover":"";
				   mli[i].style.display=i==n?"block":"none";
				}
				}
			//-->
		</script>
    </head>
    <body>
    	<div class="mainDiv">
        	<!-- logo、搜索栏 -->
        	<div class="main_top">
            	<div class="main_top_logo"></div>
                <div class="main_top_search">
                	<input class="search_input" type="text" value="" />
                    <input class="search_button" type="button" value="SEARCH" />
                </div>
                <!-- 清除浮动 -->
                <div class="clear"></div>
            </div>
            <!-- 您的位置 -->
            <div class="site">
            	您的位置：<a class="blue_href" href="#">首页</a> &gt; <a class="blue_href" href="#">我的水果帮</a> &gt <b>已卖出水果</b>
            </div>
            <!-- 当前状态 -->
            <div class="current_state">
            	<div class="current_state_detail">
                    <div class="indent_state">当前订单状态： <%=statu %></div>
                    <div class="indent_state">订单状态更改：<form name="form" action="main.jsp?id=<%=id %>" method="post">
		<input type="hidden" name="action" value="modify">
		<input type="hidden" name="id" value="<%=id %>">
		<select name="status">
			<option value="0">未处理</option>
			<option value="1" >已处理</option>
			
		</select>
		<br>
		<input type="submit" value="提交">
	</form>
	</div>
                  
                </div>
            </div>
            <!-- 订单信息 -->
            <div id="tabs0">
                <ul class="menu0" id="menu0">
                   <li onclick="setTab(0,0)" class="hover">订单信息</li>
                   <li onclick="setTab(0,1)">收货信息</li>
                </ul>
                <div class="detail_infor" id="main0">
                   <ul class="block">
                       <li>
                       		<b>买家信息</b><br/>
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            	<tr>
                                	<td width="50%">
                                    	<span style="letter-spacing:2em;">昵</span>称：<%=so.getUser().getUsername() %>
                                    </td>
                                    <td>
                                    	真实姓名：<%=so.getUser().getUsername() %>
                                    </td>
                                </tr>
                                <tr>
                                	<td>
                                    	所在地区：<%=so.getUser().getAddr() %>
                                    </td>
                                    <td>
                                    	联系电话：<%=so.getUser().getPhone() %>
                                    </td>
                                </tr>
                                <tr>
                                	<td>
                                    	<span style="letter-spacing:2em;">邮</span>箱：<a href="#"><%=so.getUser().getEmail() %></a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="#">发送站内信</a>
                                    </td>
                                    <td>
                                    	<span style="letter-spacing:0.34em;">支付宝</span>：
                                    </td>
                                </tr>
                            </table>
                            <table class="goods_detail" width="100%" cellpadding="0" cellspacing="0" border="0">
                            	<tr>
                                	<td class="goods_detail_tit" width="215">宝贝</td>
                                    <td class="goods_detail_tit">宝贝属性</td>
                                    <td class="goods_detail_tit" width="80">状态</td>
                                    <td class="goods_detail_tit" width="60">单价(元）</td>
                                    <td class="goods_detail_tit" width="60">数量</td>
                                    <td class="goods_detail_tit" width="80">会员价</td>
                                    <td class="goods_detail_tit" width="85">商品总价(元)</td>
                                    <td class="goods_detail_tit" width="70">运费(元)</td>
                                </tr>
                                <%
									List<SalesItem> items = OrderMgr.getInstance().getSalesItems(so);
									for(int i=0; i<items.size(); i++) {
									SalesItem si = items.get(i);
									f=f+si.getProduct().getMemberPrice();
									
								%>
                                <tr align="center">
                                
                                	<td>
                                    	<div class="goods_pic">
                                        	<a href="../../../single.jsp?id=<%=si.getProduct().getId() %>"><img src="../../upload/<%=si.getProduct().getId() %>.jpg" width="50" height="32" /></a>
                                        </div>
                                        <div class="goods_infor_intro">
                                        	<a href="../../single.jsp?id=<%=si.getProduct().getId() %>"><%=si.getProduct().getName() %></a>
                                        </div>
                                    </td>
                                    <td><%=si.getProduct().getDescr() %></td>
                                    <td><%=statu %></td>
                                    <td><%=si.getProduct().getNormalPrice() %></td>
                                    <td><%=si.getCount() %></td>
                                    <td><%=si.getProduct().getMemberPrice() %></td>
                                    <td><%=si.getUnitPrice() %></td>
                                    <td>20.00<br/>（快递）</td>
                                </tr><%} %>
                            </table>
                            
                            <div class="price">
                            	实付款：<span class="price_style"><%=f %></span>&nbsp;元
                            </div>
                            <div class="hr"></div>
                            <table class="noborder_table" width="100%" cellpadding="0" cellspacing="0" border="0">
                            	<tr>
                                	<td width="100" align="right">订单编号：</td>
                                    <td><%=so.getId() %></td>
                                </tr>
                            
                                <tr>
                                	<td align="right">成交时间：</td>
                                    <td><%=so.getODate() %></td>
                                </tr>
                            </table>
                       </li>
                   </ul>
                   <ul>
                   		<li>
                        	<table class="border_table" width="100%" cellpadding="0" cellspacing="0" border="0">
                            	<tr>
                                	<td width="100" align="right">收货地址：</td>
                                    <td><%=so.getAddr() %></td>
                                </tr>
                                <tr>
                                	<td align="right">运送方式：</td>
                                    <td>送货上门</td>
                                </tr>
                                <tr>
                                	<td align="right">物流名称：</td>
                                    <td>本店专用物流车</td>
                                </tr>
                               
                            </table>
                        </li>
                   </ul>
                </div>
            </div>
        </div>
    </body>
</html>
