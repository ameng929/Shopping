<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.user.*"%>

<%
String str=request.getParameter("id");
//int id=Integer.parseInt(request.getParameter("id"));
int[] ID=new int[20] ;

String[] s = str.split(",");//取出来是一个字符串数组

//循环取出来的字符串数组
for (int i=0;i<s.length;i++)
{
ID[i] = Integer.parseInt(s[i]);
//String[] ss = null;//用全局变量
//int num = 0;
//String url = request.getParameter("from");
//User.delete(id);
User.delete(ID[i]);



//User.delete(id);
}
String url = request.getParameter("from");
%>

<html>
	<head>
		<title>删除用户</title>
	</head>
	<body>
		<center>
			恭喜您, 删除成功!
			<br>
			<span id="delay" style="background:red">3</span>秒钟后跳转到上一页面, 或者请点击下面的链接 自己跳转
			<br>
			<a href="<%=url%>"><%=url%></a>
		</center>
		<script type="text/javascript">	
			
			//var delay = 3;
			//function goBack() {
			//	document.getElementById("delay").innerHTML=delay;
			//	delay --;
			//	if(delay == 0) 
			//		document.location.href='<%=url%>';
			//	else 
			//		setTimeout(goBack, 1000);
			//}
			//goBack();
			
			parent.main.location.reload();
			
		</script>
	</body>
</html>