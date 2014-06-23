<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>导航栏</title>
	<script type="text/javascript" src="JS/mydtree.js"></script>
	<link rel="StyleSheet" type="text/css" href="css/dtree.css" >
	<link rel="StyleSheet" type="text/css" href="css/leftStyle.css" >
	 <script type='text/javascript' src='dwr/engine.js'></script>
    <script type='text/javascript' src='dwr/interface/SjzdflDAO.js'></script>  
</head>
<body>
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
				alert(sjzdflArr.size());
			}
		
			var d = new dTree('d');
				d.config.useCookies = false;//不使用cookies
				d.config.useStatusText = true; //状态栏显示文本
				d.config.closeSameLevel = true; //关闭同一层次其他节点
				//root
				d.add(0,-1,"北风网客户关系管理系统");
				
				//一级导航
				d.add(1,0,"客户信息");
				d.add(2,0,"客户服务");
				d.add(3,0,"日程/任务");
				d.add(4,0,"项目管理");
				d.add(5,0,"系统管理");
				d.add(6,0,"数据字典");
				d.add(7,0,"消息提醒");
				
				d.add(11,1,"客户","form/KhxxJZ.jsp","","main");
				d.add(12,1,"联系人","form/LxrJZ.jsp","","main");
				
				d.add(21,2,"客户投诉");
				d.add(22,2,"投诉报表");
				
				d.add(31,3,"日程");
				d.add(32,3,"任务");
				
				d.add(41,4,"项目立项");
				d.add(42,4,"项目审批");
				d.add(43,4,"项目进程");
				d.add(44,4,"项目总结");
				d.add(45,4,"项目交易");
				
				d.add(51,5,"用户");
				d.add(52,5,"角色");
				
				d.add(61,6,"数据字典分类","getSjzdfl.action","","main");
				var i;
				for(i = 0; i < sjzdflArr.length ;i++) {
					if(sjzdflArr[i].sjzdflmc != null && sjzdflArr[i].sjzdflmc != "" && sjzdflArr[i].qiyong == 'yes')
					d.add(62 + i,6,sjzdflArr[i].sjzdflmc,"getSjzdxx.action?sjzdflId="+sjzdflArr[i].sjzdflId,"","main");
				}
				d.add(62 + i,6,"客户级别","getKhjb.action","","main");
				
				d.add(71,7,"短消息");
				
				document.write(d);
		-->
	</script>
</body>
</html>