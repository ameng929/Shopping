<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.user.*"%>



<%
	
	final int PAGE_SIZE = 5; //每页显示多少条记录
	final int PAGES_PER_TIME = 10;//每次显示多少个页码链接
	int pageNo = 1;
	String strPageNo = request.getParameter("pageNo");
	if (strPageNo != null && !strPageNo.trim().equals("")) {
		try {
			pageNo = Integer.parseInt(strPageNo);
		} catch (NumberFormatException e) {
			pageNo = 1;
		}
	}
	if (pageNo <= 0)
		pageNo = 1;
%>
<%
	List<User> users = new ArrayList<User>();
	int totalRecords = User.getUsers(users, pageNo, PAGE_SIZE);
	int totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;

	if (pageNo > totalPages)
		pageNo = totalPages;
%>
<html>
	<head>
		<title>会员列表</title>

		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<meta name="keywords"
			content="Discuz!,Board,Comsenz,forums,bulletin board,">
		<meta name="description" content="苏州独墅湖水果商城会员列表">
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
				var ids = document.getElementsByName("box");
				if(document.formDelete.selectall.checked) {
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
		
	<script>
function checkbox()
{
var str=document.getElementsByName("box");
var objarray=str.length;
var chestr="";
//var chestr=0;
for (i=0;i<objarray;i++)
{//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
  if(str[i].checked == true)
  {
    //chestr=str[i].id;
   chestr+=str[i].id+",";
  }
}//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
if(chestr == "")
{
  alert("请先选择一个再删除～！");
}
else
{
  alert(chestr);
  window.location.href='UserDelete.jsp?id='+chestr;
}
}</script>
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
						&nbsp;用户管理 &#187; 会员列表
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
									<td>
										<table class="tableborder" cellpadding="2" cellspacing="1">
											<tbody>
												<tr class="smalltxt" bgcolor="#f3f6fa">
													<td class="header">
														&nbsp;<%=totalRecords %>&nbsp;
													</td>
													<td class="header">
														&nbsp;<%=pageNo %>/<%=totalPages %>&nbsp;
													</td>
													
													<%
													int start = ((pageNo - 1) / PAGES_PER_TIME) * PAGES_PER_TIME + 1;
													for(int i=start; i<start+PAGES_PER_TIME; i++) {
														if(i > totalPages) break;
														if(pageNo == i) {
													 %>
															<td bgcolor="#ffffff">&nbsp;<u><b><%=i %></b></u>&nbsp;</td>
														<%
														} else {
														 %>
															<td>&nbsp;
																<a href="UserList.jsp?pageNo=<%=i%>"><%=i%></a>&nbsp;
															</td>
													<%
														}
													}
													 %>
													<td>
														&nbsp;
														<a href="UserList.jsp?pageNo=<%=pageNo+1%>">&gt;</a>&nbsp;
													</td>
													
													
												</tr>
											</tbody>
										</table>
									</td>
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

		<input name="formhash" value="93a2a31f" type="hidden">
		<form action="ProductDeleteMultiple.jsp" name="formDelete" method="post" target="detail">
		<table class="tableborder" align="center" cellpadding="4"
			cellspacing="1" width="97%">
			<tbody>
				<tr class="header">
				    <td align="center" width="9%">
						<input type="checkbox" name="selectall" onchange="checkDelete()"><input type="button" name="button" id="button"onclick="checkbox()"  value="批处理删除" />
					</td>
					<td align="center" width="9%">
						用户名
					</td>
					<td align="center" width="6%">
						UID
					</td>
					<td align="center" width="16%">
						联系电话
					</td>
					<td align="center" width="20%">
						注册时间
					</td>
					<td align="center" width="20%">
						送货地址
					</td>
					<td align="center">
						权限设置
					</td>
				</tr>

				<%
						for (int i = 0; i < users.size(); i++) {
						User u = users.get(i);
				%>

				<tr>
				
				    <td class="altbg1" align="center" nowrap="nowrap">
						<input type="checkbox" name="box" id="<%=u.getId()%>">
					</td>
					<td class="altbg1" align="center" nowrap="nowrap">
						<%=u.getUsername()%>
					</td>
					<td class="altbg2" align="center">
						<%=u.getId()%>
					</td>
					<td class="altbg1" align="center">
						<%=u.getPhone()%>
					</td>
					<td class="altbg1" align="center">
						<%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
								.format(u.getRdate())%>
					</td>
					<td class="altbg1" align="center">
						<%=u.getAddr()%>
					</td>
					<td class="altbg1" align="right">
							<a target="detail" href="setright.jsp?id=<%=u.getId()%>">权限更改</a>
					</td>
				</tr>

				<%
				}
				%>
				</form>

				<form method="post" action="member.php?action=list"></form>
				<tr>
					<td colspan="5" class="altbg2">
						搜索
						<input size="15" name="srchmem" type="text">
						<input value="提 &nbsp; 交" type="submit">
						&nbsp; &nbsp;
						<span class="bold">或</span> &nbsp; 排序方式:
						</td>
				</tr>
			</tbody>
		</table><br><a name="bottom" /></body>
</html>
