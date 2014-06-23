<%@ page language="java" contentType="text/html; charset=GB18030" import="com.zx.shopping.*,com.zx.shopping.user.*, java.util.*"
	pageEncoding="GB18030"%>

<%
User u = (User)session.getAttribute("user");
//String addr=u.getAddr();
if(u == null) {
	response.sendRedirect("Loginin.jsp");
	return;
}
int id =u.getId();
%>
<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
        <title>头像修改</title>
        <link href="css/layout.css" rel="stylesheet" type="text/css"/>
	</head>
    <body>
    	<div class="user">
        	<div class="user_box">
            	<div class="user_box_title"><span>头像修改 </span>&nbsp;&nbsp;<cite>定制个性头像</cite></div>
                <form action="servlet/fileServlet" method="post" enctype="multipart/form-data" name="form1">
				<input name="id" type="hidden" value="head<%=id %>"><br/>
                <table class="noborder_table" width="100%" cellpadding="0" cellspacing="0" border="0">
                	<tr>
                    	<td width="100" align="right">
                        	我的头像：
                        </td>
                        <td>
                            <img src="upload/head<%=id %>.jpg?t=<%=new Date() %>" width="150" height="150"></img>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                        	选择路径：
                        </td>
                        <td>
                            <input type="file" name="file" size="20">
                        </td>
                    </tr>
                    
                    <tr>
               	    	<td colspan="2" align="center">
                        	<input "regsubmit" class="buttonStyle" type="submit" value="修改" onMouseOver="this.className='buttonStyle_hover'" onMouseOut="this.className='buttonStyle'"/>
                        </td>
                    </tr>
                </table>
                </form>
            
            </div>
        </div>
    </body>
</html>
