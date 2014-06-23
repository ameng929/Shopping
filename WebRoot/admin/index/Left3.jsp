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
<TITLE>无标题页</TITLE>
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
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
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
var fun5 = new TreeNode('类别管理');var fun6 = new TreeNode('类别列表', '../CategoryList.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun5.add(fun6);var fun7 = new TreeNode('类别列表Ajax', '../CategoryListAJAX.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun5.add(fun7);var fun8 = new TreeNode('类别添加', '../CategoryAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun5.add(fun8);root.add(fun5);
var fun9 = new TreeNode('产品管理');var fun10 = new TreeNode('产品列表', '../ProductList.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun9.add(fun10);var fun11 = new TreeNode('产品搜索', '../ProductSearch.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun9.add(fun11);var fun12 = new TreeNode('产品发布', '../ProductAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun9.add(fun12);root.add(fun9);
tree = new Tree(root);tree.show('menuTree')
</SCRIPT>
</BODY>
</HTML>
