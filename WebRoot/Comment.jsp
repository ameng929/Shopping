<%@ page language="java" import="com.zx.shopping.user.*" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.zx.shopping.order.*"%>
<%@ page import="com.zx.shopping.comment.*"%>
<%
User u = (User)session.getAttribute("user");
%>
<%
request.setCharacterEncoding("gbk");
int oid = Integer.parseInt(request.getParameter("oid"));
int pid = Integer.parseInt(request.getParameter("pid"));
int siid = Integer.parseInt(request.getParameter("siid"));
System.out.println(siid);
String action = request.getParameter("action");
//int oid;
if(action != null && action.trim().equals("com")) {
 oid = Integer.parseInt(request.getParameter("oid"));
pid = Integer.parseInt(request.getParameter("pid"));
 siid = Integer.parseInt(request.getParameter("siid"));
	String c = request.getParameter("comments");
	//用来改变评价状态
	 OrderMySQLDAO OM=new OrderMySQLDAO();
	 List<SalesItem> l=OM.getSalesItem(siid);
		 SalesItem si1=new SalesItem();
		 for(Iterator<SalesItem> its=l.iterator();its.hasNext();){
			 si1=its.next();
			 si1.setJudgec(1);
			 System.out.println(si1.getOrderId());
		     OM.updateJudgec(si1);
		 }
     
	
	 List<SalesItem> items = new OrderMySQLDAO().getSalesItems(oid);
        for(Iterator<SalesItem> its = items.iterator(); its.hasNext(); ) {
			SalesItem si = its.next();
			if(si.getProduct().getId()==pid){
			CommentMySQLDAO C=new CommentMySQLDAO();
	         oid=C.loadById(si.getId());
	         OrderMySQLDAO O =new OrderMySQLDAO();
	         SalesOrder so=new SalesOrder();
	        so=O.loadById(oid);
			Comment p=new Comment();
			p.setComment(c);
			p.setItemid(si.getId());
			p.setPid(si.getProduct().getId());
			p.setUid(u.getId());
			p.setCdate(so.getODate());
			CommentMgr.getInstance().add(p);
			response.sendRedirect("myorder.jsp");
			}
			}
	
	
}
 %>

<html><head><title>商品评价</title>


<script type="text/javascript">
	var req;
	function validate() {
		var idField = document.getElementById("userid");
		var url = "Validate.jsp?id=" + escape(idField.value);
		if(window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		req.open("GET", url, true);
		req.onreadystatechange = callback;
		req.send(null);
	}
	
	function callback() {
		if(req.readyState == 4) {
			if(req.status == 200) {
				//alert(req.responseText);
				var msg = req.responseXML.getElementsByTagName("msg")[0];
				//alert(msg);
		        setMsg(msg.childNodes[0].nodeValue);
			}
		}
	}
	
	function setMsg(msg) {
		//alert(msg);
		mdiv = document.getElementById("usermsg");
		if(msg == "invalid") {
			mdiv.innerHTML = "<font color='red'>username exists</font>";
		} else {
			mdiv.innerHTML = "<font color='green'>congratulations! you can use this username!</font>";
		}
	}
	

</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="Discuz!,Board,Comsenz,forums,bulletin board,">
<meta name="description" content="专区  - Discuz! Board">
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
.header			{ font: 11px Verdana,Tahoma; color: #FFFFFF; font-weight: bold; background-image: url("images/green/bg01.gif") }
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
--></style><script language="JavaScript" src="images/common.js"></script><style type="text/css" id="defaultPopStyle">.cPopText { font-family: Tahoma, Verdana; background-color: #FFFFCC; border: 1px #000000 solid; font-size: 12px; padding-right: 4px; padding-left: 4px; height: 20px; padding-top: 2px; padding-bottom: 2px; visibility: hidden; filter: Alpha(Opacity=80)}</style></head><body leftmargin="0" rightmargin="0" topmargin="0" onkeydown="if(event.keyCode==27) return false;"><div id="popLayer" style="position: absolute; z-index: 1000;" class="cPopText"></div>
</head><br>

<form method="post" name="comm" action="Comment.jsp?oid=<%=oid %>&pid=<%=pid %>&siid=<%=siid %>" onSubmit="this.regsubmit.disabled=true;">
<input type="hidden" name="action" value="com"/>

<table class="tableborder" align="center" cellpadding="4" cellspacing="1" width="97%">
<tbody><tr>
<td colspan="2" class="header">商品评价</td>
</tr>






<tr>
<td class="altbg1" valign="top">评价:</td>
<td class="altbg2"><textarea name="comments" cols="60" rows="5" id="comments"></textarea></td>
</tr>
</tbody></table>
<br>
<center><input name="regsubmit" value="提 &nbsp; 交" type="submit"></center>
</form>

<script language="JavaScript">
document.register.username.focus();
</script>

<p align="center">　</p>
<table class="smalltxt" cellpadding="4" cellspacing="0" width="100%">
<tbody><tr class="altbg1"><td><br></td>
<td align="right"><a href="http://bbs.allsmart.com/member.php?action=clearcookies" class="bold">清除 Cookies</a></td>
<td align="right" width="1">&nbsp;</td>
</tr>
<tr style="padding: 0px; font-size: 0px; line-height: 0px;" images="" green="" bg01.gif="" )=""><td colspan="3">　</td></tr>
</tbody></table>
<p align="center">

<br>
<a name="bottom"></a>

<a target="_blank" href="http://www.thinkpadclub.com.cn/"><u>苏州独墅湖水果商城</u></a><br>
服务热线:010-58052712
<!--<br><font color=#ebebeb>
Powered by <a href="http://www.discuz.net" target="_blank"><font color=#ebebeb>Discuz!</font></a> 
<a href="misc.php?action=viewlicense"><b style="color:#ebebeb">4.0.0RC4</b></a>&nbsp;
&copy; 2001-2005 <a href="http://www.comsenz.com" target="_blank"><font color=#ebebeb>Comsenz Technology Ltd</font></a>
<br>Processed in 0.011754 second(s), 5 queries
-->
</p>
</body></html>