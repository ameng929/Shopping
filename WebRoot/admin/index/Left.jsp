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
<script type="text/javascript" src="../../JS/mydtree.js"></script>
	<link rel="StyleSheet" type="text/css" href="../../css/dtree.css" >
	<link rel="StyleSheet" type="text/css" href="../../css/leftStyle.css" >
	 <script type='text/javascript' src='../../dwr/engine.js'></script>
    <script type='text/javascript' src='../../dwr/interface/SjzdflDAO.js'></script>  
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY 
style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(../images/bg_left_tr.gif); BACKGROUND-REPEAT: repeat-x">
<TABLE height="25" cellSpacing=0 cellPadding=0 width="650">
  <TBODY>
    <TR>
      <TD width=10 height=29><IMG src="Left.files/bg_left_tl.gif"></TD>
      <TD 
    style="FONT-SIZE: 18px; BACKGROUND-IMAGE: url(../images/bg_left_tc.gif); COLOR: white; FONT-FAMILY: system">商城-后台管理<br></TD>
      <TD width=10><IMG src="Left.files/bg_left_tr.gif"></TD>
    </TR>
    
    
  </TBODY>
</TABLE>
<p><a href="javascript: d.openAll();">打开全部</a> | <a href="javascript: d.closeAll();">关闭全部</a></p>	
	<script type="text/javascript">
		<!--
			var sjzdflArr;
			//设置为同步
			DWREngine.setAsync(false); 
			SjzdflDAO.findAll(load);
			//重新设置回异步
			DWREngine.setAsync(true); 
			function load(data){
			
				sjzdflArr = data;
			}
		
			var d = new dTree('d');
				d.config.useCookies = false;//不使用cookies
				d.config.useStatusText = true; //状态栏显示文本
				d.config.closeSameLevel = true; //关闭同一层次其他节点
				//root
				d.add(0,-1,"系统菜单");
				
				//一级导航
				d.add(1,0,"用户管理");
				d.add(2,0,"类别管理");
				d.add(3,0,"产品管理");
				d.add(4,0,"订单管理");
				d.add(5,0,"销量统计");
				d.add(6,0,"数据字典");
				d.add(7,0,"权限管理");
				
				d.add(11,1,"用户列表","../UserList.jsp","","mainFrame");
				d.add(12,1,"聊天","../qq.jsp","","mainFrame");
				
				d.add(21,2,"类别列表","../CategoryList.jsp","","mainFrame");
				d.add(22,2,"类别添加","../CategoryAdd.jsp","","mainFrame");
				
				d.add(31,3,"产品列表","../ProductList.jsp","","mainFrame");
				d.add(32,3,"产品搜索","../ProductSearch.jsp","","mainFrame");
				d.add(33,3,"产品发布","../ProductAdd.jsp","","mainFrame");
				
				d.add(41,4,"订单列表","../OrderList1.jsp","","mainFrame");
				
				
				d.add(51,5,"销量统计","../ClickSalesCount.jsp","","mainFrame");
		
				
				d.add(61,6,"套餐分类设置","getSjzdfl.action","","mainFrame");
				var i;
				for(i = 0; i < sjzdflArr.length ;i++) {
					if(sjzdflArr[i].sjzdflmc != null && sjzdflArr[i].sjzdflmc != "" && sjzdflArr[i].qiyong == 'yes')
					d.add(62 + i,6,sjzdflArr[i].sjzdflmc,"getSjzdxx.action?sjzdflId="+sjzdflArr[i].sjzdflId,"","mainFrame");
				}
				//d.add(62 + i,6,"客户级别","getKhjb.action","","mainFrame");
				
				d.add(71,7,"权限管理","../right1.jsp","","mainFrame");
				
				document.write(d);
		-->
</script>
</body>
</html>