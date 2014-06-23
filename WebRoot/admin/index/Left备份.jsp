<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<script language="javascript">
	state = 0 ;
	menuState = 0;
	mainState = 0;
</script>
<HEAD>
<TITLE>后台管理</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type=text/css> 
{
	FONT-SIZE: 12px
}
#menuTree A {
	COLOR: #566984; TEXT-DECORATION: none
}
</STYLE>
<SCRIPT src="Left.files/TreeNode.js" type=text/javascript></SCRIPT>
<SCRIPT src="Left.files/Tree.js" type=text/javascript></SCRIPT>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY 
style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(../images/bg.gif); BACKGROUND-REPEAT: repeat-x">
<TABLE height="387" cellSpacing=0 cellPadding=0 width="877">
  <TBODY>
    <TR>
      <TD width=10 height=29><IMG src="Left.files/bg_left_tl.gif"></TD>
      <TD 
    style="FONT-SIZE: 18px; BACKGROUND-IMAGE: url(../images/bg_left_tc.gif); COLOR: white; FONT-FAMILY: system">Main 
        Menu</TD>
      <TD width=10><IMG src="Left.files/bg_left_tr.gif"></TD>
    </TR>
    <TR>
      <TD style="BACKGROUND-IMAGE: url(../images/bg_left_ls.gif)"></TD>
      <TD id=menuTree 
    style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; HEIGHT: 100%; BACKGROUND-COLOR: white" 
    vAlign=top></TD>
      <TD style="BACKGROUND-IMAGE: url(../images/bg_left_rs.gif)"></TD>
    </TR>
    <TR>
      <TD width=10><IMG src="Left.files/bg_left_bl.gif"></TD>
      <TD style="BACKGROUND-IMAGE: url(../images/bg_left_bc.gif)"></TD>
      <TD width=10><IMG 
src="Left.files/bg_left_br.gif"></TD>
    </TR>
  </TBODY>
</TABLE>
<SCRIPT type=text/javascript>
var tree = null;
var root = new TreeNode('系统菜单');
var fun1 = new TreeNode('用户管理');var fun2 = new TreeNode('用户列表', '../UserList.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun1.add(fun2);var fun3 = new TreeNode('QQ聊天', '../qq.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun1.add(fun3);var fun4 = new TreeNode('-', 'EmployeeMgr.aspx', 'tree_node.gif', null, 'tree_node.gif', null);fun1.add(fun4);root.add(fun1);
var fun5 = new TreeNode('类别管理');var fun6 = new TreeNode('类别列表', '../CategoryList.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun5.add(fun6);var fun7 = new TreeNode('类别列表Ajax', '../CategoryListAJAX.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun5.add(fun7);var fun8 = new TreeNode('类别添加', '../CategoryAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun5.add(fun8);root.add(fun5);var fun9 = new TreeNode('产品管理');var fun10 = new TreeNode('产品列表', '../ProductList.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun9.add(fun10);var fun11 = new TreeNode('产品搜索', '../ProductSearch.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun9.add(fun11);var fun12 = new TreeNode('产品发布', '../ProductAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun9.add(fun12);root.add(fun9);
var fun13 = new TreeNode('订单管理');var fun14 = new TreeNode('订单列表', '../OrderList1.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun13.add(fun14);var fun15 = new TreeNode('-', 'MailBox.aspx', 'tree_node.gif', null, 'tree_node.gif', null);fun13.add(fun15);root.add(fun13);
var fun16 = new TreeNode('销售统计');var fun17 = new TreeNode('销量统计', '../ClickSalesCount.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun16.add(fun17);var fun18 = new TreeNode('', 'LoginLog.aspx', 'tree_node.gif', null, 'tree_node.gif', null);fun16.add(fun18);var fun19 = new TreeNode('', 'OperationLog.aspx', 'tree_node.gif', null, 'tree_node.gif', null);fun16.add(fun19);var fun20 = new TreeNode('', 'MenuSort.aspx', 'tree_node.gif', null, 'tree_node.gif', null);fun16.add(fun20);root.add(fun16);
var fun21 = new TreeNode('权限管理');var fun22 = new TreeNode('用户权限设置',  '../right1.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun21.add(fun22);var fun23 = new TreeNode('设置权限分类', 'HistoryQuery.aspx', 'tree_node.gif', null, 'tree_node.gif', null);fun21.add(fun23);var fun24 = new TreeNode('-', 'TimeStatistics.aspx', 'tree_node.gif', null, 'tree_node.gif', null);fun21.add(fun24);root.add(fun21);tree = new Tree(root);tree.show('menuTree')
</SCRIPT>
</BODY>
</HTML>
