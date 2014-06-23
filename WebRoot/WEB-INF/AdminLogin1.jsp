<%@page pageEncoding="GBK" import="java.util.*" %>
<%
String action = request.getParameter("action");
if(action != null && action.equals("login")) {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	if( !username.equals("admin") || !password.equals("admin") ) {
		out.println("username or password not correct!");
		return;
	}
	session.setAttribute("admin" , "admin");
	response.sendRedirect("../admin/Adminindex1.jsp");
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<script type="text/javascript">
function changeImg(){

    document.getElementById("Image1").src="CodeCheck.aspx?"+Math.random();
    }
</script>



<title> 商城后台管理</title>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK 
href="images/public.css" type=text/css rel=stylesheet>
<LINK 
href="images/login.css" type=text/css rel=stylesheet>
<STYLE type=text/css>
</STYLE>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY>
<DIV id=div1>
  <TABLE id=login height="100%" cellSpacing=0 cellPadding=0 width=800 
align=center>
    <TBODY>
      <TR id=main>
        <TD>
          <TABLE height="79%" cellSpacing=0 cellPadding=0 width="92%">
            <TBODY>
              <TR>
                <TD height="197" colSpan=4><blockquote>
                  <h1 align="right" style="font-size:34px"><em><strong>苏州独墅湖水果商城后台系统</strong></em></h1>
                </blockquote></TD>
              </TR>
              <TR height=30>
                <TD width=376>&nbsp;</TD>
                <TD width="57">&nbsp;</TD>
                <TD width="182">&nbsp;</TD>
                <TD>&nbsp;</TD>
              </TR>
              <form name="myform" action="../admin/AdminLogin1.jsp" method="post">
<input type="hidden" name="action" value="login"/>
              <TR height=40>
                <TD rowSpan=4>&nbsp;</TD>
                <TD>用户名：</TD>
                <TD>
                  <INPUT name="username" class=textbox id=txtUserName >                </TD>
                <TD width=117>&nbsp;</TD>
              </TR>
              <TR height=40>
                <TD>密　码：</TD>
                <TD>
                  <INPUT class=textbox id=txtUserPassword type=password 
            name="password">                </TD>
                <TD width=117>&nbsp;</TD>
              </TR>
              <TR height=40>
                <TD>验证码：</TD>
                <TD vAlign=center colSpan=2>
                  <INPUT id=txtSN size=4 name="code" type=text value="">
                  &nbsp; <IMG src="../image.jsp" border=0> <A id=LinkButton1 
            href="javascript:changeImg();">不清楚，再来一张</A></TD>
              </TR>
              <TR height=40>
                <TD height="21"></TD>
                <TD align=left><input id=btnLogin type=submit value=" 登 录 " name=btnLogin> &nbsp;&nbsp;&nbsp;&nbsp;
                   <input id=btnLogin type=submit value=" 重置 " name=btnLogin> </TD>
                <TD width=117>&nbsp;</TD>
              </TR>
              <TR height=110>
                <TD height="15" colSpan=4>&nbsp;</TD>
              </TR>
              </form>
            </TBODY>
          </TABLE>
        </TD>
      </TR>
      <TR id=root height=104>
        <TD>&nbsp;</TD>
      </TR>
    </TBODY>
  </TABLE>
</DIV>
<DIV id=div2 style="DISPLAY: none"></DIV>
</CONTENTTEMPLATE>
</BODY>
</HTML>
