<%@ page language="java" contentType="text/html; charset=GB18030" import="com.zx.shopping.*, java.util.*"
	pageEncoding="GB18030"%>

<%
String strId=request.getParameter("id");
if(strId == null || strId.trim().equals("")){
out.println("你选择的商品有错！");
return;
}
int id = Integer.parseInt(strId);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>upload.html</title>

    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">

    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>

  <style>
* { font-family: "宋体"; font-size: 14px }
</style>
<body>
<p align="center"> 请您选择需要上传的文件</p>
<form id="form1" name="form1" method="post" action="../servlet/fileServlet" enctype="multipart/form-data">
 <table border="0" align="center">
  <tr>
   <td>上传人：</td>
   <td>
    <input name="name" type="text" id="name" size="20" value="<%=id %>"></td>
  </tr>   
  <tr>
   <td>上传文件：</td>
   <td><input name="file" type="file" size="20" ></td>
  </tr>    
  <tr>   
   <td></td><td>
    <input type="submit" name="submit" value="提交" >
    <input type="reset" name="reset" value="重置" >
   </td>
  </tr>
 </table>
</form>
  
   
    
  </body>
</html>
