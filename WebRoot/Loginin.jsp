<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="java.util.*"%>
<% request.setCharacterEncoding("gbk");
   response.setContentType("text/html;charset=gbk"); %> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>index</title>
<link href="css/enter.css" rel="stylesheet" type="text/css" />
</head>
<script language=Javascript>

    
      function show(o){
 //������֤��
 var timenow = new Date().getTime();
 o.src="image.action?d="+timenow;
 
}

function tijiao(){
if(document.admin.username.value=="")
{	alert('�û�������Ϊ��');
	return false;
}


if(document.admin.password.value=="")
{
	alert('���벻��Ϊ��');
	return false;
}

if(document.admin.code.value=="")
{
alert('��֤�벻��Ϊ��');
return false;
}
 

document.admin.submit();

}
</script>



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
      <form method="post" name="admin" action="ValidateUser.jsp">
      <input type="hidden" name="hd" value="deng"class="b1""/>
        	<div id="pace">
           	  	<div id="logo"><img src="images/h1.jpg" alt="logo" /></div>
              	<div id="name" style="top: 139px; left: 63px; width: 302px; height: 21px;">
              		<p>�û�����</p>
                	<input style="background:#999999" type="text" name="username"  class="b1"/>
              	    <span><a href="Register.jsp">ע�����û�</a></span>                   </div>
                <div id="psw" style="top: 159px; height: 48px; left: 63px; width: 358px;">
              		<p>�� �룺</p>
                	<input style="background:#999999" type="password" name="password" class="b2"/>
                    <span><a href="pwdforget.jsp">��������</a></span> 
                    <div></div>
                    <div></div>
                    <div>
                    <p>��֤�룺</p> 
                	<a><input type="text" style="background: rgb(136, 136, 136) none repeat scroll 0% 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;" name="code" class="b2" value=""/></a><img alt="��֤��"  border="0" height="20" name="random"  src="image.action" width="55" id="random" align="absmiddle"/><a href="javascript:show(document.getElementById('random'))" >������,��һ��</a>                  </div>
                
               </div>
    
              
                <div id="btn">
                <div></div>
                	<input type="button"  value="��¼" class="b1" onclick="tijiao()"/>
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
