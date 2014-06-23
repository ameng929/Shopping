<%@ page language="java" contentType="text/html; charset=GB18030" import="com.zx.shopping.user.*"
    pageEncoding="GBK"%>

<%
User u=(User)request.getAttribute("user");
session.setAttribute("user",u);
String Left="Left2";
System.out.println("yonghuquanxian"+u.getRight());
if(u.getRight()==0){
out.println("您是普通用户，没有权限登入");
return;
}
if(u.getRight()==1){
Left="Left";
}
if(u.getRight()==2){
Left="Left2";
}
if(u.getRight()==3){
Left="Left3";
}
if(u.getRight()==4){
Left="Left4";
}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Frameset//EN">
<HTML>
<script language="javascript">
	state = 0 ;
	menuState = 0;
	mainState = 0;
</script>
<HEAD><TITLE>shopping 首页</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<META content="MSHTML 6.00.2900.5848" name=GENERATOR></HEAD><FRAMESET id=index 
border=0 frameSpacing=0 rows=120,* frameBorder=no><FRAME id=topFrame 
name=topFrame src="admin/index/Top.jsp" noResize scrolling=no><FRAMESET 
border=0 frameSpacing=0 frameBorder=no cols=20%,*><FRAME id=leftFrame 
name=leftFrame src="admin/index/<%=Left %>.jsp" noResize scrolling=no><FRAME 
id=mainFrame name=mainFrame src="admin/UserList.jsp" noResize 
scrolling=no></FRAMESET></FRAMESET><noframes></noframes>
</HTML>
</HTML>
