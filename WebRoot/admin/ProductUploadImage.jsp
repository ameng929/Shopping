<%@ page language="java" contentType="text/html; charset=GB18030" import="com.zx.shopping.*, java.util.*"
	pageEncoding="GBK"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>upload.html</title>

    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">

    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>

  <body>
   <form action="../servlet/Load" method="post" enctype="multipart/form-data" name="form1">
  <input type="file" name="file">
  <input type="submit" name="Submit" value="upload">
</form>
   
    <form name="uploadform" method="POST" action="./servlet/FileUpload" ENCTYPE="multipart/form-data">

        <table border="1" width="450" cellpadding="4" cellspacing="2" bordercolor="#9BD7FF">

        <tr><td width="100%" colspan="2">

                        �ļ�1��<input name="x" size="40" type="file">

        </td></tr>

        <tr><td width="100%" colspan="2">

                        �ļ�2��<input name="y" size="40" type="file">

        </td></tr>

        <tr><td width="100%" colspan="2">

                        �ļ�3��<input name="z" size="40" type="file">

        </td></tr>

        </table>

        <br/><br/>

        <table>

        <tr><td align="center"><input name="upload" type="submit" value="��ʼ�ϴ�"/></td></tr>

       </table>

</form>

  </body>
</html>
