<%@ page language="java" import="com.zx.shopping.user.*" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>

<%

request.setCharacterEncoding("GBK");
String action = request.getParameter("action");

if(action != null && action.trim().equals("register")) {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
	String phone = request.getParameter("phone");
    String addr = request.getParameter("addr");
	String email = request.getParameter("email");
	User u = new User();
    u.setUsername(username);
	u.setPassword(password);
	u.setPhone(phone);
	u.setAddr(addr);
	u.setEmail(email);
	u.setRdate(new Date());
	u.save();

response.setHeader("refresh", "0;URL=Loginin.jsp");//�����3,����Ҫȷ����ʱ����URL��Ҫ��ת�ĵ�ַ


			
}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>index</title>
<link href="css/register.css" rel="stylesheet" type="text/css" />
</head>

<script language=Javascript>

    
      function show(o){
 //������֤��
 var timenow = new Date().getTime();
 o.src="image.action?d="+timenow;
 
}

function tijiao(){
if(document.register.username.value=="")
{	alert('�û�������Ϊ��');
	return false;
}


if(document.register.password.value=="")
{
	alert('���벻��Ϊ��');
	return false;
}

if(document.register.password2.value=="")
{
	alert('���벻��Ϊ��');
	return false;
}

if(document.register.password2.value!=document.register.password.value)
{
	alert('���������벻һ��');
	return false;
}

if(document.register.code.value=="")
{
alert('��֤�벻��Ϊ��');
return false;
}
 

document.register.submit();

}
</script>
<body>
<!--wrap-->
<div id="wrap">
	<!--top-->
	<div id="header">
    	<h1><img src="images/h1.jpg" alt="Gopile" /></h1>
        <div id="welcome">���ã���ӭ����������ˮ���̳ǣ�</div>
    </div>
    <!--content-->
<form method="post" name="register" action="Register.jsp" >
<input type="hidden" name="action" value="register"/>
    <div id="content">
   	  <div id="ttl">ע���˺�</div>
        <div id="size">
        	<p>�û���</p>
            <input type="text" class="txt" name="username" />
        </div>
        <div id="size">
       	  <p>��&nbsp;��</p>
            <input type="password" class="txt" name="password"/>
        </div>
        <div id="size">
       	  <p>ȷ������</p>
            <input type="password" class="txt" name="password2"/>
        </div>
        <div id="size">
       	  <p>��&nbsp;&nbsp;��</p>
            <input type="text" class="txt" name="phone"/>
        </div>

		  <div id="size">
       	  <p>��&nbsp;&nbsp;��</p>
            <input type="text" class="txt" name="email"/>
        </div>

		  <div id="size">
       	  <p>��&nbsp;&nbsp;ַ</p>
            <input type="text" class="txt" name="addr" />
        </div>
        <div id="size">
       	  <p>��֤��</p>
            <input type="text" class="txt1" name="code"/>
            <dl>
           	  <dt><img name="random"  src="image.action" id="random" alt="��֤��" /></dt>
                <dd>
                	<span>�����壿</span><a href="javascript:show(document.getElementById('random'))">��һ��</a>
              </dd>
            </dl>
        </div>
        <div id="size1">
          <input type="button" value="ͬ���û�Э�鲢ע��" class="btn" onclick="tijiao()"/>
          <p><a href="#">�鿴�û�Э��</a></p>
        </div>
    </div>
    </form>
    
    <script language="JavaScript">
    document.register.username.focus();
    </script>

    
    
    
    
    
    
    
    
    
    
	<!--//content-->
    <!--ads-->
    <div id="ads"></div>
    <!--//ads-->
    <!--bottom-->
    <div id="bottom">
   		<p>������ˮ���̳�</p>
        <p>��ϵ�绰��18036095723/p>
        <p>Copyright 2013-2014 ˮ����</p>
    </div>

</div>
<!--//wrap-->
</body> 
</html>
