<%@ page language="java" contentType="text/html; charset=gbk"%>
<html>
<head>
<title>using commons Upload to upload file </title>
</head>
<style>
* { font-family: "����"; font-size: 14px }
</style>
<body>
<p align="center"> ����ѡ����Ҫ�ϴ����ļ�</p>
<form id="form1" name="form1" method="post" action="servlet/fileServlet" enctype="multipart/form-data">
 <table border="0" align="center">
  <tr>
   <td>�ϴ��ˣ�</td>
   <td>
    <input name="filename" type="text" id="filename" size="20" ></td>
  </tr>   
  <tr>
   <td>�ϴ��ļ���</td>
   <td><input name="file" type="file" size="20" ></td>
  </tr>    
  <tr>   
   <td></td><td>
    <input type="submit" name="submit" value="�ύ" >
    <input type="reset" name="reset" value="����" >
   </td>
  </tr>
 </table>
</form>
</body>
</html>