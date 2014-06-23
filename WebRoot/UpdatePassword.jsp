<%@ page language="java" import="com.zx.shopping.user.*" pageEncoding="gbk"%>
<%@ page import="java.util.*"%>

<%
//检查session，查看用户是否登陆
User u = (User)session.getAttribute("user");
if(u == null) {
	response.sendRedirect("Index.jsp");
	return;
}
 %>

<%
String username=u.getUsername();
request.setCharacterEncoding("UTF-8");
String action = request.getParameter("action");

if(action != null && action.trim().equals("modifysecret")) {
    String password = request.getParameter("password");
    String password2= request.getParameter("password2");
    String password3= request.getParameter("password3");
    if(u.checkPassword(username,password)){
    
 		if(password2.equals(password3)){
 			u.setPassword(password2);
			u.updatesecret();
			out.println("<script>alert('更改成功!恭喜!');</script>");
			response.setHeader("refresh", "0;URL=myorder.jsp");//这里的3,是你要确定的时间秒URL是要跳转的地址
		}
    }
    else
    out.println("您输入的密码不一致或者旧密码输入错误，请重新输入！");
 }
	
	//response.sendRedirect("ChangePassword.jsp");


	
 %>
<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
        <title>苏州独墅湖水果商城会员信息修改</title>
        <link href="css/layout.css" rel="stylesheet" type="text/css"/>
	</head>
    <body>
    	<div class="user">
        	<div class="user_box">
            	<div class="user_box_title"><span>密码修改 </span>&nbsp;&nbsp;<cite>必填内容</cite></div>
                <form method="post" name="register" action="UpdatePassword.jsp" onSubmit="this.regsubmit.disabled=true;">
                <input type="hidden" name="action" value="modifysecret"/>
                <table class="noborder_table" width="100%" cellpadding="0" cellspacing="0" border="0">
                	<tr>
                    	<td width="100" align="right">
                        	原始密码：
                        </td>
                        <td>
                            <input class="input_text" name="password"  type="password" >
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                        	新密码：
                        </td>
                        <td>
                            <input class="input_text" name="password2" type="password" >
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                        	确认密码：
                        </td>
                        <td>
                         <input class="input_text" name="password3" type="password" >
                        </td>
                    </tr>
                    <tr>
               	    	<td colspan="2" align="center">
                        	<input "regsubmit" class="buttonStyle" type="submit" value="提交" onMouseOver="this.className='buttonStyle_hover'" onMouseOut="this.className='buttonStyle'"/>
                        </td>
                    </tr>
                </table>
                </form>
            
            </div>
        </div>
    </body>
</html>
