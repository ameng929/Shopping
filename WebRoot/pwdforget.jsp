<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>��������</title>
<style type="text/css">
#left{
float:left;
width:700px;
padding:10px 20px 30px 100px;
}

#right{
float:left;
width:324px;
padding-top:100px;
}

</style>
</head>
<body>
<div id="body">
<form id="f1" action="userregister.action" method="post" onsubmit="return fun()">
<div id="left">
ע�����ƣ�<input type="text" name="mylogin.name" id="name" onblur="fun1()" size="22">
<br/>
ע�����䣺<input type="text" name="mylogin.email"  onblur="fun3()" id="email">
<br/>
<input type="submit" value="��֤" >&nbsp;&nbsp;&nbsp;&nbsp;
</div>
</form>
<div id="right">
�ǵ����룬���ھ�<a href="Loginin.jsp">��¼</a>
</div>
</div>
</body>
</html>dy>
</html>