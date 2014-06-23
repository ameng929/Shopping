<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.product.*"%>
<%@ page import="com.zx.shopping.category.*"%>
<%@ page import="java.sql.*, com.zx.shopping.order.*, java.util.*" %>


<%!
private static final int PAGE_SIZE = 5;
String statu;
%>

<%
String strPageNo = request.getParameter("pageno");
int pageNo = 1;
if(strPageNo != null) {
	pageNo = Integer.parseInt(strPageNo);
}
if(pageNo < 1) pageNo = 1;
%>

<%
//get all the users
List<SalesOrder> orders = new ArrayList<SalesOrder>();
int totalRecords = OrderMgr.getInstance().getOrders(orders, pageNo, PAGE_SIZE);

int totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;
if(pageNo > totalPages) pageNo = totalPages;
%>

<html>
	<head>
		<title>订单列表</title>

		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<meta name="keywords"
			content="Discuz!,Board,Comsenz,forums,bulletin board,">
		<meta name="description" content="订单列表">
		<meta name="generator" content="Discuz! 4.0.0RC4 with Templates 4.0.0">
		<meta name="MSSmartTagsPreventParsing" content="TRUE">
		<meta http-equiv="MSThemeCompatible" content="Yes">

		<style type="text/css"><!--
a			{ text-decoration: none; color: #000000 }
a:hover			{ text-decoration: underline }
body			{ scrollbar-base-color: #F3F6FA; scrollbar-arrow-color: #4D76B3; font-size: 12px; background-color: #ffffff }
table			{ font: 12px Verdana,Tahoma; color: #000000 }
input,select,textarea	{ font: 11px Verdana,Tahoma; color: #000000; font-weight: normal; background-color: #F3F6FA }
select			{ font: 11px Verdana,Tahoma; color: #000000; font-weight: normal; background-color: #F3F6FA }
.nav			{ font: 12px Verdana,Tahoma; color: #000000; font-weight: bold }
.nav a			{ color: #000000 }
.header			{ font: 11px Verdana,Tahoma; color: #000000; font-weight: bold; background-image: url("images/green/bg01.gif") }
.header a		{ color: #FFFFFF }
.category		{ font: 11px Verdana,Tahoma; color: #000000; background-color: #EFEFEF }
.tableborder		{ background: #4D76B3; border: 0px solid #4D76B3 } 
.singleborder		{ font-size: 0px; line-height: 0px; padding: 0px; background-color: #F3F6FA }
.smalltxt		{ font: 11px Verdana,Tahoma }
.outertxt		{ font: 12px Verdana,Tahoma; color: #000000 }
.outertxt a		{ color: #000000 }
.bold			{ font-weight: bold }
.altbg1			{ background: #F3F6FA }
.altbg2			{ background: #FFFFFF }
--></style>
		<script language="JavaScript" src="images/common.js"></script>
		<style type="text/css" id="defaultPopStyle">.cPopText { font-family: Tahoma, Verdana; background-color: #FFFFCC; border: 1px #000000 solid; font-size: 12px; padding-right: 4px; padding-left: 4px; height: 20px; padding-top: 2px; padding-bottom: 2px; visibility: hidden; filter: Alpha(Opacity=80)}</style>
		
		
		<script type="text/javascript">
			function checkDelete() {
				var ids = document.getElementsByName("id1");
				if(document.formDelete.selectAll.checked) {
					for(var i=0; i<ids.length; i++) {
						ids[i].checked="checked";
					}
				} else {
					for(var i=0; i<ids.length; i++) {
						ids[i].checked="";
					}
				}
			}
		</script>
		
		
		<script type="text/javascript">
			var req;
			var gID;
			function changeToInput(id) {
				var oNP = document.getElementById(id);
				var value = oNP.value;
				oNP.outerHTML = "<input type='text' id='" + id + "' value='" + value + "' size='5' onblur='change(this.id)'>";
				document.getElementById(id).focus();
			}
			
			function change(id) {
				var oNP = document.getElementById(id);
				var value = oNP.value;
				gID = id;
				init();
				var url = "ChangePrice.jsp?id=" + escape(id) + "&normalprice=" + value;
				req.open("GET", url, true);
				req.onreadystatechange = callback;
				req.send(null);
				
			}
			
			function init() {
				if(window.XMLHttpRequest) {
					req = new XMLHttpRequest();
				} else if (window.ActiveXObject) {
					req = new ActiveXObject("Microsoft.XMLHTTP");
				}
			}
			
			function callback() {
				if(4 == req.readyState) {
				
					if(200 == req.status) {
				
						var oNP = document.getElementById(gID);
						var value = oNP.value;
						oNP.outerHTML = "<span style='background:gray' id='" + gID + "' value='" + value + "' onclick='changeToInput(this.id)'>" + value + "</span>";
					}
				}
				
			}
			
		</script>
		
		
	</head>
	<body leftmargin="0" rightmargin="0" topmargin="0"
		onkeydown="if(event.keyCode==27) return false;">
		<div id="popLayer" style="position: absolute; z-index: 1000;"
			class="cPopText"></div>


		<table style="table-layout: fixed;" align="center" border="0"
			cellpadding="0" cellspacing="0" width="97%">
			<tbody>
				<tr>
					<td class="nav" align="left" nowrap="nowrap" width="90%">
						&nbsp;订单管理 &#187; 订单列表
					</td>
					<td align="right" width="10%">
						&nbsp;
						<a href="#bottom"><img src="../images/arrow_dw.gif"
								align="absmiddle" border="0">
						</a>
					</td>
				</tr>
			</tbody>
		</table>
		<br>
		
		
		
		<table align="center" border="0" cellpadding="0" cellspacing="0"
			width="97%">
			<tbody>
				<tr>
					<td>
						<table border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td height="3"></td>
								</tr>
								<tr>
									<td><br></td>
								</tr>
								<tr>
									<td height="3"></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>

		<form action="OrdeDelete.jsp" name="formDelete" method="post" target="detail">		
		<table class="tableborder" align="center" cellpadding="4"
			cellspacing="1" width="97%">
			<tbody>
				<tr class="header">
					<td align="center" width="2%">
						选择
					</td>
					<td align="center" width="6%">
						订单号
					</td>
				
					<td align="center" width="6%">
						用户名
					</td>
					
					<td align="center" width="8%">
						下单时间
					</td>
					<td align="center" width="5%">
						处理状态
					</td>
					
					
				</tr>

				<%
		for(Iterator<SalesOrder> it = orders.iterator(); it.hasNext(); ) {
			SalesOrder so = it.next();
		%>
		<%


if(so.getStatus()==0)
			{
			statu="待处理";
			}
			else
			{
			statu="交易成功";
			}
%>
				
				<tr>
			
					<td class="altbg2" align="center">
						<input type="checkbox" name="id1" value="<%=so.getId()%>"/>
					</td>
					<td class="altbg2" align="center">
						订单编号：<%=so.getId() %></td>
					<td class="altbg2" align="center">
					<img src="../upload/head<%=so.getUser().getId() %>.jpg" width="32" height="28" />
						&nbsp; &nbsp; &nbsp; &nbsp;<%=so.getUser().getUsername() %>
					</td>
					
					<td class="altbg1" align="center">
						
							<%=so.getODate() %>
		
					</td>
					<td class="altbg1" align="center">
						<%=statu %><a href="../admin/orderdetail/OrderDetail.jsp?id=<%=so.getId()%>" target="detail"><br/><span style="color: red">详情</span></a>
					</td>
					
					
				</tr>

				<%
				}
				%>

				<tr>
					<td>
						<input name="selectAll" type="checkbox" onclick="checkDelete()"/>
						<input type="submit" value="Delete"/>
					</td>
					
					</form> <!-- end formDelete -->
					
					<td colspan="8" class="altbg2">
						<form name="formSearch" action="SearchResult.jsp" method="get">
						<input type="text" size="10" name="keyword"/>
						搜索
						<input value="提 &nbsp; 交" type="submit">
						</form>
						&nbsp; &nbsp;
						
					</td>
				</tr>
			</tbody>
		</table>
<center>
		第<%=pageNo %>页
		&nbsp;
		共<%=totalPages %>页
		&nbsp;
		<a href="OrderList1.jsp?pageno=<%=pageNo-1 %>">上一页</a>
		&nbsp;
		<a href="OrderList1.jsp?pageno=<%=pageNo+1 %>">下一页</a>
		&nbsp;
		<a href="OrderList1.jsp?pageno=<%=totalPages %>">最后一页</a>
	</center>
		

		<a name="bottom" />
	</body>
</html>
