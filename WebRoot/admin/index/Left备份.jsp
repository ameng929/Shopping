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
<TITLE>��̨����</TITLE>
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
var root = new TreeNode('ϵͳ�˵�');
var fun1 = new TreeNode('�û�����');var fun2 = new TreeNode('�û��б�', '../UserList.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun1.add(fun2);var fun3 = new TreeNode('QQ����', '../qq.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun1.add(fun3);var fun4 = new TreeNode('-', 'EmployeeMgr.aspx', 'tree_node.gif', null, 'tree_node.gif', null);fun1.add(fun4);root.add(fun1);
var fun5 = new TreeNode('������');var fun6 = new TreeNode('����б�', '../CategoryList.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun5.add(fun6);var fun7 = new TreeNode('����б�Ajax', '../CategoryListAJAX.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun5.add(fun7);var fun8 = new TreeNode('������', '../CategoryAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun5.add(fun8);root.add(fun5);var fun9 = new TreeNode('��Ʒ����');var fun10 = new TreeNode('��Ʒ�б�', '../ProductList.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun9.add(fun10);var fun11 = new TreeNode('��Ʒ����', '../ProductSearch.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun9.add(fun11);var fun12 = new TreeNode('��Ʒ����', '../ProductAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun9.add(fun12);root.add(fun9);
var fun13 = new TreeNode('��������');var fun14 = new TreeNode('�����б�', '../OrderList1.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun13.add(fun14);var fun15 = new TreeNode('-', 'MailBox.aspx', 'tree_node.gif', null, 'tree_node.gif', null);fun13.add(fun15);root.add(fun13);
var fun16 = new TreeNode('����ͳ��');var fun17 = new TreeNode('����ͳ��', '../ClickSalesCount.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun16.add(fun17);var fun18 = new TreeNode('', 'LoginLog.aspx', 'tree_node.gif', null, 'tree_node.gif', null);fun16.add(fun18);var fun19 = new TreeNode('', 'OperationLog.aspx', 'tree_node.gif', null, 'tree_node.gif', null);fun16.add(fun19);var fun20 = new TreeNode('', 'MenuSort.aspx', 'tree_node.gif', null, 'tree_node.gif', null);fun16.add(fun20);root.add(fun16);
var fun21 = new TreeNode('Ȩ�޹���');var fun22 = new TreeNode('�û�Ȩ������',  '../right1.jsp', 'tree_node.gif', null, 'tree_node.gif', null);fun21.add(fun22);var fun23 = new TreeNode('����Ȩ�޷���', 'HistoryQuery.aspx', 'tree_node.gif', null, 'tree_node.gif', null);fun21.add(fun23);var fun24 = new TreeNode('-', 'TimeStatistics.aspx', 'tree_node.gif', null, 'tree_node.gif', null);fun21.add(fun24);root.add(fun21);tree = new Tree(root);tree.show('menuTree')
</SCRIPT>
</BODY>
</HTML>
