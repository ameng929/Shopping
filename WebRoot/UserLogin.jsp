<%@ page language="java" contentType="text/html; charset=GB18030" import="com.zx.shopping.user.*"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="java.util.*"%>
<% request.setCharacterEncoding("gbk");
   response.setContentType("text/html;charset=gbk"); %> 
   <%
String action = request.getParameter("action");
if(action != null && action.equals("login")) {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	User u = null;
	try {
		u = User.check(username, password);
	} catch (UserNotFoundException e) {
		out.println(e.getMessage());
		return;
	} catch (PasswordNotCorrectException e) {
		out.println(e.getMessage());
		return;
	}

	session.setAttribute("user", u);
	response.sendRedirect("Confirm.jsp");
}
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>index</title>
<link href="css/enter.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--wrap-->
<div id="wrap">
	<!--top-->
	<div id="header">
    	<h1><img src="images/h1.jpg" alt="Gopile" /></h1>
  </div>
	<!--//top-->
    <!--content-->
      <div id="enter">
      <form method="post" action="UserLogin.jsp">
      <input type="hidden" name="action" value="login"class="b1""/>
        	<div id="pace">
           	  	<div id="logo"><img src="images/h1.jpg" alt="logo" /></div>
              	<div id="name" style="top: 137px; left: 61px; width: 308px; height: 23px;">
              		<p>�û�����</p>
                	<input style="background:#999999" type="text" name="username" class="b1""/>
              	    <span><a href="Register.jsp">ע�����û�</a></span>                   </div>
                <div id="psw" style="top: 175px; height: 32px;">
              		<p>�� �룺</p>
                	<input style="background:#999999" type="password" name="password" class="b2"/>
                    <span><a href="pwdforget.jsp">��������</a></span>                </div>
                <div id="btn">
                	<input type="submit" value="��¼" class="b1" />
                    <input type="reset" value="��λ" class="b2" />
                </div>
            </div>
            </form>
        </div>
	<!--//content-->
    <!--ads-->
    <div id="ads"></div>
    <!--//ads-->
    <!--bottom-->
    <div id="bottom">
   		<p>���ݶ�����ˮ���̳�</p>
        <p>��ϵ�绰��0000-00000000</p>
        <p>Copyright 2010-2013 Vanvl.com All Rights��ICP֤100557��</p>
    </div>

</div>
<!--//wrap-->
</body> 
</html>
