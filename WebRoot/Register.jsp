<%@ page language="java" import="com.zx.shopping.user.*" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>

<%

request.setCharacterEncoding("GBK");
String action = request.getParameter("action");

if(action != null && action.trim().equals("register")) {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
	String phone = request.getParameter("phone");
    String addr = request.getParameter("addr");
	String email = request.getParameter("email");
	User u = new User();
    u.setUsername(username);
	u.setPassword(password);
	u.setPhone(phone);
	u.setAddr(addr);
	u.setEmail(email);
	u.setRdate(new Date());
	u.save();

response.setHeader("refresh", "0;URL=Loginin.jsp");//这里的3,是你要确定的时间秒URL是要跳转的地址


			
}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>index</title>
<link href="css/register.css" rel="stylesheet" type="text/css" />
</head>

<script language=Javascript>

    
      function show(o){
 //重载验证码
 var timenow = new Date().getTime();
 o.src="image.action?d="+timenow;
 
}

function tijiao(){
if(document.register.username.value=="")
{	alert('用户名不能为空');
	return false;
}


if(document.register.password.value=="")
{
	alert('密码不能为空');
	return false;
}

if(document.register.password2.value=="")
{
	alert('密码不能为空');
	return false;
}

if(document.register.password2.value!=document.register.password.value)
{
	alert('与密码输入不一致');
	return false;
}

if(document.register.code.value=="")
{
alert('验证码不能为空');
return false;
}
 

document.register.submit();

}
</script>
<body>
<!--wrap-->
<div id="wrap">
	<!--top-->
	<div id="header">
    	<h1><img src="images/h1.jpg" alt="Gopile" /></h1>
        <div id="welcome">您好，欢迎来到独墅湖水果商城！</div>
    </div>
    <!--content-->
<form method="post" name="register" action="Register.jsp" >
<input type="hidden" name="action" value="register"/>
    <div id="content">
   	  <div id="ttl">注册账号</div>
        <div id="size">
        	<p>用户名</p>
            <input type="text" class="txt" name="username" />
        </div>
        <div id="size">
       	  <p>密&nbsp;码</p>
            <input type="password" class="txt" name="password"/>
        </div>
        <div id="size">
       	  <p>确认密码</p>
            <input type="password" class="txt" name="password2"/>
        </div>
        <div id="size">
       	  <p>电&nbsp;&nbsp;话</p>
            <input type="text" class="txt" name="phone"/>
        </div>

		  <div id="size">
       	  <p>邮&nbsp;&nbsp;箱</p>
            <input type="text" class="txt" name="email"/>
        </div>

		  <div id="size">
       	  <p>地&nbsp;&nbsp;址</p>
            <input type="text" class="txt" name="addr" />
        </div>
        <div id="size">
       	  <p>验证码</p>
            <input type="text" class="txt1" name="code"/>
            <dl>
           	  <dt><img name="random"  src="image.action" id="random" alt="验证码" /></dt>
                <dd>
                	<span>看不清？</span><a href="javascript:show(document.getElementById('random'))">换一张</a>
              </dd>
            </dl>
        </div>
        <div id="size1">
          <input type="button" value="同意用户协议并注册" class="btn" onclick="tijiao()"/>
          <p><a href="#">查看用户协议</a></p>
        </div>
    </div>
    </form>
    
    <script language="JavaScript">
    document.register.username.focus();
    </script>

    
    
    
    
    
    
    
    
    
    
	<!--//content-->
    <!--ads-->
    <div id="ads"></div>
    <!--//ads-->
    <!--bottom-->
    <div id="bottom">
   		<p>独墅湖水果商城</p>
        <p>联系电话：18036095723/p>
        <p>Copyright 2013-2014 水果帮</p>
    </div>

</div>
<!--//wrap-->
</body> 
</html>
