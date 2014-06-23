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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>upload.html</title>

    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">

    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  <p>&nbsp;&nbsp;&nbsp;修改头像</p>
<img src="upload/head<%=id %>.jpg" width="150" height="150"></img>
  <body>
   <form action="servlet/fileServlet" method="post" enctype="multipart/form-data" name="form1">
<input name="id" type="hidden" value="head<%=id %>"><br/>
  <br/><br/>
  选择上传路径：<input type="file" name="file" size="20">

  <input type="submit" name="Submit" value="上传">
</form>


    
  </body>
</html>
